package com.Bamboo.vo;

import java.sql.Date;

public class PostVo {
	private Long postNo;
	private String postContent;
	private Date regDate;
	private String userId;
	private Long songId1;
	private Long songId2;
	private Long songId3;
	private String title;
	private String topic;
	
	public Long getPostNo() {
		return postNo;
	}
	public void setPostNo(Long postNo) {
		this.postNo = postNo;
	}
	public String getPostContent() {
		return postContent;
	}
	public void setPostContent(String postContent) {
		this.postContent = postContent;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public Long getSongId1() {
		return songId1;
	}
	public void setSongId1(Long songId1) {
		this.songId1 = songId1;
	}
	public Long getSongId2() {
		return songId2;
	}
	public void setSongId2(Long songId2) {
		this.songId2 = songId2;
	}
	public Long getSongId3() {
		return songId3;
	}
	public void setSongId3(Long songId3) {
		this.songId3 = songId3;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	public String getTopic() {
		return topic;
	}
	public void setTopic(String topic) {
		this.topic = topic;
	}
	
	
	@Override
	public String toString() {
		return "PostVo [postNo=" + postNo + ", postContent=" + postContent + ", regDate=" + regDate + ", userId="
				+ userId + ", songId1=" + songId1 + ", songId2=" + songId2 + ", songId3=" + songId3 + ", title=" + title
				+ ", topic=" + topic + "]";
	}
	public PostVo() {
		super();
	}
	
	
	
}
