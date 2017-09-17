package com.blog.controller;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.blog.po.Manager;
import com.blog.service.ManagerService;

@Controller
public class UserController {
	
	@Autowired
	private ManagerService managerService;
	
	
	@RequestMapping("/login")
	public ModelAndView login(Manager manager,HttpServletRequest request) throws Exception{
		
		Manager m = managerService.login();
		if(m.getMname().equals(manager.getMname()) && m.getMpassword().equals(manager.getMpassword())){
			request.getSession().setAttribute("currentManager", manager);
			return new ModelAndView(new RedirectView("toDiaryList.action"));
		}else{
			ModelAndView modelAndView = new ModelAndView();
			modelAndView.addObject("msg", "用户名或密码错误");
			modelAndView.setViewName("manageLogin");
			return modelAndView;
		}
	}
	
	@RequestMapping("/toLogin")
	public ModelAndView toLogin(){
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("manageLogin");
		return modelAndView;
	}
}
