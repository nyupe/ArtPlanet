package com.hansoin5.artplanet.web;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;

import com.google.appengine.tools.cloudstorage.GcsFileOptions;
import com.google.appengine.tools.cloudstorage.GcsFilename;
import com.google.appengine.tools.cloudstorage.GcsOutputChannel;
import com.google.appengine.tools.cloudstorage.GcsService;
import com.google.appengine.tools.cloudstorage.GcsServiceFactory;
import com.google.appengine.tools.cloudstorage.RetryParams;
import com.google.cloud.sql.jdbc.ResultSet;
import com.google.cloud.storage.Acl;
import com.google.cloud.storage.Acl.Role;
import com.google.cloud.storage.Acl.User;
import com.google.cloud.storage.BlobInfo;
import com.google.cloud.storage.Storage;
import com.google.cloud.storage.StorageOptions;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.joda.time.DateTime;
import org.joda.time.DateTimeZone;
import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

//1]파일과 같은 다중 파트 HTML 형식 데이터를 처리하기 위해 필요한 @MultipartConfig 주석을 사용합니다.
@MultipartConfig(
  maxFileSize = 10 * 1024 * 1024, // max size for uploaded files
  maxRequestSize = 20 * 1024 * 1024, // max size for multipart/form-data
  fileSizeThreshold = 5 * 1024 * 1024 // start writing to Cloud Storage after 5MB
)
@Controller
public class BlogController
{
	//2]GcsServiceFactory를 사용하여 .GcsService 객체를 만듭니다.
	private final GcsService gcsService =
		    GcsServiceFactory.createGcsService(
		        new RetryParams.Builder()
		            .initialRetryDelayMillis(10)
		            .retryMaxAttempts(10)
		            .totalRetryPeriodMillis(15000)
		            .build());
	
	//3]버퍼 크기의 변수를 만들고 gcsService 객체를 위한 Cloud Storage 버킷을 만듭니다.
	private static final int BUFFER_SIZE = 2 * 1024 * 1024;
	private final String bucket = "art-planet-storage";
	
	//4]업로드할 파일에서 추출한 파일 이름으로 고유한 Cloud Storage 파일 이름을 만들고 파일을 Cloud Storage에 저장합니다.
	private String storeImage(Part image) throws IOException
	{
		String filename = uploadedFilename(image); // Extract filename
		GcsFileOptions.Builder builder = new GcsFileOptions.Builder();
		
		builder.acl("public-read"); // Set the file to be publicly viewable
		GcsFileOptions instance = GcsFileOptions.getDefaultInstance();
		GcsOutputChannel outputChannel;
		GcsFilename gcsFile = new GcsFilename(bucket, filename);
		outputChannel = gcsService.createOrReplace(gcsFile, instance);
		//copy(filePart.getInputStream(), Channels.newOutputStream(outputChannel));

		return filename; // Return the filename without GCS/bucket appendage
	}	
	//storeImage() 메서드는 파일 권한을 public-read로 설정하여 파일이 공개적으로 표시되도록 만듭니다.
	//이 이미지는 App Engine 도구 라이브러리의 copy() 함수를 사용하여 Cloud Storage에 기록됩니다.
	
	private String uploadedFilename(final Part part)
	{	
		final String partHeader = part.getHeader("content-disposition");
		
		for (String content : part.getHeader("content-disposition").split(";"))
		{
			if (content.trim().startsWith("filename"))
			{
				// Append a date and time to the filename
				DateTimeFormatter dtf = DateTimeFormat.forPattern("-YYYY-MM-dd-HHmmssSSS");
				DateTime dt = DateTime.now(DateTimeZone.UTC);
				String dtString = dt.toString(dtf);
				final String fileName =
				dtString + content.substring(content.indexOf('=') + 1).trim().replace("\"", "");
				
				return fileName;
			}
		}
		return null;
	}
	//위 스니펫에서 uploadedFilename()은 HTTP 헤더에서 파일 이름을 추출하고 타임스탬프를 추가하여 고유한 파일 이름을 만듭니다.
	//storeImage() 메소드는 copy를 사용하여 Cloud Storage에 기록합니다.
	//copy() 메소드는 이미지인 InputStream 객체와 이 예에서 Cloud Storage에 파일을 기록하는 메소드인 createOrReplace()가 되는 OutputStream 객체를 사용합니다.
	private void copy(InputStream input, OutputStream output) throws IOException
	{
		try
		{
			byte[] buffer = new byte[BUFFER_SIZE];
		    int bytesRead = input.read(buffer);
		    while (bytesRead != -1)
		    {
		    output.write(buffer, 0, bytesRead);
		    bytesRead = input.read(buffer);
		    }
		} finally
		{
		    input.close();
		    output.close();
		}

	}
	//5]나중에 조회할 수 있도록 Cloud Storage 파일 이름을 데이터베이스에 저장합니다. 다음 코드는 Cloud SQL을 사용하여 이미지 파일 이름을 저장할 테이블을 만듭니다.
	final String createImageTableSql =
	    "CREATE TABLE IF NOT EXISTS images ( image_id INT NOT NULL "
	        + "AUTO_INCREMENT, filename VARCHAR(256) NOT NULL, "
	        + "PRIMARY KEY (image_id) )";

		//conn.createStatement().executeUpdate(createImageTableSql);
	/*
	public void test()
	{
		if (imageFile.getSize() != 0) { // check if an image has been uploaded

			  // Grab the last autogenerated post ID to associate with image
			  ResultSet lastId = conn.prepareStatement(getLastIdSql).executeQuery();
			  lastId.next(); // move the cursor
			  int postId = lastId.getInt(1); // store the post's ID to associate with image

			  // Store the image file
			  try {
			    String filename = storeImage(imageFile); // Store the image and get the filename
			    // Store a record of the filename in the database
			    try (PreparedStatement statementCreateImage = conn.prepareStatement(createImageSql)) {
			      statementCreateImage.setString(1, filename);
			      statementCreateImage.executeUpdate();

			      lastId = conn.prepareStatement(getLastIdSql).executeQuery();
			      lastId.next(); // Move the cursor
			      int imageId = lastId.getInt(1); // Store the post's ID for insertion later

			      // Associate image with blog post
			      PreparedStatement statementBlogImage = conn.prepareStatement(imageBlogPostSql);
			      statementBlogImage.setInt(1, postId);
			      statementBlogImage.setInt(2, imageId);
			      statementBlogImage.executeUpdate();

			    } catch (SQLException e) {
			      throw new ServletException("SQL error when storing image details", e);
			    }
			  } catch (IOException e) {
			    throw new IOException("Cloud Storage error when storing file", e);
			  }
			}
	}
	*/
	///////////////////////////////////////////////////
	
	@RequestMapping("/Blog")
	public String blog()
	{
		return "contents/blog/Blog.tiles";
	}
	
	@RequestMapping("/ViewPost")
	public String viewpost()
	{
		return "contents/blog/ViewPost.tiles";
	}
	
	@RequestMapping("/WritePost")
	public String writePost()
	{
		return "contents/blog/WritePost.tiles";
	}
	
	@RequestMapping("/EditPost")
	public String editPost()
	{
		return "contents/blog/EditPost.tiles";
	}
	
	@RequestMapping(value = "/fileUpload", method = RequestMethod.GET)
    public String dragAndDrop(Model model) {
         
        return "fileUpload";
         
    }
	
    @RequestMapping(value = "/FileUpload", method = RequestMethod.POST) //ajax에서 호출하는 부분
    @ResponseBody
    public String upload(MultipartHttpServletRequest multipartRequest) { //Multipart로 받는다.
          
        Iterator<String> itr =  multipartRequest.getFileNames();
         
        String filePath = "D:/fileupload-test"; //설정파일로 뺀다.
        String originalFilename = "";
        while (itr.hasNext()) { //받은 파일들을 모두 돌린다.
             
            /* 기존 주석처리
            MultipartFile mpf = multipartRequest.getFile(itr.next());
            String originFileName = mpf.getOriginalFilename();
            System.out.println("FILE_INFO: "+originFileName); //받은 파일 리스트 출력'
            */
             
            MultipartFile mpf = multipartRequest.getFile(itr.next());
      
            originalFilename = mpf.getOriginalFilename(); //파일명
      
            String fileFullPath = filePath+"/"+originalFilename; //파일 전체 경로
      
            try {
                //파일 저장
                mpf.transferTo(new File(fileFullPath)); //파일저장 실제로는 service에서 처리
                 
                System.out.println("originalFilename => "+originalFilename);
                System.out.println("fileFullPath => "+fileFullPath);
      
            } catch (Exception e) {
                System.out.println("postTempFile_ERROR======>"+fileFullPath);
                e.printStackTrace();
            }
                          
       }
          System.out.println("업로드 성공");
        return originalFilename;
    }
    
    @RequestMapping(value = "/FileUploadToCloud")
    @ResponseBody
    public String uploadToCloud(HttpServletRequest req) throws IOException, ServletException {
    	System.out.println("uploadToCloud 호출");
    	for(Part filePart : req.getParts())
    		System.out.println("filePart : "+filePart);
    	//uploadFile(filePart, "art-planet-storage");
    	return "SUCCESS!!!!";
    }
    
    ///////////////////////////////////////////////////GCS github
    /*
    private static Storage storage = null;

	  // [START init]
	  static {
	    storage = StorageOptions.getDefaultInstance().getService();
	  }
	  // [END init]
	// [START uploadFile]

	  
	  //Uploads a file to Google Cloud Storage to the bucket specified in the BUCKET_NAME
	  //environment variable, appending a timestamp to end of the uploaded filename.
	  
	  // Note: this sample assumes small files are uploaded. For large files or streams use:
	  // Storage.writer(BlobInfo blobInfo, Storage.BlobWriteOption... options)
	  public String uploadFile(Part filePart, final String bucketName) throws IOException {
	    DateTimeFormatter dtf = DateTimeFormat.forPattern("-YYYY-MM-dd-HHmmssSSS");
	    DateTime dt = DateTime.now(DateTimeZone.UTC);
	    String dtString = dt.toString(dtf);
	    final String fileName = filePart.getSubmittedFileName() + dtString;
	    System.out.println("fileName:"+fileName);
	    System.out.println(dtString);
	    
	    // The InputStream is closed by default, so we don't need to close it here
	    // Read InputStream into a ByteArrayOutputStream.
	    InputStream is = filePart.getInputStream();
	    ByteArrayOutputStream os = new ByteArrayOutputStream();
	    byte[] readBuf = new byte[4096];
	    while (is.available() > 0) {
	      int bytesRead = is.read(readBuf);
	      os.write(readBuf, 0, bytesRead);
	    }

	    // Convert ByteArrayOutputStream into byte[]
	    BlobInfo blobInfo =
	        storage.create(
	            BlobInfo
	                .newBuilder(bucketName, fileName)
	                // Modify access list to allow all users with link to read file
	                .setAcl(new ArrayList<>(Arrays.asList(Acl.of(User.ofAllUsers(), Role.READER))))
	                .build(),
	            os.toByteArray());
	    // return the public download link
	    System.out.println("blobInfo.getMediaLink() : "+blobInfo.getMediaLink());
	    return blobInfo.getMediaLink();
	  }
	  // [END uploadFile]

	  // [START getImageUrl]

	 
	  //Extracts the file payload from an HttpServletRequest, checks that the file extension
	  //is supported and uploads the file to Google Cloud Storage.
	  
	  public String getImageUrl(HttpServletRequest req, HttpServletResponse resp,
	                            final String bucket) throws IOException, ServletException {
	    Part filePart = req.getPart("file");
	    final String fileName = filePart.getSubmittedFileName();
	    String imageUrl = req.getParameter("imageUrl");
	    // Check extension of file
	    if (fileName != null && !fileName.isEmpty() && fileName.contains(".")) {
	      final String extension = fileName.substring(fileName.lastIndexOf('.') + 1);
	      String[] allowedExt = {"jpg", "jpeg", "png", "gif"};
	      for (String s : allowedExt) {
	        if (extension.equals(s)) {
	          return this.uploadFile(filePart, bucket);
	        }
	      }
	      throw new ServletException("file must be an image");
	    }
	    return imageUrl;
	  }
	  // [END getImageUrl]
     */
    
}
