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
import com.kakasure.service.yunear.CopyrightMultiService;
import com.kakasure.util.AppUtil;
import com.kakasure.util.ObjectExcelView;
import com.kakasure.util.PageData;

/** 
 * 类名称：CopyrightMultiController
 * 创建人：FH 
 * 创建时间：2015-05-13
 */
@Controller
@RequestMapping(value="/copyrightmulti")
public class CopyrightMultiController extends BaseController {
	
	@Resource(name="copyrightmultiService")
	private CopyrightMultiService copyrightmultiService;
	
	/**
	 * 新增
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, "新增CopyrightMulti");
		
		pd = this.getPageData();
		pd.put("COPYRIGHTMULTI_ID", this.get32UUID());	//主键
		copyrightmultiService.save(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**
	 * 删除
	 */
	@RequestMapping(value="/delete")
	public void delete(PrintWriter out){
		logBefore(logger, "删除CopyrightMulti");
		
		try{
			pd = this.getPageData();
			copyrightmultiService.delete(pd);
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
		logBefore(logger, "修改CopyrightMulti");
		
		pd = this.getPageData();
		copyrightmultiService.edit(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**
	 * 列表
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page){
		logBefore(logger, "列表CopyrightMulti");
		
		try{
			pd = this.getPageData();
			page.setPd(pd);
			List<PageData>	varList = copyrightmultiService.list(page);	//列出CopyrightMulti列表
			getHC(); //调用权限
			mv.setViewName("yunear/copyrightmulti/copyrightmulti_list");
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
		logBefore(logger, "去新增CopyrightMulti页面");
		
		pd = this.getPageData();
		try {
			mv.setViewName("yunear/copyrightmulti/copyrightmulti_edit");
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
		logBefore(logger, "去修改CopyrightMulti页面");
		
		pd = this.getPageData();
		try {
			pd = copyrightmultiService.findById(pd);	//根据ID读取
			mv.setViewName("yunear/copyrightmulti/copyrightmulti_edit");
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
		logBefore(logger, "批量删除CopyrightMulti");
		Map map = new HashMap();
		try {
			pd = this.getPageData();
			List<PageData> pdList = new ArrayList<PageData>();
			String DATA_IDS = pd.getString("DATA_IDS");
			if(null != DATA_IDS && !"".equals(DATA_IDS)){
				String ArrayDATA_IDS[] = DATA_IDS.split(",");
				copyrightmultiService.deleteAll(ArrayDATA_IDS);
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
		logBefore(logger, "导出CopyrightMulti到excel");
		ModelAndView mv = new ModelAndView();
		pd = this.getPageData();
		try{
			Map<String,Object> dataMap = new HashMap<String,Object>();
			List<String> titles = new ArrayList<String>();
			titles.add("版权方ID");	//1
			titles.add("多媒体名称");	//2
			titles.add("关键字");	//3
			titles.add("付费类型:0-免费，1-收费");	//4
			titles.add("描述");	//5
			titles.add("多媒体路径");	//6
			titles.add("多媒体类型:01-视频，02-音频");	//7
			titles.add("审核状态：99-待审核，00-审核通过，01-审核不通过");	//8
			titles.add("价格");	//9
			titles.add("推广次数");	//10
			titles.add("点击数");	//11
			titles.add("扫码次数");	//12
			titles.add("创建日期");	//13
			titles.add("修改日期");	//14
			titles.add("状态：0-未删除，1-已删除");	//15
			dataMap.put("titles", titles);
			List<PageData> varOList = copyrightmultiService.listAll(pd);
			List<PageData> varList = new ArrayList<PageData>();
			for(int i=0;i<varOList.size();i++){
				PageData vpd = new PageData();
				vpd.put("var1", varOList.get(i).getString("USER_ID"));	//1
				vpd.put("var2", varOList.get(i).getString("MEDIA_NAME"));	//2
				vpd.put("var3", varOList.get(i).getString("KEYWORDS"));	//3
				vpd.put("var4", varOList.get(i).getString("PAY_TYPE"));	//4
				vpd.put("var5", varOList.get(i).getString("DESCR"));	//5
				vpd.put("var6", varOList.get(i).getString("PATH"));	//6
				vpd.put("var7", varOList.get(i).getString("TYPE"));	//7
				vpd.put("var8", varOList.get(i).getString("AUDIT_STATUS"));	//8
				vpd.put("var9", varOList.get(i).get("PRICE").toString());	//9
				vpd.put("var10", varOList.get(i).get("SPREAD_NUM").toString());	//10
				vpd.put("var11", varOList.get(i).get("CLICK_NUM").toString());	//11
				vpd.put("var12", varOList.get(i).get("SCAN_CODE_NUM").toString());	//12
				vpd.put("var13", varOList.get(i).getString("DATE_CREATE"));	//13
				vpd.put("var14", varOList.get(i).getString("DATE_MODIFY"));	//14
				vpd.put("var15", varOList.get(i).getString("IS_DELETE"));	//15
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
