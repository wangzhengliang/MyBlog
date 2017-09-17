package com.blog.service;

import java.util.List;

import com.blog.po.Diarytype;
import com.blog.po.DiarytypeExample;

public interface DiaryTypeService {
	public List<Diarytype> getAllDiaryType() throws Exception;
	public void insertDiaryType(Diarytype diarytype) throws Exception;
	public Diarytype findTypeByName(String name) throws Exception;
	public void delTypeById(int id);
	public Diarytype getOneTypeByid(int id) throws Exception;
	public void updateType(Diarytype diarytype) throws Exception;
}
