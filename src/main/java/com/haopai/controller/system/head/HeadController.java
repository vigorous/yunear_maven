
package com.haopai.controller.system.head;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.haopai.controller.base.BaseController;
import com.haopai.service.system.appuser.AppuserService;
import com.haopai.service.system.user.UserService;
import com.haopai.util.AppUtil;
import com.haopai.util.Const;
import com.haopai.util.PageData;
import com.haopai.util.SmsUtil;
import com.haopai.util.SysUtil;
import com.haopai.util.Tools;
import com.haopai.util.mail.SimpleMailSender;

/**
 * 头部及其他工具（短信、邮件、系统设置等）
 * 
 * @author zhangb
 *
 */
@Controller
@RequestMapping(value = "/head")
public class HeadController extends BaseController {

	@Resource(name = "userService")
	private UserService		userService;
	@Resource(name = "appuserService")
	private AppuserService	appuserService;

	/**
	 * 获取头部信息
	 */
	@RequestMapping(value = "/getUname")
	@ResponseBody
	public Object getList(HttpSession session) {

		Map<String, Object> map = new HashMap<String, Object>();
		try {
			pd = this.getPageData();
			List<PageData> pdList = new ArrayList<PageData>();

			PageData pds = new PageData();
			pds = (PageData) session.getAttribute("userpds");

			if (null == pds) {
				String USERNAME = session.getAttribute(Const.SESSION_USERNAME).toString(); // 获取当前登录者loginname
				pd.put("USERNAME", USERNAME);
				pds = userService.findByUId(pd);
				session.setAttribute("userpds", pds);
			}

			pdList.add(pds);
			map.put("list", pdList);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		} finally {
			logAfter(logger);
		}
		return AppUtil.returnObject(pd, map);
	}

	/**
	 * 保存皮肤
	 */
	@RequestMapping(value = "/setSKIN")
	public void setSKIN(PrintWriter out, HttpSession session) {

		try {
			pd = this.getPageData();

			String USERNAME = session.getAttribute(Const.SESSION_USERNAME).toString();// 获取当前登录者loginname
			pd.put("USERNAME", USERNAME);
			userService.setSKIN(pd);
			session.removeAttribute(Const.SESSION_userpds);
			session.removeAttribute(Const.SESSION_USERROL);
			out.write("success");
			out.close();
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}

	}

	/**
	 * 去编辑邮箱页面
	 */
	@RequestMapping(value = "/editEmail")
	public ModelAndView editEmail() throws Exception {

		pd = this.getPageData();
		mv.setViewName("system/head/edit_email");
		mv.addObject("pd", pd);
		return mv;
	}

	/**
	 * 去发送短信页面
	 */
	@RequestMapping(value = "/goSendSms")
	public ModelAndView goSendSms() throws Exception {

		pd = this.getPageData();
		mv.setViewName("system/head/send_sms");
		mv.addObject("pd", pd);
		return mv;
	}

	/**
	 * 发送短信
	 */
	@RequestMapping(value = "/sendSms")
	@ResponseBody
	public Object sendSms() {

		pd = this.getPageData();
		Map<String, Object> map = new HashMap<String, Object>();
		String msg = "ok"; // 发送状态
		int count = 0; // 统计发送成功条数
		int zcount = 0; // 理论条数

		List<PageData> pdList = new ArrayList<PageData>();

		String PHONEs = pd.getString("PHONE"); // 对方邮箱
		String CONTENT = pd.getString("CONTENT"); // 内容
		String isAll = pd.getString("isAll"); // 是否发送给全体成员 yes or no
		String TYPE = pd.getString("TYPE"); // 类型 1：短信接口1 2：短信接口2
		String fmsg = pd.getString("fmsg"); // 判断是系统用户还是会员 "appuser"为会员用户

		if ("yes".endsWith(isAll)) {
			try {
				List<PageData> userList = new ArrayList<PageData>();

				userList = "appuser".equals(fmsg) ? appuserService.listAllUser(pd)
						: userService.listAllUser(pd);

				zcount = userList.size();
				try {
					for (int i = 0; i < userList.size(); i++) {
						if (Tools.checkMobileNumber(userList.get(i).getString("PHONE"))) { // 手机号格式不对就跳过
							if ("1".equals(TYPE)) {
								SmsUtil.sendSms1(userList.get(i).getString("PHONE"), CONTENT); // 调用发短信函数1
							} else {
								SmsUtil.sendSms2(userList.get(i).getString("PHONE"), CONTENT); // 调用发短信函数2
							}
							count++;
						} else {
							continue;
						}
					}
					msg = "ok";
				} catch (Exception e) {
					msg = "error";
				}

			} catch (Exception e) {
				msg = "error";
			}
		} else {
			PHONEs = PHONEs.replaceAll("；", ";");
			PHONEs = PHONEs.replaceAll(" ", "");
			String[] arrTITLE = PHONEs.split(";");
			zcount = arrTITLE.length;
			try {
				for (int i = 0; i < arrTITLE.length; i++) {
					if (Tools.checkMobileNumber(arrTITLE[i])) { // 手机号式不对就跳过
						if ("1".equals(TYPE)) {
							SmsUtil.sendSms1(arrTITLE[i], CONTENT); // 调用发短信函数1
						} else {
							SmsUtil.sendSms2(arrTITLE[i], CONTENT); // 调用发短信函数2
						}
						count++;
					} else {
						continue;
					}
				}
				msg = "ok";
			} catch (Exception e) {
				msg = "error";
			}
		}
		pd.put("msg", msg);
		pd.put("count", count); // 成功数
		pd.put("ecount", zcount - count); // 失败数
		pdList.add(pd);
		map.put("list", pdList);
		return AppUtil.returnObject(pd, map);
	}

	/**
	 * 去发送电子邮件页面
	 */
	@RequestMapping(value = "/goSendEmail")
	public ModelAndView goSendEmail() throws Exception {

		pd = this.getPageData();
		mv.setViewName("system/head/send_email");
		mv.addObject("pd", pd);
		return mv;
	}

	/**
	 * 发送电子邮件
	 */
	@RequestMapping(value = "/sendEmail")
	@ResponseBody
	public Object sendEmail() {

		pd = this.getPageData();
		Map<String, Object> map = new HashMap<String, Object>();
		String msg = "ok"; // 发送状态
		int count = 0; // 统计发送成功条数
		int zcount = 0; // 理论条数

		List<PageData> pdList = new ArrayList<PageData>();

		String toEMAIL = pd.getString("EMAIL"); // 对方邮箱
		String TITLE = pd.getString("TITLE"); // 标题
		String CONTENT = pd.getString("CONTENT"); // 内容
		String TYPE = pd.getString("TYPE"); // 类型
		String isAll = pd.getString("isAll"); // 是否发送给全体成员 yes or no

		String fmsg = pd.getString("fmsg"); // 判断是系统用户还是会员 "appuser"为会员用户

		String[] strEM = { SysUtil.EMAIL_SMTP, SysUtil.EMAIL_PORT, SysUtil.EMAIL_EMAIL,
				SysUtil.EMAIL_PASSWORD };

		if ("yes".endsWith(isAll)) {
			try {
				List<PageData> userList = new ArrayList<PageData>();

				userList = "appuser".equals(fmsg) ? appuserService.listAllUser(pd)
						: userService.listAllUser(pd);

				zcount = userList.size();
				try {
					for (int i = 0; i < userList.size(); i++) {
						if (Tools.checkEmail(userList.get(i).getString("EMAIL"))) { // 邮箱格式不对就跳过
							SimpleMailSender.sendEmail(strEM[0], strEM[1], strEM[2], strEM[3],
									userList.get(i).getString("EMAIL"), TITLE, CONTENT, TYPE);// 调用发送邮件函数
							count++;
						} else {
							continue;
						}
					}
					msg = "ok";
				} catch (Exception e) {
					msg = "error";
				}

			} catch (Exception e) {
				msg = "error";
			}
		} else {
			toEMAIL = toEMAIL.replaceAll("；", ";");
			toEMAIL = toEMAIL.replaceAll(" ", "");
			String[] arrTITLE = toEMAIL.split(";");
			zcount = arrTITLE.length;
			try {
				for (int i = 0; i < arrTITLE.length; i++) {
					if (Tools.checkEmail(arrTITLE[i])) { // 邮箱格式不对就跳过
						SimpleMailSender.sendEmail(strEM[0], strEM[1], strEM[2], strEM[3],
								arrTITLE[i], TITLE, CONTENT, TYPE);// 调用发送邮件函数
						count++;
					} else {
						continue;
					}
				}
				msg = "ok";
			} catch (Exception e) {
				msg = "error";
			}
		}

		pd.put("msg", msg);
		pd.put("count", count); // 成功数
		pd.put("ecount", zcount - count); // 失败数
		pdList.add(pd);
		map.put("list", pdList);
		return AppUtil.returnObject(pd, map);
	}

	/**
	 * 去系统设置页面
	 */
	@RequestMapping(value = "/goSystem")
	public ModelAndView goEditEmail() throws Exception {

		pd = this.getPageData();
		pd.put("YSYNAME", SysUtil.SYSTEM_NAME); // 读取系统名称
		pd.put("COUNTPAGE", SysUtil.SYSTEM_DEFAULT_PAGE); // 读取每页条数

		pd.put("SMTP", SysUtil.EMAIL_SMTP);
		pd.put("PORT", SysUtil.EMAIL_PORT);
		pd.put("EMAIL", SysUtil.EMAIL_EMAIL);
		pd.put("PAW", SysUtil.EMAIL_PASSWORD);

		pd.put("SMSU1", SysUtil.SMS_USERNAME);
		pd.put("SMSPAW1", SysUtil.SMS_PASSWORD);

		mv.setViewName("system/head/sys_edit");
		mv.addObject("pd", pd);

		return mv;
	}

	/**
	 * 保存系统设置
	 */
	@RequestMapping(value = "/saveSys")
	public ModelAndView saveU(PrintWriter out) throws Exception {

		pd = this.getPageData();

		SysUtil.SYSTEM_NAME = pd.getString("YSYNAME");
		SysUtil.EMAIL_PORT = pd.getString("COUNTPAGE");

		SysUtil.EMAIL_SMTP = pd.getString("SMTP");
		SysUtil.EMAIL_PORT = pd.getString("PORT");
		SysUtil.EMAIL_EMAIL = pd.getString("EMAIL");
		SysUtil.EMAIL_PASSWORD = pd.getString("PAW");

		SysUtil.SMS_USERNAME = pd.getString("SMSU1");
		SysUtil.SMS_PASSWORD = pd.getString("SMSPAW1");

		mv.addObject("msg", "OK");
		mv.setViewName("save_result");
		return mv;
	}

	/**
	 * 去代码生成器页面
	 */
	@RequestMapping(value = "/goProductCode")
	public ModelAndView goProductCode() throws Exception {

		mv.setViewName("system/head/productCode");
		return mv;
	}

}
