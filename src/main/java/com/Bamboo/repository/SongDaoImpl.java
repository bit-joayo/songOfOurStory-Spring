package com.Bamboo.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.Bamboo.vo.SongVo;

@Repository
public class SongDaoImpl implements SongDao {
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public SongVo selectSongBySongId(long songId) {
		SongVo songVo = sqlSession.selectOne("song.selectSongBySongId", songId);
		return songVo;
	}

}
