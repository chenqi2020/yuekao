package com.chenqi.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.chenqi.bean.Article;
import com.chenqi.bean.ArticleWithBLOBs;
import com.chenqi.bean.Category;
import com.chenqi.bean.Channel;
import com.chenqi.bean.Comment;
import com.chenqi.bean.User;
import com.chenqi.service.ArticleService;
import com.chenqi.service.ChannelService;
import com.chenqi.service.CommentService;
import com.github.pagehelper.PageInfo;

/**
 * 
 * @ClassName: MyController 
 * @Description: 个人中心
 * @author:cq 
 * @date: 2019年12月12日 下午3:06:03
 */
@RequestMapping("my")
@Controller
public class MyController {

	@Resource
	private ChannelService channelService;
	
	@Resource
	private CommentService commentService;
	
	@Resource
	private ArticleService articleService;
	@RequestMapping(value= {"","/","index"})
	public String index() {
		
		return "my/index";
		
	}
	/**
	 * 文章类表
	 */
	
	@GetMapping("article/article")
	public String article(Integer id,Model model) {
		
		ArticleWithBLOBs a = articleService.selectByPrimaryKey(id);
		model.addAttribute("a", a);
		return "my/article/article";
	}
	//删除--修改
	@PostMapping("article/update")
	@ResponseBody
	public boolean update(ArticleWithBLOBs article) {
	 return	articleService.updateByPrimaryKeySelective(article)>0;
		
	}
	
	@GetMapping("article/publish")
	public String publush() {
		
		
		return "my/article/publish";
	}
	@ResponseBody
	@GetMapping("channel/selects")
	public List<Channel> selectsChannels(){
		return channelService.selects();
	}
	
	@ResponseBody
	@GetMapping("category/selectsByChannelId")
	public List<Category> selectsByChannelId(Integer channelId){
		return channelService.selectsByChannelId(channelId);
	}
	
	@ResponseBody
	@PostMapping("article/publish")
	public boolean publish( MultipartFile file ,ArticleWithBLOBs article,HttpServletRequest request) throws Exception, Exception {
		String path="d:/pic";
		
		if(!file.isEmpty()) {
			//获取原始文件名称
			String filename = file.getOriginalFilename();
			//防止文件重名
			String newFileName = UUID.randomUUID()+filename.substring(filename.lastIndexOf("."));
			//文件写入硬盘
			file.transferTo(new File(path,newFileName));
			
			article.setPicture(newFileName);
			
		}
	//  存值
			article.setCreated(new Date());// 发布时间
			article.setStatus(0);// 文章状态  0待审核
			article.setHits(0);  // 点击量
			article.setDeleted(0); // 是否删除  0 未删除
			article.setUpdated(new Date()); // 更新时间
			
			//从session 或区当前登录人的信息
			HttpSession session = request.getSession();
			User u = (User) session.getAttribute("user");
			
			article.setUserId(u.getId()); // 发布人
			article.setHot(0);  // 非热门
		
		
		return articleService.insertSelective(article)>0;
		
		 
	}
	@GetMapping("article/articles")
	public String articles(Model model,Article article,@RequestParam(defaultValue = "1")int page,@RequestParam(defaultValue = "3")int pageSize,HttpServletRequest request) {
		HttpSession session = request.getSession();
		User u = (User) session.getAttribute("user");
		article.setUserId(u.getId());//当前用户的文章
		
		PageInfo<Article> info = articleService.selects(article, page, pageSize);
		model.addAttribute("info", info);
		return "my/article/articles";
	}
	
	/**
	 * 查詢我的評論
	 * @Title: comments 
	 * @Description: TODO
	 * @return
	 * @return: String
	 */
	@RequestMapping("article/comments")
	public String comments(Model model,HttpSession session) {
		User user = (User) session.getAttribute("user");
		Comment comment = new Comment();
		comment.setUserId(user.getId());
		PageInfo<Comment> info = commentService.selects(comment, 1, 100);
		model.addAttribute("info", info);
		return "my/article/comments";
		
	}
	
}
