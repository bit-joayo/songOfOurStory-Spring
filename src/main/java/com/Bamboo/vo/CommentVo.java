package com.Bamboo.vo;

public class CommentVo {
	private Long commentId;
	private String content;
	private Long postNo;
	private String userId;
	
	public Long getCommentId() {
		return commentId;
	}

	public void setCommentId(Long commentId) {
		this.commentId = commentId;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Long getPostNo() {
		return postNo;
	}

	public void setPostNo(Long postNo) {
		this.postNo = postNo;
	}
	
	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public CommentVo() {
		super();
	}

	@Override
	public String toString() {
		return "CommentVo [commentId=" + commentId + ", content=" + content + ", postNo=" + postNo + ", userId="
				+ userId + "]";
	}

	
	
	
}
