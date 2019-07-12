package com.Bamboo.repository;

import com.Bamboo.vo.SongVo;

public interface SongDao {
	public SongVo selectSongBySongId(long songId);
}
