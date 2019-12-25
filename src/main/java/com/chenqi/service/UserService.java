package com.chenqi.service;

import com.chenqi.bean.User;
import com.github.pagehelper.PageInfo;

public interface UserService {

	PageInfo<User> selects(String username,Integer page,Integer pageSize);
	 
	 int updateByPrimaryKeySelective(User record);

	 //用户登录
	User login(User user);

	//注册用户
	int insertSelective(User user);


}
