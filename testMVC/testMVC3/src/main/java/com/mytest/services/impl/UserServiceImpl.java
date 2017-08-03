package com.mytest.services.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mytest.Exception.MyException;
import com.mytest.beans.City;
import com.mytest.beans.NavTree;
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
	public List<User> getUserInfo(Map map) {
		List<User> userinfos = userDao.selectUserInfo(map);
		return userinfos;
	}

	@Override
	public Integer deleteUserInfo(List<String> list) {
		Integer affectrows = userDao.deleteUserInfo(list);	
		return affectrows;
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
	public List<NavTree> selectTree(Long id) {
		if(id==null){
			id=(long) 0;
		}
		List<NavTree> list = userDao.selectTree(id);
		return list;
	}

	@Override
	public Integer selectCount() {
		Integer count = userDao.selectCount();
		return count;
	}

}
