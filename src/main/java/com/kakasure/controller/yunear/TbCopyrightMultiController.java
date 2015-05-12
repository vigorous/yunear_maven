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
import com.kakasure.entity.system.Menu;
import com.kakasure.service.yunear.TbCopyrightMultiService;
import com.kakasure.util.AppUtil;
import com.kakasure.util.Const;
import com.kakasure.util.ObjectExcelView;
import com.kakasure.util.PageData;

/** 
 * 类名称：TbCopyrightMultiController
 * 创建人：FH 
 * 创建时间：2015-05-11
 */
@Controller
@RequestMapping(value="/tbcopyrightmulti")
public class TbCopyrightMultiController extends BaseController {
	
	@Resource(name="tbcopyrightmultiService")
	private TbCopyrightMultiService tbcopyrightmultiService;
	
	/**
	 * 新增
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, "新增TbCopyrightMulti");
		
		pd = this.getPageData();
		pd.put("TBCOPYRIGHTMULTI_ID", this.get32UUID());	//主键
		tbcopyrightmultiService.save(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**
	 * 删除
	 */
	@RequestMapping(value="/delete")
	public void delete(PrintWriter out){
		logBefore(logger, "删除TbCopyrightMulti");
		
		try{
			pd = this.getPageData();
			tbcopyrightmultiService.delete(pd);
			out.write("success");
			out.close();
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		
	}
	
	/**
	 * 修改
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger, "修改TbCopyrightMulti");
		
		pd = this.getPageData();
		tbcopyrightmultiService.edit(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**
	 * 列表
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page){
		logBefore(logger, "列表TbCopyrightMulti");
		
		try{
			pd = this.getPageData();
			page.setPd(pd);
			List<PageData>	varList = tbcopyrightmultiService.list(page);	//列出TbCopyrightMulti列表
			this.getHC(); //调用权限
			mv.setViewName("yunear/tbcopyrightmulti/tbcopyrightmulti_list");
			mv.addObject("varList", varList);
			mv.addObject("pd", pd);
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return mv;
	}
	
	/**
	 * 去新增页面
	 */
	@RequestMapping(value="/goAdd")
	public ModelAndView goAdd(){
		logBefore(logger, "去新增TbCopyrightMulti页面");
		
		pd = this.getPageData();
		try {
			mv.setViewName("yunear/tbcopyrightmulti/tbcopyrightmulti_edit");
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
	@RequestMapping(value="/goEdit")
	public ModelAndView goEdit(){
		logBefore(logger, "去修改TbCopyrightMulti页面");
		
		pd = this.getPageData();
		try {
			pd = tbcopyrightmultiService.findById(pd);	//根据ID读取
			mv.setViewName("yunear/tbcopyrightmulti/tbcopyrightmulti_edit");
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
	@RequestMapping(value="/deleteAll")
	@ResponseBody
	public Object deleteAll() {
		logBefore(logger, "批量删除TbCopyrightMulti");
		Map map = new HashMap();
		try {
			pd = this.getPageData();
			List<PageData> pdList = new ArrayList<PageData>();
			String DATA_IDS = pd.getString("DATA_IDS");
			if(null != DATA_IDS && !"".equals(DATA_IDS)){
				String ArrayDATA_IDS[] = DATA_IDS.split(",");
				tbcopyrightmultiService.deleteAll(ArrayDATA_IDS);
				pd.put("msg", "ok");
			}else{
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
	 * @return
	 */
	@RequestMapping(value="/excel")
	public ModelAndView exportExcel(){
		logBefore(logger, "导出TbCopyrightMulti到excel");
		ModelAndView mv = new ModelAndView();
		pd = this.getPageData();
		try{
			Map<String,Object> dataMap = new HashMap<String,Object>();
			List<String> titles = new ArrayList<String>();
			titles.add("版权方ID");	//1
			titles.add("多媒体名称");	//2
			titles.add("主题");	//3
			titles.add("关键字");	//4
			titles.add("支付方式");	//5
			titles.add("描述");	//6
			titles.add("多媒体路径");	//7
			titles.add("多媒体类型");	//8
			titles.add("审核状态");	//9
			titles.add("价格");	//10
			titles.add("上传日期");	//11
			titles.add("上传日期");	//12
			titles.add("状态");	//13
			titles.add("推广次数");	//14
			titles.add("点击数");	//15
			dataMap.put("titles", titles);
			List<PageData> varOList = tbcopyrightmultiService.listAll(pd);
			List<PageData> varList = new ArrayList<PageData>();
			for(int i=0;i<varOList.size();i++){
				PageData vpd = new PageData();
				vpd.put("var1", varOList.get(i).getString("USER_ID"));	//1
				vpd.put("var2", varOList.get(i).getString("MEDIA_NAME"));	//2
				vpd.put("var3", varOList.get(i).getString("MEDIA_THEME"));	//3
				vpd.put("var4", varOList.get(i).getString("KEYWORD"));	//4
				vpd.put("var5", varOList.get(i).getString("PAY_TYPE"));	//5
				vpd.put("var6", varOList.get(i).getString("DESCR"));	//6
				vpd.put("var7", varOList.get(i).getString("PATH"));	//7
				vpd.put("var8", varOList.get(i).getString("TYPE"));	//8
				vpd.put("var9", varOList.get(i).getString("AUDIT_STATUS"));	//9
				vpd.put("var10", varOList.get(i).getString("PRICE"));	//10
				vpd.put("var11", varOList.get(i).getString("UPLOAD_TIME"));	//11
				vpd.put("var12", varOList.get(i).getString("UPD_TIME"));	//12
				vpd.put("var13", varOList.get(i).getString("STATUS"));	//13
				vpd.put("var14", varOList.get(i).getString("SPREAD_NUM"));	//14
				vpd.put("var15", varOList.get(i).getString("CLICK_NUM"));	//15
				varList.add(vpd);
			}
			dataMap.put("varList", varList);
			ObjectExcelView erv = new ObjectExcelView();
			mv = new ModelAndView(erv,dataMap);
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return mv;
	}
	
	/* ===============================权限================================== */
	public void getHC(){
		HttpSession session = this.getRequest().getSession();
		Map<String, String> map = (Map<String, String>)session.getAttribute(Const.SESSION_QX);
		mv.addObject(Const.SESSION_QX,map);	//按钮权限
		List<Menu> menuList = (List)session.getAttribute(Const.SESSION_menuList);
		mv.addObject(Const.SESSION_menuList, menuList);//菜单权限
	}
	/* ===============================权限================================== */
	
	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}
}