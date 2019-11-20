package com.hansoin5.artplanet.service.impl;

import com.hansoin5.artplanet.service.ArtClassDTO;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class ArtClassDAO
{
  @Resource(name="template")
  private SqlSessionTemplate template;
  
  public List<ArtClassDTO> selectList()
  {
    return this.template.selectList("ClassSelectList");
  }
  
  public ArtClassDTO selectOne(Map map) {
	  return template.selectOne("classSelectOne", map);
  }
  
  public int delete(Map map)
  {
    this.template.delete("classInfoDelete", map);
    return this.template.delete("classDelete", map);
  }
  
  public int insert(Map map)
  {
    return this.template.insert("classInsert", map);
  }
  
  public int update(Map map)
  {
    return this.template.update("classUpdate", map);
  }
}
