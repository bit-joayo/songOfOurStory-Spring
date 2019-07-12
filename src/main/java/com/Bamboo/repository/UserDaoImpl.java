package com.Bamboo.repository;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.Bamboo.vo.UserVo;

@Repository
public class UserDaoImpl implements UserDao {

	@Autowired
	SqlSession sqlSession;
	
	@Override
	public int insert(UserVo userVo) {
		int insertedCount = 0;
		
		try {
			insertedCount = sqlSession.insert("users.insert", userVo);
		} catch (Exception e) {
			System.err.println("DAO:ERROR:" + e.getMessage());
		}
		
		return insertedCount;
	}

	@Override
	public UserVo selectUser(String userId, String password) {
		Map<String, String> userMap = new HashMap<>();
		userMap.put("id", userId);
		userMap.put("password", password);
		UserVo userVo = sqlSession.selectOne("users.selectUserByIdAndPassword", userMap);
		return userVo;
	}

	@Override
	public UserVo selectUserById(String userId) {
		UserVo userVo = sqlSession.selectOne("users.selectUserByUserId", userId);
		return userVo;
	}

}
