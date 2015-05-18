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
import com.kakasure.util.AppUtil;
import com.kakasure.util.ObjectExcelView;
import com.kakasure.util.PageData;
import com.kakasure.service.yunear.MessageService;

/** 
 * 类名称：MessageController
 * 创建人：FH 
 * 创建时间：2015-05-13
 */
@Controller
@RequestMapping(value="/message")
public class MessageController extends BaseController {
	
	@Resource(name="messageService")
	private MessageService messageService;
	
	/**
	 * 修改的新增
	 */
	@RequestMapping(value="/save")
	public ModelAndView save(HttpSession session) throws Exception{
		String MEDIA_ID=(String) session.getAttribute("MEDIA_ID");
		logBefore(logger, "新增Message");
		
		pd = this.getPageData();
		pd.put("MESSAGE_ID", this.get32UUID());	//主键
		pd.put("MEDIA_ID", MEDIA_ID);
		pd.put("TYPE", 0);
		pd.put("CONTENT", "对多媒体做了修改操作");
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String a = df.format(new Date());
		Date DATE_CREATE = df.parse(a);
		pd.put("DATE_CREATE", DATE_CREATE);		
		messageService.save(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**
	 * 删除的新增
	 */
	@RequestMapping(value="/deletesave")
	public void deletesave(PrintWriter out,HttpSession session) throws Exception{
		String MEDIA_ID=(String) session.getAttribute("MEDIA_ID");
		logBefore(logger, "新增Message");
		
		pd = this.getPageData();
		pd.put("MESSAGE_ID", this.get32UUID());	//主键
		pd.put("MEDIA_ID", MEDIA_ID);
		pd.put("TYPE", 1);
		pd.put("CONTENT", "对多媒体做了删除操作");
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String a = df.format(new Date());
		Date DATE_CREATE = df.parse(a);
		pd.put("DATE_CREATE", DATE_CREATE);		
		messageService.save(pd);
		out.write("success");
		out.close();
	}
	/**
	 * 删除
	 */
	@RequestMapping(value="/delete")
	public void delete(PrintWriter out){
		logBefore(logger, "删除Message");
		
		try{
			pd = this.getPageData();
			messageService.delete(pd);
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
		logBefore(logger, "修改Message");
		
		pd = this.getPageData();
		messageService.edit(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**
	 * 列表
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page){
		logBefore(logger, "列表Message");
		
		try{
			pd = this.getPageData();
			page.setPd(pd);
			List<PageData>	varList = messageService.list(page);	//列出Message列表
			getHC(); //调用权限
			mv.setViewName("yunear/message_list");
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
		logBefore(logger, "去新增Message页面");
		
		pd = this.getPageData();
		try {
			mv.setViewName("yunear/message_edit");
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
		logBefore(logger, "去修改Message页面");
		
		pd = this.getPageData();
		try {
			pd = messageService.findById(pd);	//根据ID读取
			mv.setViewName("yunear/message_edit");
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
		logBefore(logger, "批量删除Message");
		Map map = new HashMap();
		try {
			pd = this.getPageData();
			List<PageData> pdList = new ArrayList<PageData>();
			String DATA_IDS = pd.getString("DATA_IDS");
			if(null != DATA_IDS && !"".equals(DATA_IDS)){
				String ArrayDATA_IDS[] = DATA_IDS.split(",");
				messageService.deleteAll(ArrayDATA_IDS);
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
		logBefore(logger, "导出Message到excel");
		ModelAndView mv = new ModelAndView();
		pd = this.getPageData();
		try{
			Map<String,Object> dataMap = new HashMap<String,Object>();
			List<String> titles = new ArrayList<String>();
			titles.add("多媒体ID");	//1
			titles.add("消息类型：0-修改描述，1-修改视频，2-修改价格");	//2
			titles.add("消息内容");	//3
			titles.add("创建日期");	//4
			titles.add("修改日期");	//5
			titles.add("状态：0-未删除，1-删除");	//6
			dataMap.put("titles", titles);
			List<PageData> varOList = messageService.listAll(pd);
			List<PageData> varList = new ArrayList<PageData>();
			for(int i=0;i<varOList.size();i++){
				PageData vpd = new PageData();
				vpd.put("var1", varOList.get(i).getString("MEDIA_ID"));	//1
				vpd.put("var2", varOList.get(i).getString("TYPE"));	//2
				vpd.put("var3", varOList.get(i).getString("CONTENT"));	//3
				vpd.put("var4", varOList.get(i).getString("DATE_CREATE"));	//4
				vpd.put("var5", varOList.get(i).getString("DATE_MODIFY"));	//5
				vpd.put("var6", varOList.get(i).getString("IS_DELETE"));	//6
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
