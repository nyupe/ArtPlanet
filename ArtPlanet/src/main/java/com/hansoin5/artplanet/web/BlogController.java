package com.hansoin5.artplanet.web;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;

import com.google.cloud.storage.Acl;
import com.google.cloud.storage.Acl.Role;
import com.google.cloud.storage.Acl.User;
import com.google.cloud.storage.BlobInfo;
import com.google.cloud.storage.Storage;
import com.google.cloud.storage.StorageOptions;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Arrays;

import javax.servlet.ServletException;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
public class BlogController
{
	private static Storage storage = null;

	  // [START init]
	  static {
	    storage = StorageOptions.getDefaultInstance().getService();
	  }
	  // [END init]
	// [START uploadFile]

	  /**
	   * Uploads a file to Google Cloud Storage to the bucket specified in the BUCKET_NAME
	   * environment variable, appending a timestamp to end of the uploaded filename.
	   */
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
	    return blobInfo.getMediaLink();
	  }
	  // [END uploadFile]

	  // [START getImageUrl]

	  /**
	   * Extracts the file payload from an HttpServletRequest, checks that the file extension
	   * is supported and uploads the file to Google Cloud Storage.
	   */
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
	
    @RequestMapping(value = "/FileUpload") //ajax에서 호출하는 부분
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
    /*
    @ResponseBody
    @RequestMapping(value = "/FileUploadToCloud")
    public String uploadToCloud() {
    	
    }
    */
    
}
