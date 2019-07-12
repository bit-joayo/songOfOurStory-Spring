package com.Bamboo.service;

import java.util.List;

import com.Bamboo.vo.PostVo;

public interface PostService {
	public boolean writePost(PostVo postVo);
	public List<PostVo> getAllPostList();
	public PostVo getPostByPostNo(long postNo);
}
