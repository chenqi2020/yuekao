package com.chenqi.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.chenqi.bean.Comp;
import com.chenqi.bean.Complain;
import com.chenqi.mapper.ArticleMapper;
import com.chenqi.mapper.ComplainMapper;
import com.chenqi.util.CMSException;
import com.chenqi.utils.StringUtil;
import com.chenqi.vo.ComplainVO;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
@Service
public class ComplainServiceImpl implements ComplainService {
	@Resource
	private ComplainMapper complainMapper;
	@Resource
	private ArticleMapper articleMapper;

	@Override
	public boolean insert(Complain complain) {
		try {
			//校验举报的地址是否合法
			boolean b = StringUtil.isHttpUrl(complain.getUrl());
			if(!b) {
				throw new CMSException("url 不合法");
			}
			
			//举报
			complainMapper.insert(complain);
			//增加次数
			articleMapper.updateComplainnum(complain.getArticleId());
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("举报失败");
			
		}
	
	}

	@Override
	public PageInfo<Complain> selects(ComplainVO complainVO, Integer page, Integer pageSize) {
		PageHelper.startPage(page, pageSize);
		List<Complain> list = complainMapper.selects(complainVO);
		return new PageInfo<Complain>(list);
	}

	@Override
	public PageInfo<Complain> findlist( Integer page, Integer pageSize,Integer id) {
		// TODO Auto-generated method stub
		PageHelper.startPage(page, pageSize);
		List<Complain> list = complainMapper.findlist(id);
		return  new PageInfo<Complain>(list);
	}

	

}
