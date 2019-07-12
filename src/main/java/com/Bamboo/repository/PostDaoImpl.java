package com.Bamboo.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.Bamboo.vo.PostVo;

@Repository
public class PostDaoImpl implements PostDao {
	
	@Autowired
	SqlSession sqlSession;

	@Override
	public int insert(PostVo postVo) {
		int insertedCount = 0;
		
		try {
			insertedCount = sqlSession.insert("post.insert", postVo);
		} catch (Exception e) {
			System.err.println("DAO:ERROR:" + e.getMessage());
		}
		
		return insertedCount;
	}

	@Override
	public List<PostVo> selectAllPost() {
		List<PostVo> list = sqlSession.selectList("post.selectAllPost");
		
		System.out.println("hyewon:: postdaoimpl " + list);
		
		return list;
	}

	@Override
	public PostVo selectPostByPostNo(long postNo) {
		PostVo postVo = sqlSession.selectOne("post.selectPostByPostNo", postNo);
		return postVo;
	}

}
