package com.blog.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.blog.mapper.DiarytypeMapper;
import com.blog.mapper.DiarytypeMapperCustom;
import com.blog.po.Diarytype;
import com.blog.service.DiaryTypeService;

public class DiaryTypeServiceImpl implements DiaryTypeService{

	@Autowired
	DiarytypeMapper diarytypeMapper;
	
	@Autowired
	DiarytypeMapperCustom diarytypeMapperCustom;
	
	public List<Diarytype> getAllDiaryType() throws Exception {
		return diarytypeMapper.selectByExample(null);
	}

	@Override
	public void insertDiaryType(Diarytype diarytype) throws Exception {
		diarytypeMapper.insert(diarytype);
	}

	@Override
	public Diarytype findTypeByName(String name) throws Exception {
		return diarytypeMapperCustom.findTypeByName(name);
	}

	@Override
	public void delTypeById(int id) {
		diarytypeMapper.deleteByPrimaryKey(id);
	}

	@Override
	public Diarytype getOneTypeByid(int id) throws Exception {
		return diarytypeMapper.selectByPrimaryKey(id);
	}

	@Override
	public void updateType(Diarytype diarytype) throws Exception {
		diarytypeMapper.updateByPrimaryKey(diarytype);
	}

	

}
