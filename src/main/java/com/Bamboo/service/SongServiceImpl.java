package com.Bamboo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Bamboo.repository.SongDao;
import com.Bamboo.vo.SongVo;

@Service
public class SongServiceImpl implements SongService {

	@Autowired
	private SongDao songDaoImpl;
	
	@Override
	public SongVo getSongBySongId(long songId) {
		return songDaoImpl.selectSongBySongId(songId);
	}

}
