package com.hansoin5.artplanet.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.hansoin5.artplanet.service.BlogPostDTO;
import com.hansoin5.artplanet.service.TagDTO;
import com.hansoin5.artplanet.service.TagRelationDTO;

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
	public List<String> imgTagSearch(Map map)
	{
		return template.selectList("imgTagSearch", map);
	}
	public List<String> tagRelSearch(Map map)
	{
		return template.selectList("tagRelSearch", map);
	}
	public List<BlogPostDTO> getDtoByList(Map map)
	{
		return template.selectList("getDtoByList", map);
	}
	//안드로이드용
	public List<BlogPostDTO> getDtoByListNoPaging(Map map)
	{
		return template.selectList("getDtoByListNoPaging", map);
	}

	//댓글관련
	
	//코멘트 등록
	public void insertcomment(Map map) {
		template.insert("BlogInsertComment",map);
	}
	
	//코멘트 삭제
	public void commentDelete(Map map) {
		template.delete("BlogDeleteComment",map);
	}
	
	//코멘트 리스트
	public List<Map> selectcomment(Map map){
		return template.selectList("BlogSelectListComment",map);
	}
}
