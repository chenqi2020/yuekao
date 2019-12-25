package com.chenqi.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.chenqi.bean.Article;
import com.chenqi.bean.ArticleWithBLOBs;
import com.chenqi.bean.Complain;
import com.chenqi.bean.User;
import com.chenqi.service.ArticleService;
import com.chenqi.service.ComplainService;
import com.chenqi.service.UserService;
import com.chenqi.vo.ComplainVO;
import com.github.pagehelper.PageInfo;
import com.sun.org.apache.bcel.internal.generic.Select;
@RequestMapping("admin")
@Controller
public class AdminController {

	@Resource
	private UserService userService;
	
	@Resource
	private ArticleService articleService;
	
	@Resource
	private ComplainService complainService;
	@RequestMapping(value = {"/","index",""})
	public String index() {
		return "admin/index";
		
	}
	
	@GetMapping("article/selects")
	public String articles(Model model,Article article,@RequestParam(defaultValue = "1")int page,@RequestParam(defaultValue = "3")int pageSize) {
		
		  if(article.getStatus()==null) { article.setStatus(0);
		  
		  }
		 
		
		PageInfo<Article> info = articleService.selects(article, page, pageSize);
		model.addAttribute("info", info);
		model.addAttribute("article", article);
		return "admin/article/articles";
	}
	
	/**
	 * 
	 * @Title: findlist 
	 * @Description: 管理user
	 * @param model
	 * @param username
	 * @param page
	 * @param pageSize
	 * @param user
	 * @return
	 * @return: String
	 */
	@RequestMapping("user/list")
	public String findlist(Model model,String username,
			@RequestParam(defaultValue = "1")Integer page,
			@RequestParam(defaultValue = "3")Integer pageSize,User user) {
		
		PageInfo<User> info = userService.selects(username, page, pageSize);
		model.addAttribute("info", info);
		model.addAttribute("username", username);
		model.addAttribute("user", user);
		return "admin/user/list";
	}
	//查看文章详情
	@GetMapping("article/select")
	public String Select(Integer id,Model model) {
		ArticleWithBLOBs a = articleService.selectByPrimaryKey(id);
		model.addAttribute("a", a);
		return "admin/article/article";
		
		
	}
	
	/**
	 * 
	 * @Title: update
	 * @Description:审核文章
	 * 	 * @param user
	 * @return
	 * @return: boolean
	 */
	
	
	@ResponseBody
	@PostMapping("user/update")
	public boolean update(User user) {
		return userService.updateByPrimaryKeySelective(user) > 0;
	}
	
	/**
	 * 
	 * @Title: update
	 * @Description:审核文章
	 * 	 * @param user
	 * @return
	 * @return: boolean
	 */
	@ResponseBody
	@PostMapping("article/update")
	public boolean update(ArticleWithBLOBs article) {
		return articleService.updateByPrimaryKeySelective(article)> 0;
	}
	
	//查询投诉
		@GetMapping("article/complains")
		public String complain(Model model ,ComplainVO complainVO , @RequestParam(defaultValue = "1") Integer page,
				@RequestParam(defaultValue = "3") Integer pageSize) {
			
			PageInfo<Complain> info = complainService.selects(complainVO, page, pageSize);
			model.addAttribute("info", info);
			model.addAttribute("complainVO", complainVO);
			return "admin/article/complains";
		}
	
		//详情页面
		@GetMapping("article/look")
		public String look(Model model,@RequestParam(defaultValue = "1")int page,@RequestParam(defaultValue = "3")int pageSize,ComplainVO complainVO,Integer id) {
			PageInfo<Complain> info = complainService.findlist(pageSize,page,id);
			model.addAttribute("info",info);
			return "admin/article/look";
		}
}
