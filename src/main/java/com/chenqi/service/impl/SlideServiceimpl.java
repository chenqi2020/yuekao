package com.chenqi.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.chenqi.bean.Slide;
import com.chenqi.mapper.SlideMapper;
import com.chenqi.service.SlideService;

@Service
public class SlideServiceimpl implements SlideService{

	@Resource
	private SlideMapper slideMapper;

	@Override
	public List<Slide> selects() {
		// TODO Auto-generated method stub
		return slideMapper.selects();
	}
}
