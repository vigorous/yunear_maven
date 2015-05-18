package com.kakasure.controller.yunear;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kakasure.controller.base.BaseController;
import com.kakasure.service.system.user.UserService;
import com.kakasure.util.Const;

import com.kakasure.util.Tools;

public class WeChatLoginController extends BaseController{

	@Resource(name = "userService")
	private UserService	userService;
	
	/**
	 * 扫码用户进来判断是否登陆
	 */
	@RequestMapping(value = "/alreadylogin")
	public ModelAndView alreadylogin(HttpSession session){
		pd = this.getPageData();
		String sessionCode = (String) session.getAttribute(Const.SESSION_SECURITY_CODE);
		if (Tools.notEmpty(sessionCode)) {
			mv.setViewName("");
		}else {
			mv.setViewName("yunear/");
		}
		return mv;
	}
	/**
	 * 扫码用户登陆
	 * @throws Exception 
	 */
	@RequestMapping(value="/land")
	public ModelAndView land( ) throws Exception{
		String errInfo = "";
		pd = this.getPageData();
		String USERNAME = pd.get("USERNAME").toString();
		String PASSWORD = pd.get("PASSWORD").toString();
		pd.put("USERNAME", USERNAME);
		pd.put("PASSWORD", PASSWORD);
		pd=userService.getUserByNameAndPwd(pd);
		if (pd != null) {
			mv.setViewName("");
		}else {
			errInfo = "用户或密码错误！";
			mv.addObject("errInfo", errInfo);
		}
		return mv;
	}
	/**
	 * 去注册页面
	 */
	@RequestMapping(value="/tologin")
	public ModelAndView tologin(){
		pd = this.getPageData();

		mv.setViewName("");
		mv.addObject("pd", pd);
		mv.addObject("msg", "login");

		return mv;
		
	}
	/**
	 * 扫码用户注册
	 * @throws Exception 
	 */
	@RequestMapping(value="/login")
	public ModelAndView login() throws Exception{
		pd = this.getPageData();
		userService.savecode(pd);
		mv.setViewName("");
		return mv;
	}
	
}
