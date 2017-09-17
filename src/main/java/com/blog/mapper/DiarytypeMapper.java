package com.blog.mapper;

import com.blog.po.Diarytype;
import com.blog.po.DiarytypeExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface DiarytypeMapper {
    long countByExample(DiarytypeExample example);

    int deleteByExample(DiarytypeExample example);

    int deleteByPrimaryKey(Integer tid);

    int insert(Diarytype record);

    int insertSelective(Diarytype record);

    List<Diarytype> selectByExample(DiarytypeExample example);

    Diarytype selectByPrimaryKey(Integer tid);

    int updateByExampleSelective(@Param("record") Diarytype record, @Param("example") DiarytypeExample example);

    int updateByExample(@Param("record") Diarytype record, @Param("example") DiarytypeExample example);

    int updateByPrimaryKeySelective(Diarytype record);

    int updateByPrimaryKey(Diarytype record);
}