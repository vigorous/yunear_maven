
package com.kakasure.interceptor;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.ModelAndViewDefiningException;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.kakasure.entity.system.Menu;
import com.kakasure.entity.system.User;
import com.kakasure.service.system.menu.MenuService;
import com.kakasure.util.Const;
import com.kakasure.util.RightsHelper;
import com.kakasure.util.ServiceHelper;
import com.kakasure.util.Tools;

/**
 * 权限拦截器
 * 
 * @author zhangb
 *
 */
public class RightsHandlerInterceptor extends HandlerInterceptorAdapter {
	private Logger	LOG	= LoggerFactory.getLogger(this.getClass());

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
			Object handler) throws Exception {
		LOG.debug("RightsHandlerInterceptor...");
		String path = request.getServletPath();
		if (path.matches(Const.NO_INTERCEPTOR_PATH))
			return true;
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute(Const.SESSION_USER);
		String menuId = null;
		MenuService menuService = ServiceHelper.getMenuService();
		List<Menu> subList = menuService.listAllSubMenu();
		for (Menu m : subList) {
			String menuUrl = m.getMENU_URL();
			if (Tools.notEmpty(menuUrl)) {
				if (path.contains(menuUrl)) {
					menuId = m.getMENU_ID();
					break;
				} else {
					String[] arr = menuUrl.split("\\.");
					String regex = "";
					if (arr.length == 2) {
						regex = "/?" + arr[0] + "(/.*)?." + arr[1];

					} else {
						regex = "/?" + menuUrl + "(/.*)?.do";
					}
					if (path.matches(regex)) {
						menuId = m.getMENU_ID();
						break;
					}
				}
			}
		}
		// System.out.println(path+"===="+menuId);
		if (menuId != null) {
			// user =
			// ServiceHelper.getUserService().getUserAndRoleById(user.getUserId());
			String roleRights = (String) session.getAttribute(Const.SESSION_ROLE_RIGHTS);
			if (RightsHelper.testRights(roleRights, menuId)) {
				return true;
			} else {
				System.out.println("用户：" + user.getUSERNAME() + "试图访问" + path + "被阻止！");
				ModelAndView mv = new ModelAndView();
				mv.setViewName("no_rights");
				throw new ModelAndViewDefiningException(mv);
			}
		}
		return super.preHandle(request, response, handler);
	}

}
