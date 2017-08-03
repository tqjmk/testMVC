package com.mytest.dao;

import java.util.List;
import java.util.Map;

import com.mytest.beans.NavTree;
import com.mytest.beans.Search;
import com.mytest.beans.User;

public interface UserDao {

	void addUser(User user);

	User selectUser(User user);

	List<User> selectUserInfo(Map map);

	Integer deleteUserInfo(List<String> list);

	void updateUserInfo(User user);

	User getUserInfoById(Long id);

	void testTransaction2();

	List<NavTree> selectTree(Long id);

	Integer selectCount();

}
