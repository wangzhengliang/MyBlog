package com.blog.mapper;

import com.blog.po.Diary;
import com.blog.po.DiaryExample;
import com.blog.po.DiaryWithBLOBs;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface DiaryMapper {
    long countByExample(DiaryExample example);

    int deleteByExample(DiaryExample example);

    int deleteByPrimaryKey(Integer did);

    int insert(DiaryWithBLOBs record);

    int insertSelective(DiaryWithBLOBs record);

    List<DiaryWithBLOBs> selectByExampleWithBLOBs(DiaryExample example);

    List<Diary> selectByExample(DiaryExample example);

    DiaryWithBLOBs selectByPrimaryKey(Integer did);

    int updateByExampleSelective(@Param("record") DiaryWithBLOBs record, @Param("example") DiaryExample example);

    int updateByExampleWithBLOBs(@Param("record") DiaryWithBLOBs record, @Param("example") DiaryExample example);

    int updateByExample(@Param("record") Diary record, @Param("example") DiaryExample example);

    int updateByPrimaryKeySelective(DiaryWithBLOBs record);

    int updateByPrimaryKeyWithBLOBs(DiaryWithBLOBs record);

    int updateByPrimaryKey(Diary record);
}