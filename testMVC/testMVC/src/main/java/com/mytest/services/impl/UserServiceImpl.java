package com.mytest.services.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mytest.Exception.MyException;
import com.mytest.beans.City;
import com.mytest.beans.Province;
import com.mytest.beans.Search;
import com.mytest.beans.Street;
import com.mytest.beans.User;
import com.mytest.dao.InitDao;
import com.mytest.dao.UserDao;
import com.mytest.services.IUserService;

@Service
public class UserServiceImpl implements IUserService{
	@Autowired
	private InitDao initDao;
	@Autowired
	private UserDao userDao;
	
	@Override
	public List<Province> listProvince() {
		return initDao.selectProvince();
	}

	@Override
	public List<City> listCity(Long provinceId) {
		return initDao.selectCityByProvincedId(provinceId);
	}

	@Override
	public List<Street> listStreet(Long cityId) {
		return initDao.selectStreetByCityId(cityId);
	}

	@Override
	public void addUser(User user) {
		userDao.addUser(user);
		
	}

	@Override
	public User selectUser(User user) {
		User userinfo = userDao.selectUser(user);
		return userinfo;
	}

	@Override
	public List<User> getUserInfo() {
		List<User> userinfos = userDao.selectUserInfo();
		return userinfos;
	}

	@Override
	public void deleteUserInfo(Long id) {
		userDao.deleteUserInfo(id);		
	}

	@Override
	public void updateUserInfo(User user) {
		userDao.updateUserInfo(user);		
	}

	@Override
	public User getUserInfoById(Long id) {
		User user = userDao.getUserInfoById(id);
		return user;
	}

	@Override
	public List<User> searchUser(Search search) {		
		List<User> userinfo = userDao.searchUser(search);
		return userinfo;
	}

	@Override
	public void testTransaction() throws MyException {
		userDao.testTransaction1();
		if(true){
			throw new MyException();
		}
		userDao.testTransaction2();
	}

}
