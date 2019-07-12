package com.Bamboo.service;

import com.Bamboo.vo.UserVo;


public interface UserService {
	public boolean writeUser(UserVo userVo);
	public UserVo getUser(String userId, String password);
	public UserVo getUserByUserId(String userId);

}
