package com.mytest.services;

import java.util.List;
import java.util.Map;

import com.mytest.Exception.MyException;
import com.mytest.beans.City;
import com.mytest.beans.NavTree;
import com.mytest.beans.Province;
import com.mytest.beans.Search;
import com.mytest.beans.Street;
import com.mytest.beans.User;

public interface IUserService {
	
	public List<Province> listProvince();

	public List<City> listCity(Long provinceId);

	public List<Street> listStreet(Long cityId);

	public void addUser(User user);

	public User selectUser(User user);

	public List<User> getUserInfo(Map map);

	public Integer deleteUserInfo(List<String> list);

	public void updateUserInfo(User user);

	public User getUserInfoById(Long id);

	public List<NavTree> selectTree(Long id);

	public Integer selectCount();
		
}
