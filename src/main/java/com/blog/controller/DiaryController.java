package com.blog.controller;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.blog.po.Diary;
import com.blog.po.Diarytype;
import com.blog.service.DiaryService;
import com.blog.service.DiaryTypeService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

/**
 * 关于日志所有操作的控制器
 * @author zhengliang
 *
 */
@Controller
public class DiaryController {
	
	@Autowired
	private DiaryService diaryService;
	
	@Autowired
	private DiaryTypeService diaryTypeService;
	
	public PageInfo toPage(Integer pn) throws Exception{
		PageHelper.startPage(pn, 7);
		List<Diary> list = diaryService.getAllDiary();
		PageInfo pageInfo = new PageInfo(list,5);
		return pageInfo;
	}
	
	@RequestMapping("/toWjianli")
	public ModelAndView toWjianli() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("wjianli");
		return modelAndView;
	}
	
	@RequestMapping("/deleteDiary")
	public @ResponseBody String deleteDiary(Integer id) throws Exception{
		diaryService.deleteDiaryById(id);
		return "1";
	}
	
	@RequestMapping("/showDiaryForTypeId")
	public ModelAndView showDiaryForTypeId(@RequestParam(defaultValue="1") Integer pn,Integer id) throws Exception{
		ModelAndView modelAndView = new ModelAndView();
		PageHelper.startPage(pn, 5);
		List<Diary> list = diaryService.findDiaryByTypeid(id);
		PageInfo pageInfo = new PageInfo(list,5);
		modelAndView.addObject("pageInfo", pageInfo);
		List<Diarytype> diaryTypeList = diaryTypeService.getAllDiaryType();
		modelAndView.addObject("diaryTypeList", diaryTypeList);
		modelAndView.addObject("mainTemp", "welcome_article_list.jsp");
		modelAndView.setViewName("welcome");
		return modelAndView;
	}
	
	//后台
	@RequestMapping("/serachByTypeId")
	public ModelAndView serachByTypeId(@RequestParam(defaultValue="1") Integer pn, Integer id) throws Exception{
		ModelAndView modelAndView = new ModelAndView();
		PageHelper.startPage(pn, 5);
		List<Diary> list = diaryService.findDiaryByTypeid(id);
		PageInfo pageInfo = new PageInfo(list,5);
		modelAndView.addObject("pageInfo", pageInfo);
		List<Diarytype> typeList = diaryTypeService.getAllDiaryType();
		modelAndView.addObject("typeList", typeList);
		modelAndView.addObject("manageMainTemp", "manageDiaryList.jsp");
		modelAndView.setViewName("manageTemp");
		return modelAndView;
	}
	
	@RequestMapping("/saveDiary")
	public String saveDiary(HttpServletRequest request, MultipartFile image) throws Exception{
		
		String newName = null;
		//图片上传
		String originalFilename = image.getOriginalFilename();
		System.out.println(originalFilename.length());
		
		if(originalFilename.length() != 0){
			
			//获取图片后缀
			String lastName = originalFilename.substring(originalFilename.indexOf("."));
			if(".jpg".equals(lastName) || ".png".equals(lastName) || ".gif".equals(lastName) || ".jpeg".equals(lastName) || ".bmp".equals(lastName)){
				if(image != null && originalFilename!= null && originalFilename.length() > 0){
					//开始上传图片
					String path = "G:\\tomcat_pic_service\\Blog\\images\\";
					
					//设置新的照片名字
					newName = UUID.randomUUID() + lastName;
					
					File file = new File(path+newName);
					
					image.transferTo(file);
				}
			}
		}
		
		String title = request.getParameter("title");
		String content_base = request.getParameter("content_base");
		String content = request.getParameter("content");
		String typeid = request.getParameter("typeid");
		//String image = request.getParameter("image");
		Diary diary = new Diary(null, title, content_base, content, newName, Integer.parseInt(typeid));
		diaryService.saveDiary(diary);
		return "redirect:toDiaryList.action";
	}
	
	@RequestMapping("/updateDiary")
	public @ResponseBody String updateDiary(HttpServletRequest request) throws Exception{
		//String title = request.getParameter("title");
		//"did="+diaryid+"&title="+title+"&content="+content+"&typeid="+typeid,
		String id = request.getParameter("did");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String typeid = request.getParameter("typeid");
		Diary diary = new Diary(Integer.parseInt(id), title, content, content, null, Integer.parseInt(typeid));
		diaryService.updateDiary(diary);
		return "1";
	}
	
	@RequestMapping("/toEditDiary")
	public ModelAndView toEditDiary(Integer id) throws Exception{
		ModelAndView modelAndView = new ModelAndView();
		Diary diary = diaryService.findDiaryById(id);
		modelAndView.addObject("diary", diary);
		List<Diarytype> list = diaryTypeService.getAllDiaryType();
		modelAndView.addObject("typeList", list);
		modelAndView.addObject("manageMainTemp", "editDiary.jsp");
		modelAndView.setViewName("manageTemp");
		return modelAndView;
	}
	
	@RequestMapping("/test")
	public ModelAndView test(){
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("welcome");
		return modelAndView;
	}
	
	@RequestMapping("/toNewDiary")
	public ModelAndView toNewDiary() throws Exception{
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("manageMainTemp", "newDiary.jsp");
		List<Diarytype> typeList = diaryTypeService.getAllDiaryType();
		modelAndView.addObject("typeList", typeList);
		modelAndView.setViewName("manageTemp");
		return modelAndView;
	}
	
	@RequestMapping("toDiaryList")
	public ModelAndView toDiaryList(@RequestParam(defaultValue="1") Integer pn) throws Exception{
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("pageInfo", toPage(pn));
		modelAndView.addObject("manageMainTemp", "manageDiaryList.jsp");
		List<Diarytype> typeList = diaryTypeService.getAllDiaryType();
		modelAndView.addObject("typeList", typeList);
		modelAndView.setViewName("manageTemp");
		return modelAndView;
	}
	
	
	//显示一篇文章
	@RequestMapping("/showDiary")
	public void showDiary2(int id,HttpServletRequest request,HttpServletResponse reponse) throws Exception{
		ModelAndView modelAndView = new ModelAndView();
		Diary diary = diaryService.findDiaryById(id);
		request.setAttribute("diary", diary);
		request.setAttribute("mainTemp", "welcome_article_details.jsp");
		List<Diarytype> list = diaryTypeService.getAllDiaryType();
		request.setAttribute("diaryTypeList", list);
		request.getRequestDispatcher("WEB-INF/jsp/welcome.jsp").forward(request, reponse);
	}
	
	//显示一篇文章(弃用)
	@RequestMapping("/showDiaryt")
	public ModelAndView showDiary(int id) throws Exception{
		ModelAndView modelAndView = new ModelAndView();
		Diary diary = diaryService.findDiaryById(id);
		modelAndView.addObject("diary", diary);
		modelAndView.setViewName("afterMainTemp");
		return modelAndView;
	}
	
	@RequestMapping("/showDiaryForType")
	public ModelAndView showDiaryForType(Integer id) throws Exception{
		ModelAndView modelAndView = new ModelAndView();
		Diary diaryList = diaryService.findDiaryById(id);
		modelAndView.addObject("diaryList", diaryList);
		modelAndView.addObject("mainTemp", "DiaryListForType");
		modelAndView.setViewName("welcome");
		return modelAndView;
	}
	
	
	//展示所有文章(用于welcome系列)
	@RequestMapping("/getAllDiary")
	public ModelAndView getAllDiary2(@RequestParam(defaultValue="1") Integer pn) throws Exception{
		ModelAndView modelAndView = new ModelAndView();
		PageHelper.startPage(pn, 5);
		List<Diary> list = diaryService.getAllDiary();
		PageInfo pageInfo = new PageInfo(list,5);
		modelAndView.addObject("pageInfo", pageInfo);
		List<Diarytype> diaryTypeList = diaryTypeService.getAllDiaryType();
		modelAndView.addObject("diaryTypeList", diaryTypeList);
		modelAndView.addObject("mainTemp", "welcome_article_list.jsp");
		modelAndView.setViewName("welcome");
		return modelAndView;
	}
	
}
