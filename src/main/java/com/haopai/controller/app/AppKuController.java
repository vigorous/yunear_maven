
package com.haopai.controller.app;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.haopai.controller.base.BaseController;
import com.haopai.util.AppUtil;

/**
 * app-产品详情-接口类 手机app接口实例
 * 
 * 相关参数协议： 00 操作失败 01 操作成功 02 用户名不存在 03 用户名存在 04 密码错误 05 请求协议参数不完整 06 用户名或密码错误
 */
@Controller
@RequestMapping(value = "/appKu")
public class AppKuController extends BaseController {

	/**
	 * 测试
	 */
	@RequestMapping(value = "/test")
	@ResponseBody
	public Object shenqing() {
		String result = "01";
		logBefore(logger, "测试");
		Map<String, Object> map = new HashMap<String, Object>();
		pd = this.getPageData();
		try {
			System.out.println(pd);
			result = "01";
		} catch (Exception e) {
			logger.error(e.toString(), e);
		} finally {
			map.put("result", result);
			logAfter(logger);
		}
		return AppUtil.returnObject(pd, map);
	}

}
