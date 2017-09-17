package com.blog.mapper;

import java.util.List;

import com.blog.po.Diary;

public interface DiaryMapperCustom {
	public List<Diary> getAllDiary() throws Exception;
	public Diary findDiaryById(int id) throws Exception;
	public void insertDiary(Diary diary) throws Exception;
	public List<Diary> findDiaryByTypeid(int id) throws Exception;
}
