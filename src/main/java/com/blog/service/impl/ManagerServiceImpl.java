package com.blog.service.impl;

import org.springframework.beans.factory.annotation.Autowired;

import com.blog.mapper.ManagerMapper;
import com.blog.po.Manager;
import com.blog.service.ManagerService;

public class ManagerServiceImpl implements ManagerService{

	@Autowired
	ManagerMapper managerMapper;
	
	@Override
	public Manager login() throws Exception {
		return managerMapper.selectByPrimaryKey(1);
	}

}
