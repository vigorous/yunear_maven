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
import com.kakasure.service.yunear.UserplusService;
import com.kakasure.util.AppUtil;
import com.kakasure.util.ObjectExcelView;
import com.kakasure.util.PageData;

/** 
 * 类名称：UserplusController
 * 创建人：FH 
 * 创建时间：2015-05-12
 */
@Controller
@RequestMapping(value="/userplus")
public class UserplusController extends BaseController {
	
	@Resource(name="userplusService")
	private UserplusService userplusService;
	
	/**
	 * 新增
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, "新增Userplus");
		
		pd = this.getPageData();
		pd.put("USERPLUS_ID", this.get32UUID());	//主键
		userplusService.save(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**
	 * 删除
	 */
	@RequestMapping(value="/delete")
	public void delete(PrintWriter out){
		logBefore(logger, "删除Userplus");
		
		try{
			pd = this.getPageData();
			userplusService.delete(pd);
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
		logBefore(logger, "修改Userplus");
		
		pd = this.getPageData();
		userplusService.edit(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**
	 * 列表
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page){
		logBefore(logger, "列表Userplus");
		
		try{
			pd = this.getPageData();
			page.setPd(pd);
			List<PageData>	varList = userplusService.list(page);	//列出Userplus列表
			getHC(); //调用权限
			mv.setViewName("yunear/userplus/userplus_list");
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
		logBefore(logger, "去新增Userplus页面");
		
		pd = this.getPageData();
		try {
			mv.setViewName("yunear/userplus/userplus_edit");
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
		logBefore(logger, "去修改Userplus页面");
		
		pd = this.getPageData();
		try {
			pd = userplusService.findById(pd);	//根据ID读取
			mv.setViewName("yunear/userplus/userplus_edit");
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
		logBefore(logger, "批量删除Userplus");
		Map map = new HashMap();
		try {
			pd = this.getPageData();
			List<PageData> pdList = new ArrayList<PageData>();
			String DATA_IDS = pd.getString("DATA_IDS");
			if(null != DATA_IDS && !"".equals(DATA_IDS)){
				String ArrayDATA_IDS[] = DATA_IDS.split(",");
				userplusService.deleteAll(ArrayDATA_IDS);
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
		logBefore(logger, "导出Userplus到excel");
		ModelAndView mv = new ModelAndView();
		pd = this.getPageData();
		try{
			Map<String,Object> dataMap = new HashMap<String,Object>();
			List<String> titles = new ArrayList<String>();
			titles.add("用户名");	//1
			titles.add("企业名称");	//2
			titles.add("版权证明文件");	//3
			titles.add("版权号");	//4
			titles.add("税务登记证");	//5
			titles.add("营业执照");	//6
			titles.add("银行名称");	//7
			titles.add("银行帐号");	//8
			titles.add("联系人姓名");	//9
			titles.add("联系人手机号");	//10
			titles.add("审核状态");	//11
			titles.add("审核日期");	//12
			titles.add("创建日期");	//13
			titles.add("修改日期");	//14
			titles.add("账户余额");	//15
			titles.add("状态");	//16
			titles.add("描述");	//17
			dataMap.put("titles", titles);
			List<PageData> varOList = userplusService.listAll(pd);
			List<PageData> varList = new ArrayList<PageData>();
			for(int i=0;i<varOList.size();i++){
				PageData vpd = new PageData();
				vpd.put("var1", varOList.get(i).getString("USER_NAME"));	//1
				vpd.put("var2", varOList.get(i).getString("CORPORATION_NAME"));	//2
				vpd.put("var3", varOList.get(i).getString("COPYRIGHT_FILE"));	//3
				vpd.put("var4", varOList.get(i).getString("COPYRIGHT_NO"));	//4
				vpd.put("var5", varOList.get(i).getString("TAX_CERT"));	//5
				vpd.put("var6", varOList.get(i).getString("BUSINESS_LICENSE"));	//6
				vpd.put("var7", varOList.get(i).getString("BANK_NAME"));	//7
				vpd.put("var8", varOList.get(i).getString("BANK_ACCOUNT"));	//8
				vpd.put("var9", varOList.get(i).getString("CONTACT_NAME"));	//9
				vpd.put("var10", varOList.get(i).getString("CONTACT_MOBILE"));	//10
				vpd.put("var11", varOList.get(i).getString("AUDIT_STATUS"));	//11
				vpd.put("var12", varOList.get(i).getString("AUDIT_TIME"));	//12
				vpd.put("var13", varOList.get(i).getString("CREATE_TIME"));	//13
				vpd.put("var14", varOList.get(i).getString("UPD_TIME"));	//14
				vpd.put("var15", varOList.get(i).getString("ACCOUNT_BALANCE"));	//15
				vpd.put("var16", varOList.get(i).getString("STATUS"));	//16
				vpd.put("var17", varOList.get(i).getString("DESCR"));	//17
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
