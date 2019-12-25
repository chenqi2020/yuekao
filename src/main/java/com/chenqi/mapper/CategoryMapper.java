package com.chenqi.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.chenqi.bean.Category;

public interface CategoryMapper {
	
	//根据栏分类
	List<Category> selectsByChannelId(Integer channelId);
    int deleteByPrimaryKey(Integer id);

    int insert(Category record);

    int insertSelective(Category record);

    Category selectByPrimaryKey(@Param("id") Integer id);

    int updateByPrimaryKeySelective(Category record);

    int updateByPrimaryKey(Category record);
}