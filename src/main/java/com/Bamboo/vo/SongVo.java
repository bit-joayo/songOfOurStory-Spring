package com.Bamboo.vo;

public class SongVo {
	private String songId;
	private String singer;
	private String title;
	private String genre;
	private String like_num;
	private String comment_num;
	private String topic;
	private String fre1;
	private String fre2;
	private String fre3;
	private String fre4;
	private String fre5;
	
	
	public SongVo() {
		super();
	}


	public String getSongId() {
		return songId;
	}
	
	

	public SongVo(String songId, String singer, String title, String genre) {
		super();
		this.songId = songId;
		this.singer = singer;
		this.title = title;
		this.genre = genre;
	}


	public void setSongId(String songId) {
		this.songId = songId;
	}


	public String getSinger() {
		return singer;
	}


	public void setSinger(String singer) {
		this.singer = singer;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getGenre() {
		return genre;
	}


	public void setGenre(String genre) {
		this.genre = genre;
	}


	public String getLike_num() {
		return like_num;
	}


	public void setLike_num(String like_num) {
		this.like_num = like_num;
	}


	public String getComment_num() {
		return comment_num;
	}


	public void setComment_num(String comment_num) {
		this.comment_num = comment_num;
	}


	public String getTopic() {
		return topic;
	}


	public void setTopic(String topic) {
		this.topic = topic;
	}


	public String getFre1() {
		return fre1;
	}


	public void setFre1(String fre1) {
		this.fre1 = fre1;
	}


	public String getFre2() {
		return fre2;
	}


	public void setFre2(String fre2) {
		this.fre2 = fre2;
	}


	public String getFre3() {
		return fre3;
	}


	public void setFre3(String fre3) {
		this.fre3 = fre3;
	}


	public String getFre4() {
		return fre4;
	}


	public void setFre4(String fre4) {
		this.fre4 = fre4;
	}


	public String getFre5() {
		return fre5;
	}


	public void setFre5(String fre5) {
		this.fre5 = fre5;
	}


	@Override
	public String toString() {
		return "SongVo [songId=" + songId + ", singer=" + singer + ", title=" + title + ", genre=" + genre
				+ ", like_num=" + like_num + ", comment_num=" + comment_num + ", topic=" + topic + ", fre1=" + fre1
				+ ", fre2=" + fre2 + ", fre3=" + fre3 + ", fre4=" + fre4 + ", fre5=" + fre5 + "]";
	}

	

	
}

