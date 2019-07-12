package com.Bamboo.repository;

import com.Bamboo.vo.UserVo;

public interface UserDao {
	public int insert(UserVo userVo);
	public UserVo selectUser(String userId, String password);
	public UserVo selectUserById(String userId);
}
