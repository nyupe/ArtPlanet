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
<<<<<<< HEAD
		return template.insert("blog-uploadImage",map);
	}

=======
		return template.insert("uploadImage",map);
	}
>>>>>>> branch 'master' of https://github.com/nyupe/ArtPlanet.git
	public List<GcsDTO> getListByClass(Map map)
	{
		return template.selectList("artclass-getImages",map);
<<<<<<< HEAD
	}

=======
	}
>>>>>>> branch 'master' of https://github.com/nyupe/ArtPlanet.git
	public String getFileNoByURL(String fileUrl)
	{
		return template.selectOne("getFileNoByURL", fileUrl);
	}
	public int updateBlogNo(Map map)
	{
<<<<<<< HEAD
		return template.update("updateBlogNo", map);

=======
		return template.update("updateBlogNo", map);
>>>>>>> branch 'master' of https://github.com/nyupe/ArtPlanet.git
	}
}
