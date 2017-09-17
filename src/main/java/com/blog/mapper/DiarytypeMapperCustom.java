package com.blog.mapper;

import com.blog.po.Diarytype;

public interface DiarytypeMapperCustom {
	public Diarytype findTypeByName(String name) throws Exception;
}
