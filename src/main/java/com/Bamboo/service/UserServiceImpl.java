package com.Bamboo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Bamboo.repository.UserDao;
import com.Bamboo.vo.UserVo;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDao userDaoImpl;
	
	@Override
	public boolean writeUser(UserVo userVo) {
		return 1 == userDaoImpl.insert(userVo);
	}

	@Override
	public UserVo getUser(String userId, String password) {
		return userDaoImpl.selectUser(userId, password);
	}

	@Override
	public UserVo getUserByUserId(String userId) {
		return userDaoImpl.selectUserById(userId);
	}

}
