package com.Bamboo.repository;

import java.util.List;

import com.Bamboo.vo.PostVo;

public interface PostDao {

	public int insert(PostVo postVo);
	public List<PostVo> selectAllPost();
	public PostVo selectPostByPostNo(long postNo);
	
}
