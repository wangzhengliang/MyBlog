package com.blog.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.blog.po.Diarytype;
import com.blog.service.DiaryTypeService;

@Controller
public class DiaryTypeController {
	
	@Autowired
	DiaryTypeService diarypeTyService;
	
	@RequestMapping("/updateType")
	public @ResponseBody String updateType(Integer id,String name) throws Exception{
		Diarytype diarytype = new Diarytype(id,name);
		diarypeTyService.updateType(diarytype);
		return "1";
	}
	
	@RequestMapping("/getOneType")
	public @ResponseBody Diarytype getOneType(Integer id) throws Exception{
		Diarytype diarytype = diarypeTyService.getOneTypeByid(id);
		return diarytype;
	}
	
	@RequestMapping("/delType")
	public @ResponseBody String delType(Integer id){
		diarypeTyService.delTypeById(id);
		return "1";
	}
	
	@RequestMapping("/addNewType")
	public @ResponseBody String addNewType(String tname) throws Exception{
		Diarytype diarytypeIsExit = diarypeTyService.findTypeByName(tname);
		if(diarytypeIsExit != null){
			return "2";
		}
		Diarytype diarytype = new Diarytype(tname);
		diarypeTyService.insertDiaryType(diarytype);
		return "1";
	}
	
	@RequestMapping("/toTypeManage")//到类型管理界面，之前要查询所有标签
	public ModelAndView toTypeManage() throws Exception{
		ModelAndView modelAndView = new ModelAndView();
		List<Diarytype> typeList = diarypeTyService.getAllDiaryType();
		modelAndView.addObject("typeList", typeList);
		modelAndView.addObject("manageMainTemp", "diaryTypeList.jsp");
		modelAndView.setViewName("manageTemp");
		return modelAndView;
	}
}
