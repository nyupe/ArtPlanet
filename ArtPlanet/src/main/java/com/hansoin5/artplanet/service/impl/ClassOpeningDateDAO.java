package com.hansoin5.artplanet.service.impl;

import com.hansoin5.artplanet.service.ClassOpeningDateDTO;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class ClassOpeningDateDAO
{
  @Resource(name="template")
  private SqlSessionTemplate template;
  
  public List<ClassOpeningDateDTO> selectList(Map map)
  {
    return this.template.selectList("OpeningDateSelectList",map);
  }
  
  public int insert(Map map)
  {
    return this.template.insert("openingDateInsert", map);
  }
  
  public int update(Map map)
  {
    return this.template.update("openingDateUpdate", map);
  }
  public int delete(Map map)
  {
    return this.template.delete("openingDateDelete", map);
  }
  
}
