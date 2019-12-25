package com.chenqi.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.chenqi.bean.User;

public interface UserMapper {
	
	
	
	User selectByName(@Param("username")String name);
	
    int deleteByPrimaryKey(Integer id);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
    List<User> selects(@Param("username")String username);
}