package com.kakasure.controller.yunear;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kakasure.controller.base.BaseController;
import com.kakasure.entity.Page;
import com.kakasure.entity.system.User;
import com.kakasure.service.yunear.AnnounceMultiService;
import com.kakasure.service.yunear.CopyrightMultiService;
import com.kakasure.util.AppUtil;
import com.kakasure.util.Const;
import com.kakasure.util.DateUtil;
import com.kakasure.util.FileDownload;
import com.kakasure.util.ObjectExcelView;
import com.kakasure.util.PageData;
import com.kakasure.util.barcode.QrcodeUtil;

/**
 * 类名称：AnnounceMultiController 创建人：FH 创建时间：2015-05-13
 */
@Controller
@RequestMapping(value = "/announcemulti")
public class AnnounceMultiController extends BaseController {

	@Resource(name = "announcemultiService")
	private AnnounceMultiService announcemultiService;
	@Resource(name = "copyrightmultiService")
	private CopyrightMultiService copyrightmultiService;

	/**
	 * 新增
	 */
	@RequestMapping(value = "/save")
	public ModelAndView save() throws Exception {
		logBefore(logger, "新增AnnounceMulti");

		pd = this.getPageData();
		pd.put("ANNOUNCEMULTI_ID", this.get32UUID()); // 主键
		announcemultiService.save(pd);
		mv.addObject("msg", "success");
		mv.setViewName("save_result");
		return mv;
	}

	/**
	 * 删除
	 */
	@RequestMapping(value = "/delete")
	public void delete(PrintWriter out) {
		logBefore(logger, "删除AnnounceMulti");

		try {
			pd = this.getPageData();
			announcemultiService.delete(pd);
			out.write("success");
			out.close();
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}

	}

	/**
	 * 修改
	 */
	@RequestMapping(value = "/edit")
	public ModelAndView edit() throws Exception {
		logBefore(logger, "修改AnnounceMulti");

		pd = this.getPageData();
		announcemultiService.edit(pd);
		mv.addObject("msg", "success");
		mv.setViewName("save_result");
		return mv;
	}

	/**
	 * 版权方多媒体列表
	 */
	@RequestMapping(value = "/allMultiList")
	public ModelAndView allMultiList(Page page) {
		logBefore(logger, "列表CopyrightMulti");

		try {
			pd = this.getPageData();
			page.setPd(pd);
			List<PageData> varList = announcemultiService.allMultiList(page); // 列出CopyrightMulti列表
			//System.out.println(" --- "+varList.get(0).get("DESCR").toString());
			
			/*try {
				BufferedReader bf=new BufferedReader(new InputStreamReader(blob.getBinaryStream()));
				String temp="";
				StringBuffer sb=new StringBuffer();
				while((temp=bf.readLine())!=null)
				{
					sb.append(temp);	
				}
				
				System.out.println("DESCR-->"+sb.toString());
			} catch (Exception e) {
				e.printStackTrace();
			}*/
			
			getHC(); // 调用权限
			mv.setViewName("yunear/announce_copyrightmulti_list");
			mv.addObject("varList", varList);
			mv.addObject("pd", pd);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}
		return mv;
	}

	/**
	 * 发布方进行推广
	 * 
	 * @param out
	 */
	@RequestMapping(value = "/extension")
	public void extension(PrintWriter out,HttpSession session) {
		logBefore(logger, "extension AnnounceMulti");

		try {
			pd = this.getPageData();
			PageData pageData = copyrightmultiService.findById(pd);
			
			//查询发布方有没有推广该视频
			User user = (User) session.getAttribute(Const.SESSION_USER);
			pageData.put("USER_ID", user.getUSER_ID());
			
			PageData pageData1 = announcemultiService.findByUserIdAndMediaId(pageData);
			if(pageData1!=null){
				out.write("extensional");
				out.close();
				return;
			}
			// 根据路径生成二维码图片
			String imgName = this.get32UUID();
			QrcodeUtil.generateQrcode(
					"http://localhost:8080/" + pageData.getString("PATH"),
					"C://qrcode", imgName + ".jpg");
			pageData.put("ANNOUNCEMULTI_ID", this.get32UUID()); // 主键
			
			
			pageData.put("MEDIA_ID", pageData.get("COPYRIGHTMULTI_ID"));
			pageData.put("CODE_ID", this.get32UUID());
			pageData.put("SCAN_CODE_LINK", pageData.getString("PATH"));
			pageData.put("SCAN_CODE_NUM", 0);
			pageData.put("IMG_LINK", "C://qrcode" + imgName + ".jpg");
			pageData.put("DATE_CREATE", DateUtil.getTime());
			//pageData.put("DATE_MODIFY", DateUtil.getTime());
			pageData.put("IS_DELETE", "0");
			announcemultiService.save(pageData);

			// 在发布方多媒体表中插入一条记录
			out.write("success");
			out.close();
		} catch (Exception e) {
			logger.error(e.toString(), e);
			out.write("error");
		}
	}
	
	/**
	 * 下载二维码图片
	 */
	@RequestMapping(value = "/downloadCode")
	public void downloadCode(PrintWriter out,HttpServletResponse response) throws Exception{
		try {
			pd = this.getPageData();
			System.out.println(System.getProperty("user.dir")+"\\test.txt"+"================="+pd.getString("ANNOUNCEMULTI_ID"));
			FileDownload.fileDownload(response, "C:\\qrcode\\h.jpg", "code.jpg");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	

	/**
	 * 列表
	 */
	@RequestMapping(value = "/list")
	public ModelAndView list(Page page,HttpSession session) {
		logBefore(logger, "列表AnnounceMulti");

		try {
			pd = this.getPageData();
			User user = (User) session.getAttribute(Const.SESSION_USER);
			pd.put("USER_ID", user.getUSER_ID());
			page.setPd(pd);
			List<PageData> varList = announcemultiService.list(page); // 列出AnnounceMulti列表
			getHC(); // 调用权限
			mv.setViewName("yunear/announcemulti_list");
			mv.addObject("varList", varList);
			mv.addObject("pd", pd);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}
		return mv;
	}

	/**
	 * 去新增页面
	 */
	@RequestMapping(value = "/goAdd")
	public ModelAndView goAdd() {
		logBefore(logger, "去新增AnnounceMulti页面");

		pd = this.getPageData();
		try {
			mv.setViewName("yunear/announcemulti_edit");
			mv.addObject("msg", "save");
			mv.addObject("pd", pd);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}
		return mv;
	}

	/**
	 * 去修改页面
	 */
	@RequestMapping(value = "/goEdit")
	public ModelAndView goEdit() {
		logBefore(logger, "去修改AnnounceMulti页面");

		pd = this.getPageData();
		try {
			pd = announcemultiService.findById(pd); // 根据ID读取
			mv.setViewName("yunear/announcemulti_edit");
			mv.addObject("msg", "edit");
			mv.addObject("pd", pd);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}
		return mv;
	}

	/**
	 * 批量删除
	 */
	@RequestMapping(value = "/deleteAll")
	@ResponseBody
	public Object deleteAll() {
		logBefore(logger, "批量删除AnnounceMulti");
		Map map = new HashMap();
		try {
			pd = this.getPageData();
			List<PageData> pdList = new ArrayList<PageData>();
			String DATA_IDS = pd.getString("DATA_IDS");
			if (null != DATA_IDS && !"".equals(DATA_IDS)) {
				String ArrayDATA_IDS[] = DATA_IDS.split(",");
				announcemultiService.deleteAll(ArrayDATA_IDS);
				pd.put("msg", "ok");
			} else {
				pd.put("msg", "no");
			}
			pdList.add(pd);
			map.put("list", pdList);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		} finally {
			logAfter(logger);
		}
		return AppUtil.returnObject(pd, map);
	}

	/*
	 * 导出到excel
	 * 
	 * @return
	 */
	@RequestMapping(value = "/excel")
	public ModelAndView exportExcel(HttpSession session) {
		logBefore(logger, "导出AnnounceMulti到excel");
		ModelAndView mv = new ModelAndView();
		pd = this.getPageData();
		User user = (User) session.getAttribute(Const.SESSION_USER);
		pd.put("USER_ID", user.getUSER_ID());
		pd.put("IS_DELETE", "0");
		
		DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
		try {
			Map<String, Object> dataMap = new HashMap<String, Object>();
			List<String> titles = new ArrayList<String>();
			titles.add("发布方ID"); // 1
			titles.add("多媒体ID"); // 2
			titles.add("二维码ID"); // 3
			titles.add("扫码链接"); // 4
			titles.add("扫码数"); // 5
			titles.add("图片链接"); // 6
			titles.add("创建日期"); // 7
			titles.add("修改日期"); // 8
			titles.add("状态：0-未删除，1-已删除"); // 9
			dataMap.put("titles", titles);
			List<PageData> varOList = announcemultiService.listAll(pd);
			List<PageData> varList = new ArrayList<PageData>();
			for (int i = 0; i < varOList.size(); i++) {
				PageData vpd = new PageData();
				vpd.put("var1", varOList.get(i).getString("USER_ID")); // 1
				vpd.put("var2", varOList.get(i).getString("MEDIA_ID")); // 2
				vpd.put("var3", varOList.get(i).getString("CODE_ID")); // 3
				vpd.put("var4", varOList.get(i).getString("SCAN_CODE_LINK")); // 4()
				vpd.put("var5", varOList.get(i).get("SCAN_CODE_NUM").toString()); // 5
				vpd.put("var6", varOList.get(i).getString("IMG_LINK")); // 6
				vpd.put("var7", sdf.format((Date)(varOList.get(i).get("DATE_CREATE")))); // 7
				vpd.put("var8", sdf.format((Date)(varOList.get(i).get("DATE_MODIFY")))); // 8
				vpd.put("var9", varOList.get(i).getString("IS_DELETE")); // 9
				varList.add(vpd);
			}
			dataMap.put("varList", varList);
			ObjectExcelView erv = new ObjectExcelView();
			mv = new ModelAndView(erv, dataMap);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}
		return mv;
	}

	@InitBinder
	public void initBinder(WebDataBinder binder) {
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,
				true));
	}
}
