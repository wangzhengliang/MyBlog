package com.blog.service;

import java.util.List;

import com.blog.po.Diary;

public interface DiaryService {
	public List<Diary> getAllDiary() throws Exception;
	public Diary findDiaryById(int id) throws Exception;
	public void updateDiary(Diary diary) throws Exception;
	public void saveDiary(Diary diary) throws Exception;
	public List<Diary> findDiaryByTypeid(Integer id) throws Exception;
	public void deleteDiaryById(Integer id) throws Exception;
}
