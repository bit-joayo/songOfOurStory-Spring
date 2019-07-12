package com.Bamboo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Bamboo.repository.PostDao;
import com.Bamboo.vo.PostVo;

@Service
public class PostServiceImpl implements PostService {

	@Autowired
	private PostDao postDaoImpl;
	
	@Override
	public boolean writePost(PostVo postVo) {
		return 1 == postDaoImpl.insert(postVo);
	}

	@Override
	public List<PostVo> getAllPostList() {
		return postDaoImpl.selectAllPost();
	}

	@Override
	public PostVo getPostByPostNo(long postNo) {
		return postDaoImpl.selectPostByPostNo(postNo);
	}

	


}
