package com.mytest.services;

import java.util.List;

import com.mytest.Exception.MyException;
import com.mytest.beans.City;
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

	public List<User> getUserInfo();

	public void deleteUserInfo(Long id);

	public void updateUserInfo(User user);

	public User getUserInfoById(Long id);

	public List<User> searchUser(Search search);

	public void testTransaction() throws MyException;
	
	
}
