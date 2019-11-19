package com.hansoin5.artplanet;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.cloud.storage.Acl;
import com.google.cloud.storage.Acl.Role;
import com.google.cloud.storage.Acl.User;
import com.hansoin5.artplanet.service.impl.BlogPostDAO;
import com.hansoin5.artplanet.service.impl.GcsDAO;
import com.google.cloud.storage.Blob;
import com.google.cloud.storage.BlobId;
import com.google.cloud.storage.BlobInfo;
import com.google.cloud.storage.Storage;
import com.google.cloud.storage.StorageOptions;

import org.joda.time.DateTime;
import org.joda.time.DateTimeZone;
import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;
import org.json.simple.JSONObject;

/* 적용 안되는것 같아서 일단 주석 (대신 web.xml servlet 안 <multipart-config> 태그 추가함)
@MultipartConfig(
		  maxFileSize = 10 * 1024 * 1024, // max size for uploaded files
		  maxRequestSize = 20 * 1024 * 1024, // max size for multipart/form-data
		  fileSizeThreshold = 5 * 1024 * 1024 // start writing to Cloud Storage after 5MB
		)
*/
@Controller
public class GcsController
{
	@Resource(name="gcsDAO")
	private GcsDAO dao;
	
	public static final String BUCKET_NAME = "art-planet-storage";// 버켓명

	private static Storage storage = null;

	static
	{
		storage = StorageOptions.getDefaultInstance().getService();// 인증
	}

	public Map uploadGcs(HttpServletRequest req, HttpServletResponse resp, final String bucket) throws IOException, ServletException
	{
		Part filePart = req.getPart("file");
		final String fileName = filePart.getSubmittedFileName();
		String imageUrl = req.getParameter("imageUrl");
		// 파일의 확장자 확인
		if (fileName != null && !fileName.isEmpty() && fileName.contains("."))
		{
			String extension = fileName.substring(fileName.lastIndexOf('.') + 1); // 확장자
			String[] allowedExt =
			{ "jpg", "jpeg", "png", "gif" };
			for (String s : allowedExt)
			{
				if (extension.equals(s))
				{
					return this.uploadFile(filePart, bucket, extension, req.getParameter("role"));
				}
			}
			// throw new ServletException("이미지만 업로드 할 수 있습니다.");
		}

		return null;
	}

	@SuppressWarnings("deprecation")
	public Map uploadFile(Part filePart, final String bucketName, String extension, String path) throws IOException
	{
		// 파일 중복 막기 위한 네이밍 로직
		DateTimeFormatter dtf = DateTimeFormat.forPattern("YYYY-MM-dd-HHmmssSSS");
		DateTime dt = DateTime.now(DateTimeZone.UTC);
		String dtString = dt.toString(dtf);
		final String fileName = path + "/" + dtString + "_" + filePart.getSubmittedFileName();

		// jpg는 mime타입을 jpeg로 지정해주어야 웹에서 미리보기 가능
		if (extension.equals("jpg"))
			extension = "jpeg";
		// inputstream은 디폴트값으로 알아서 close 되니 따로 close 해줄 필요 없음
		BlobInfo blobInfo = storage.create(BlobInfo.newBuilder(bucketName, fileName).setContentType("image/" + extension)
				// 아래 setAcl()은 객체단위로 권한부여함, 버킷 권한 수준이 버킷 전체일 경우 아래 코드 주석처리
				// .setAcl(new ArrayList<>(Arrays.asList(Acl.of(User.ofAllUsers(),
				// Role.READER))))
				.build(), filePart.getInputStream());

		String[] urlArr = blobInfo.getMediaLink().split("/");
		urlArr[1] = "//";
		urlArr[2] = urlArr[2].replace("www", "storage");
		urlArr[3] = "/";
		urlArr[4] = "";
		urlArr[5] = "";
		urlArr[6] = "";
		urlArr[8] = "/";
		urlArr[9] = urlArr[9].substring(0, urlArr[9].indexOf("?")).replace(path + "%2F", path + "/");
		String fileUrl = "";
		for (String str : urlArr) fileUrl += str;
		String gcsPath = fileUrl.replace("https://storage.googleapis.com/", "gs://");
		Map map = new HashMap();
		map.put("fileName", filePart.getSubmittedFileName());
		map.put("fileUrl", fileUrl);
		map.put("downloadUrl", blobInfo.getMediaLink());
		map.put("gcsPath", gcsPath);
		map.put("fileSize", blobInfo.getSize());

		return map;
	}

	@RequestMapping(value = "/FileUploadToCloud", method = RequestMethod.POST, produces = "text/html; charset=UTF-8")
	@ResponseBody
	public String upload(HttpServletRequest req, HttpServletResponse resp) throws Exception
	{
		Map map = uploadGcs(req, resp, BUCKET_NAME);
		if (map == null)
			return "{'error':'이미지만 업로드 할 수 있습니다.'}";
		
		switch (req.getParameter("role"))
		{
		case "editor":
			dao.editorUploadImage(map);
			break;
		case "blog":
			dao.blogUploadImage(map);
			break;
		case "project":
			break;
		case "artclass":
			break;
		case "profile":
			break;
		case "banner":
			break;

		default:
			break;
		}
		
		return JSONObject.toJSONString(map).replace("\\/", "/"); // 슬래시가 이스케이프처리되는 문제 해결
	}

}
