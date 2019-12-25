package com.chenqi.service;

import java.util.List;

import com.chenqi.bean.Article;
import com.chenqi.bean.ArticleWithBLOBs;
import com.github.pagehelper.PageInfo;

public interface ArticleService {

	PageInfo<Article> selects(Article article,int page,int pageSize);
	
	int insertSelective(ArticleWithBLOBs record);
	
	//文章详情
	
	ArticleWithBLOBs selectByPrimaryKey(Integer id);
	
	int updateByPrimaryKeySelective(ArticleWithBLOBs record);
}
