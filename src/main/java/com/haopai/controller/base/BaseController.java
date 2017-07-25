
package com.haopai.controller.base;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.haopai.entity.Page;
import com.haopai.entity.system.Menu;
import com.haopai.util.Const;
import com.haopai.util.Logger;
import com.haopai.util.PageData;
import com.haopai.util.SysUtil;
import com.haopai.util.UuidUtil;

/**
 * 基础控制器类，提供公共的内容
 * 
 * @author zhangb
 *
 */
public class BaseController {

	protected Logger logger	= Logger.getLogger(this.getClass());

	protected ModelAndView mv = this.getModelAndView();

	protected PageData pd = new PageData();

	/**
	 * 得到PageData
	 */
	public PageData getPageData() {
		mv.clear();
		PageData pds = new PageData(this.getRequest());

		pds.put("SYSNAME", SysUtil.SYSTEM_NAME); // 读取系统名称

		mv.addObject("pdm", pds);
		return pds;
	}

	/**
	 * 得到ModelAndView
	 */
	public ModelAndView getModelAndView() {
		return new ModelAndView();
	}

	/**
	 * 得到request对象
	 */
	public HttpServletRequest getRequest() {
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
		return request;
	}

	/**
	 * 得到32位的uuid
	 * 
	 * @return
	 */
	public String get32UUID() {
		return UuidUtil.get32UUID();
	}

	/**
	 * 得到分页列表的信息
	 */
	public Page getPage() {
		return new Page();
	}

	public static void logBefore(Logger logger, String interfaceName) {
		logger.info("");
		logger.info("start");
		logger.info(interfaceName);
	}

	public static void logAfter(Logger logger) {
		logger.info("end");
		logger.info("");
	}

	/* ===============================权限================================== */
	@SuppressWarnings("unchecked")
	public void getHC() {
		HttpSession session = this.getRequest().getSession();
		Map<String, String> map = (Map<String, String>) session.getAttribute(Const.SESSION_QX);
		mv.addObject(Const.SESSION_QX, map); // 按钮权限
		List<Menu> menuList = (List<Menu>) session.getAttribute(Const.SESSION_menuList);
		mv.addObject(Const.SESSION_menuList, menuList);// 菜单权限
	}
	/* ===============================权限================================== */
}
