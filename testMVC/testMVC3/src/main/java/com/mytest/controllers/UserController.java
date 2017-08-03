package com.mytest.controllers;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mytest.Exception.MyException;
import com.mytest.beans.NavTree;
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
	@ResponseBody
	public Object addUser(User user){
		userService.addUser(user);
		return 1;
	}
	
	@RequestMapping("login.do")
	@ResponseBody
	public Object login(User user,HttpServletRequest request){
		User userinfo = userService.selectUser(user);
		request.getSession().setAttribute("userinfo", userinfo);
		if(userinfo!=null){
			return 1;
		}else{
			return 0;
		}
	}
	
	@RequestMapping("logout.do")
	public String logout(HttpServletRequest request){
		HttpSession session = request.getSession();
		session.removeAttribute("userinfo");
		return "newlogin.jsp";
	}
	
	@RequestMapping("getUserInfo.do")
	public ModelAndView getUserInfo(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/newmain.jsp");
		return mv;
	}
	
	@RequestMapping("deleteUserInfo.do")
	@ResponseBody
	public Object deleteUserInfo(String ids){
		String[] array = ids.split(",");
		List<String> list = new ArrayList <String> ();
		for(int i=0;i<array.length;i++){
			list.add(array[i]);
		}
		Integer affectrows = userService.deleteUserInfo(list);
		return affectrows;
	}
	
	@RequestMapping("editUserInfo.do")
	@ResponseBody
	public Object editUserInfo(Long id){
		User userInfo = userService.getUserInfoById(id);
		return userInfo;		
	}
	
	@RequestMapping("updateUserInfo.do")
	@ResponseBody
	public Object updateUserInfo(User user){
		userService.updateUserInfo(user);
		return 1;
	}
	
	@RequestMapping("selectTree.do")
	@ResponseBody
	public Object selectTree(Long id){
		List<NavTree> list = userService.selectTree(id);
		return list;
	}
	
	@RequestMapping("manager.do")
	public String manager(){		
		return "manager.jsp";
	}
	
	@RequestMapping("getInfo.do")
	@ResponseBody
	public Object getInfo(HttpServletRequest request){
		Integer page = Integer.valueOf(request.getParameter("page"));
		Integer pageSize = Integer.valueOf(request.getParameter("rows"));
		String sort = request.getParameter("sort");
		String order = request.getParameter("order");
		
		String search_username = request.getParameter("search_username");
		String birthday_from = request.getParameter("birthday_from");
		String birthday_to = request.getParameter("birthday_to");
		
		Integer start = pageSize * (page-1);
		Map map = new HashMap();
		map.put("page", page);
		map.put("pageSize", pageSize);
		map.put("sort", sort);
		map.put("order", order);
		map.put("start", start);
		map.put("search_username", search_username);
		map.put("birthday_from", birthday_from);
		map.put("birthday_to", birthday_to);
		List<User> userinfos = userService.getUserInfo(map);
		
		Map map2 = new HashMap();
		Integer total = userService.selectCount();
		map2.put("total", total);
		map2.put("rows", userinfos);
		return map2;
	}
}
