package com.hansoin5.artplanet.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.hansoin5.artplanet.service.BlogPostDTO;

@Repository
public class BlogPostDAO
{
	@Resource(name="template")
	private SqlSessionTemplate template;
	
	public int uploadBlogPost(Map map)
	{
		return template.insert("uploadBlogPost",map);
	}
	public List<BlogPostDTO> selectArtworkList(Map map)
	{
		return template.selectList("selectArtworkList", map);
	}
	public int getTotalCount(Map map)
	{
		return template.selectOne("getTotalCount", map);
	}
	public List<BlogPostDTO> getDtoByBlogNo(Map map)
	{
		return template.selectList("getDtoByBlogNo", map);
	}
	public int updateViewCount(Map map)
	{
		return template.update("updateViewCount", map);
	}
	public List<BlogPostDTO> getDtoByMemberNo(Map map)
	{
		return template.selectList("getDtoByMemberNo", map);
	}
	//회원번호로 public권한만 가져오기
	public List<BlogPostDTO> getPublicByMemberNo(String memberNo)
	{
		return template.selectList("getPublicByMemberNo", memberNo);
	}
}
