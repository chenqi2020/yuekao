package com.chenqi.mapper;

import java.util.List;

import com.chenqi.bean.Slide;

public interface SlideMapper {
	
	List<Slide> selects();
	
    int deleteByPrimaryKey(Integer id);

    int insert(Slide record);

    int insertSelective(Slide record);

    Slide selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Slide record);

    int updateByPrimaryKey(Slide record);
}