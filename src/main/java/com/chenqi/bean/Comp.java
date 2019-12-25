package com.chenqi.bean;

public class Comp {

	private Integer id;//举报的id
	private Integer article_id;//文章的id
	private Integer user_id;//用户的id
	private String complanintype;//投诉类型
	private String urlip;//用户提交
	private String comment;//数量
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getArticle_id() {
		return article_id;
	}
	public void setArticle_id(Integer article_id) {
		this.article_id = article_id;
	}
	public Integer getUser_id() {
		return user_id;
	}
	public void setUser_id(Integer user_id) {
		this.user_id = user_id;
	}
	public String getComplanintype() {
		return complanintype;
	}
	public void setComplanintype(String complanintype) {
		this.complanintype = complanintype;
	}
	public String getUrlip() {
		return urlip;
	}
	public void setUrlip(String urlip) {
		this.urlip = urlip;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	
}
