package com.chenqi.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.chenqi.bean.Complain;
import com.chenqi.vo.ComplainVO;


public interface ComplainMapper {
	//举报添加
	int insert(Complain complain);
	
	
	List<Complain> selects(ComplainVO complainVO);
	
	//详情列表
	List<Complain> findlist(Integer id);

}
