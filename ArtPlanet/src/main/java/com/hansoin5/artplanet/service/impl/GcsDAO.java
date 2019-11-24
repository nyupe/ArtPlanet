package com.hansoin5.artplanet.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.hansoin5.artplanet.service.GcsDTO;

@Repository
public class GcsDAO
{
	//sqlSessionTemplate주입 받는다
	@Resource(name="template")
	private SqlSessionTemplate template;
	
	public int editorUploadImage(Map map)
	{
		return template.insert("editor-uploadImage",map);
	}
	public int uploadImage(Map map)
	{
		return template.insert("uploadImage",map);
	}
	/* 프로젝트 작성폼 업로드 이미지 등록 */
	public int projectUploadImage(Map map) {
		return template.insert("project-uploadImage",map);
	}/////
	
	public List<GcsDTO> getListByClassNo(String classNo)
	{
		return template.selectList("getListByClassNo",classNo);
	}
	public String getFileNoByURL(String fileUrl)
	{
		return template.selectOne("getFileNoByURL", fileUrl);
	}
	public int updateBlogNo(Map map)
	{
		return template.update("updateBlogNo", map);
	}
	
	public int updateClassNo(Map map)
	{
		return template.update("updateClassNo", map);
	}
}
