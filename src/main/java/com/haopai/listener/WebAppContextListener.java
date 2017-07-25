
package com.haopai.listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.haopai.util.Const;

/**
 * spring初始化完成监听器
 * 
 * @author zhangb
 *
 */
public class WebAppContextListener implements ServletContextListener {
	private Logger	LOG	= LoggerFactory.getLogger(this.getClass());

	@Override
	public void contextDestroyed(ServletContextEvent event) {
	}

	@Override
	public void contextInitialized(ServletContextEvent event) {
		LOG.debug("========获取Spring WebApplicationContext========start");
		Const.WEB_APP_CONTEXT = WebApplicationContextUtils.getWebApplicationContext(event.getServletContext());
		LOG.debug("========获取Spring WebApplicationContext========end");
	}
}
