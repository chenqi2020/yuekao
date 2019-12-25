package com.chenqi.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.chenqi.bean.Category;
import com.chenqi.bean.Channel;
import com.chenqi.mapper.CategoryMapper;
import com.chenqi.mapper.ChannelMapper;
import com.chenqi.service.ChannelService;

@Service
public class ChannelServiceimpl implements ChannelService{

	@Resource
	private ChannelMapper channelMapper;
	
	@Resource
	private CategoryMapper categoryMapper;
	@Override
	public List<Channel> selects() {
		// TODO Auto-generated method stub
		return channelMapper.selects();
	}
	
	@Override
	public List<Category> selectsByChannelId(Integer channelId) {
		
		return categoryMapper.selectsByChannelId(channelId);
	}

}
