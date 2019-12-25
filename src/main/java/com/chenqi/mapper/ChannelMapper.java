package com.chenqi.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.chenqi.bean.Channel;

public interface ChannelMapper {
	//所有的栏目
	List<Channel> selects();
	
    int deleteByPrimaryKey(Integer id);

    int insert(Channel record);

    int insertSelective(Channel record);

    Channel selectByPrimaryKey(@Param("id") Integer id);

    int updateByPrimaryKeySelective(Channel record);

    int updateByPrimaryKey(Channel record);
}