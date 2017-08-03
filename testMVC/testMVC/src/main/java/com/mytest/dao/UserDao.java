package com.mytest.dao;

import java.util.List;

import com.mytest.beans.Search;
import com.mytest.beans.User;

public interface UserDao {

	void addUser(User user);

	User selectUser(User user);

	List<User> selectUserInfo();

	void deleteUserInfo(Long id);

	void updateUserInfo(User user);

	User getUserInfoById(Long id);

	List<User> searchUser(Search search);

	void testTransaction1();

	void testTransaction2();

}
