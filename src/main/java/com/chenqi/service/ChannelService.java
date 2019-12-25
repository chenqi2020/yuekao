package com.chenqi.service;

import java.util.List;

import com.chenqi.bean.Category;
import com.chenqi.bean.Channel;

public interface ChannelService {

	List<Channel> selects();
	
	List<Category> selectsByChannelId(Integer channelId);
}
