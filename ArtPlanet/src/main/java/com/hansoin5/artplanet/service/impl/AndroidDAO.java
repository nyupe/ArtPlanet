package com.hansoin5.artplanet.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Repository
public class AndroidDAO {

	// sqlSessionTemplate주입 받는다
	@Resource(name = "template")
	private SqlSessionTemplate template;

	public List<Map> selectPictures(Map map) {
		return template.selectList("androidSelectListGCS", map);
	}
}
