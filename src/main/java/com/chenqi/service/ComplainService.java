package com.chenqi.service;

import java.util.List;

import com.chenqi.bean.Comp;
import com.chenqi.bean.Complain;
import com.chenqi.vo.ComplainVO;
import com.github.pagehelper.PageInfo;

public interface ComplainService {
	//举报
	boolean insert(Complain complain);
	
	//查询举报
		PageInfo<Complain> selects(ComplainVO complainVO,Integer page,Integer pageSize);
		//列表
		PageInfo<Complain> findlist(Integer page,Integer pageSize,Integer id);
}
