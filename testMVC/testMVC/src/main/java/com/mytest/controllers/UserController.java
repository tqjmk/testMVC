package com.mytest.controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mytest.Exception.MyException;
import com.mytest.beans.Search;
import com.mytest.beans.User;
import com.mytest.services.IUserService;

@Controller
public class UserController {
	@Autowired
	private IUserService userService;
	
	@RequestMapping("initProvince.do")
	@ResponseBody
	public Object initProvince(){
		return userService.listProvince();
	}
	
	@RequestMapping("initCityByProvince.do")
	@ResponseBody
	public Object initCityByProvince(Long provinceId){
		return userService.listCity(provinceId);
	}
	
	@RequestMapping("initStreetByCity.do")
	@ResponseBody
	public Object initStreetByCity(Long cityId){
		return userService.listStreet(cityId);
	}
	
	@RequestMapping("addUser.do")
	public String addUser(User user){
		userService.addUser(user);
		return "registersuccess.jsp";
	}
	
	@RequestMapping("login.do")
	public String register(User user,HttpServletRequest request){
		User userinfo = userService.selectUser(user);
		request.getSession().setAttribute("userinfo", userinfo);
		if(userinfo!=null){
			return "getUserInfo.do";
		}else{
			return "redirect:fail.jsp";
		}
	}
	
	@RequestMapping("getUserInfo.do")
	public ModelAndView getUserInfo(){
		ModelAndView mv = new ModelAndView();
		List<User> userinfos = userService.getUserInfo();
		mv.addObject("userinfos", userinfos);
		mv.setViewName("/main.jsp");
		return mv;
	}
	
	@RequestMapping("deleteUserInfo.do")
	public String deleteUserInfo(Long id){
		userService.deleteUserInfo(id);
		return "getUserInfo.do";
	}
	
	@RequestMapping("editUserInfo.do")
	public ModelAndView editUserInfo(Long id){
		ModelAndView mv = new ModelAndView();
		User userInfo = userService.getUserInfoById(id);
		System.out.println(userInfo);
		mv.addObject("userInfo", userInfo);		
		mv.setViewName("/edit.jsp");
		return mv;		
	}
	
	@RequestMapping("updateUserInfo.do")
	public String updateUserInfo(User user){
		userService.updateUserInfo(user);
		return "getUserInfo.do";
	}
	
	@RequestMapping("searchUser.do")
	public ModelAndView searchUser(Search search){
		List <User> userinfo = userService.searchUser(search);
		System.out.println(userinfo);
		ModelAndView mv = new ModelAndView();
		mv.addObject("userinfos", userinfo);
		mv.addObject("search", search);
		mv.setViewName("/main.jsp");
		return mv;
	}
	
	@RequestMapping("testTransaction.do")
	public String testTransaction() throws MyException{
		userService.testTransaction();
		return "getUserInfo.do";
	}
}
