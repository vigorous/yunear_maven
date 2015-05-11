
package com.kakasure.interceptor;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.kakasure.entity.system.Menu;
import com.kakasure.entity.system.User;
import com.kakasure.util.Const;
import com.kakasure.util.RightsHelper;

/**
 * 登录拦截器（包含菜单赋值）
 * 
 * @author zhangb
 *
 */
public class LoginHandlerInterceptor extends HandlerInterceptorAdapter {
	private Logger	LOG	= LoggerFactory.getLogger(this.getClass());

	@SuppressWarnings("unchecked")
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
			Object handler) throws Exception {
		LOG.debug("LoginHandlerInterceptor...");
		String path = request.getServletPath();
		if (path.matches(Const.NO_INTERCEPTOR_PATH)) {
			return true;
		} else {
			HttpSession session = request.getSession();
			User user = (User) session.getAttribute(Const.SESSION_USER);
			if (user != null) {

				// 判断是否拥有当前点击菜单的权限（内部过滤,防止通过url进入跳过菜单权限）
				/**
				 * 根据点击的菜单的xxx.do去菜单中的URL去匹配，当匹配到了此菜单，判断是否有此菜单的权限，没有的话跳转到登录页面
				 * 根据按钮权限，授权按钮(当前点的菜单和角色中各按钮的权限匹对)
				 */
				List<Menu> menuList = (List<Menu>) session.getAttribute(Const.SESSION_allmenuList); // 获取菜单列表
				path = path.substring(1, path.length());
				for (int i = 0; i < menuList.size(); i++) {
					for (int j = 0; j < menuList.get(i).getSubMenu().size(); j++) {
						if (menuList.get(i).getSubMenu().get(j).getMENU_URL().split(".do")[0].equals(path.split(".do")[0])) {
							if (!menuList.get(i).getSubMenu().get(j).isHasMenu()) { // 判断有无此菜单权限
								response.sendRedirect(request.getContextPath() + Const.LOGIN);
								return false;
							} else { // 按钮判断
								Map<String, String> map = (Map<String, String>) session.getAttribute(Const.SESSION_QX);// 按钮权限
								map.remove("add");
								map.remove("del");
								map.remove("edit");
								map.remove("cha");
								String MENU_ID = menuList.get(i).getSubMenu().get(j).getMENU_ID();
								String USERNAME = session.getAttribute(Const.SESSION_USERNAME)
															.toString(); // 获取当前登录者loginname
								Boolean isAdmin = "admin".equals(USERNAME);
								map.put("add", RightsHelper.testRights(map.get("adds"), MENU_ID)
										|| isAdmin ? "1" : "0");
								map.put("del", RightsHelper.testRights(map.get("dels"), MENU_ID)
										|| isAdmin ? "1" : "0");
								map.put("edit", RightsHelper.testRights(map.get("edits"), MENU_ID)
										|| isAdmin ? "1" : "0");
								map.put("cha", RightsHelper.testRights(map.get("chas"), MENU_ID)
										|| isAdmin ? "1" : "0");
								session.removeAttribute(Const.SESSION_QX);
								session.setAttribute(Const.SESSION_QX, map); // 重新分配按钮权限
							}
						}
					}
				}
				return true;
			} else {
				// 未登录跳转到登陆页面
				response.sendRedirect(request.getContextPath() + Const.LOGIN);
				return false;
			}
		}
	}

}
