package com.blog.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.blog.mapper.DiaryMapper;
import com.blog.mapper.DiaryMapperCustom;
import com.blog.po.Diary;
import com.blog.service.DiaryService;

public class DiaryServiceImpl implements DiaryService{

	
	@Autowired
	private DiaryMapperCustom diaryMapperCustom;
	
	@Autowired
	private DiaryMapper diaryMapper;
	
	/**
	 * 查询所有日志
	 */
	public List<Diary> getAllDiary() throws Exception {
		List<Diary> list = diaryMapperCustom.getAllDiary();
		return list;
	}

	/**
	 * 根据id查询日志
	 */
	public Diary findDiaryById(int id) throws Exception {
		Diary diary = diaryMapperCustom.findDiaryById(id);
		return diary;
	}

	@Override
	public void updateDiary(Diary diary) throws Exception {
		diaryMapper.updateByPrimaryKey(diary);
	}

	@Override
	public void saveDiary(Diary diary) throws Exception {
		diaryMapperCustom.insertDiary(diary);
	}

	@Override
	public List<Diary> findDiaryByTypeid(Integer id) throws Exception {
		return diaryMapperCustom.findDiaryByTypeid(id);
	}

	@Override
	public void deleteDiaryById(Integer id) throws Exception {
		diaryMapper.deleteByPrimaryKey(id);
	}

}
