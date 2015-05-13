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

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kakasure.controller.base.BaseController;
import com.kakasure.entity.Page;
import com.kakasure.service.yunear.AnnounceMultiService;
import com.kakasure.util.AppUtil;
import com.kakasure.util.ObjectExcelView;
import com.kakasure.util.PageData;

/** 
 * 类名称：AnnounceMultiController
 * 创建人：FH 
 * 创建时间：2015-05-12
 */
@Controller
@RequestMapping(value="/announcemulti")
public class AnnounceMultiController extends BaseController {
	
	@Resource(name="announcemultiService")
	private AnnounceMultiService announcemultiService;
	
	//public 
	
	/**
	 * 新增
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, "新增AnnounceMulti");
		
		pd = this.getPageData();
		pd.put("ANNOUNCEMULTI_ID", this.get32UUID());	//主键
		announcemultiService.save(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**
	 * 删除
	 */
	@RequestMapping(value="/delete")
	public void delete(PrintWriter out){
		logBefore(logger, "删除AnnounceMulti");
		
		try{
			pd = this.getPageData();
			announcemultiService.delete(pd);
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
		logBefore(logger, "修改AnnounceMulti");
		
		pd = this.getPageData();
		announcemultiService.edit(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**
	 * 列表
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page){
		logBefore(logger, "列表AnnounceMulti");
		
		try{
			pd = this.getPageData();
			page.setPd(pd);
			List<PageData>	varList = announcemultiService.list(page);	//列出AnnounceMulti列表
			getHC(); //调用权限
			mv.setViewName("yunear/announcemulti/announcemulti_list");
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
		logBefore(logger, "去新增AnnounceMulti页面");
		
		pd = this.getPageData();
		try {
			mv.setViewName("yunear/announcemulti/announcemulti_edit");
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
		logBefore(logger, "去修改AnnounceMulti页面");
		
		pd = this.getPageData();
		try {
			pd = announcemultiService.findById(pd);	//根据ID读取
			mv.setViewName("yunear/announcemulti/announcemulti_edit");
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
		logBefore(logger, "批量删除AnnounceMulti");
		Map map = new HashMap();
		try {
			pd = this.getPageData();
			List<PageData> pdList = new ArrayList<PageData>();
			String DATA_IDS = pd.getString("DATA_IDS");
			if(null != DATA_IDS && !"".equals(DATA_IDS)){
				String ArrayDATA_IDS[] = DATA_IDS.split(",");
				announcemultiService.deleteAll(ArrayDATA_IDS);
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
		logBefore(logger, "导出AnnounceMulti到excel");
		ModelAndView mv = new ModelAndView();
		pd = this.getPageData();
		try{
			Map<String,Object> dataMap = new HashMap<String,Object>();
			List<String> titles = new ArrayList<String>();
			titles.add("多媒体名称");	//1
			titles.add("发布方ID");	//2
			titles.add("多媒体ID");	//3
			titles.add("二维码ID");	//4
			titles.add("状态");	//5
			titles.add("创建日期");	//6
			titles.add("修改日期");	//7
			dataMap.put("titles", titles);
			List<PageData> varOList = announcemultiService.listAll(pd);
			List<PageData> varList = new ArrayList<PageData>();
			for(int i=0;i<varOList.size();i++){
				PageData vpd = new PageData();
				vpd.put("var1", varOList.get(i).getString("NAME"));	//1
				vpd.put("var2", varOList.get(i).getString("USER_ID"));	//2
				vpd.put("var3", varOList.get(i).getString("MEDIA_ID"));	//3
				vpd.put("var4", varOList.get(i).getString("CODE_ID"));	//4
				vpd.put("var5", varOList.get(i).getString("STATUS"));	//5
				vpd.put("var6", varOList.get(i).getString("CREATE_TIME"));	//6
				vpd.put("var7", varOList.get(i).getString("UPD_TIME"));	//7
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
	
	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}
}
