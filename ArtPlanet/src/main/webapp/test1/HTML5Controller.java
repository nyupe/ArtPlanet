package com.lgcns.html5.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FilenameUtils;
import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class HTML5Controller {

	static final Logger LOG = LoggerFactory.getLogger(HTML5Controller.class);

	/**
	 * @throws IOException
	 * @throws JsonMappingException
	 * @throws JsonGenerationException
	 */
	@RequestMapping("/dragUpload")
	public @ResponseBody String uploadMultipleFileHandler(@RequestParam("file") MultipartFile[] files, @RequestParam("fileNames") String[] fileNames, HttpServletRequest request, HttpServletResponse reponse) throws JsonGenerationException, JsonMappingException, IOException {

		String fileName = "";
		String uploadDir = "C:\\appdev8\\workspace\\html\\web\\upload";
		BufferedOutputStream outputStream = null;
		ObjectMapper objectMapper = new ObjectMapper();
		HashMap<String, Object> resultItemList = new HashMap<String, Object>();
		
		/**
		 * [참고] 
		 * Client에서 http header에 UserDefine 속성명을 추가해서 전달할때 받는 방법
		 * (예) xhr.setRequestHeader("X-File-Name", encodeURIComponent('요청관리3.jpg'));
		 * 
		 *  서버단에서는 다음과 같이 받아서 처리한다.
		 *  -------------------------------------------------------
		 *  String fileName = request.getHeader("X-File-Name");
		 *  fileName = URLDecoder.decode(fileName, "UTF-8");
		 *  -------------------------------------------------------
		 */
		
		int fileCount = files.length;
		
		resultItemList.put("count", fileCount);
		for (int inx = 0; inx < fileCount; inx++) {
			HashMap<String, String> resultItem = new HashMap<String, String>();
			MultipartFile file = files[inx];
			try {
				byte[] bytes = file.getBytes();

				File dir = new File(uploadDir);
				if (!dir.exists()) {
					dir.mkdirs();
				}

				int jnx = 1;
				/**
				 * 업로드된 첨부파일명을 읽어들일 때 'file.getOriginalFilename()' 대신(한글이 깨짐!) 
				 * fileNames[inx] 에 저장된 파일명(한글깨짐을 예방하기 위해 인코딩되어있음)을 사용한다.
				 */
				fileName = URLDecoder.decode(fileNames[inx], "UTF-8");
				File serverFile = new File(dir.getAbsolutePath() + File.separator + fileName);
				System.out.println("fileNames[" + inx + "] : " + fileNames[inx]);
				/**
				 *  dir.getAbsolutePath()      => C:\\appdev8\\workspace\\html\\web\\upload
				 *  File.separator             => \\ (사실은 역슬레쉬 한개)
				 *  file.getOriginalFilename() => 파일명
				 */
				while (serverFile.exists()) {
					serverFile = new File(dir.getAbsolutePath() + File.separator + FilenameUtils.getBaseName(fileName) + "[" + jnx + "]." + FilenameUtils.getExtension(fileName));
					jnx++;
				}

				outputStream = new BufferedOutputStream(new FileOutputStream(serverFile));
				outputStream.write(bytes);

				resultItem.put("result", "true");
				resultItem.put("filename", URLEncoder.encode(serverFile.getName(),"UTF-8")); //encoding해서 Client에 전달해야 한글이 않깨진다.
				resultItemList.put(inx + "", resultItem);

			} catch (Exception e) {
				resultItem.put("result", "false");
				resultItem.put("error", e.getMessage());
				resultItemList.put(inx + "", resultItem);
			} finally {
				try {
					if (outputStream != null) {
						outputStream.close();
					}
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}

		return objectMapper.writeValueAsString(resultItemList);
	}
}
