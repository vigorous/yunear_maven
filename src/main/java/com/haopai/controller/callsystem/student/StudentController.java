package com.haopai.controller.callsystem.student;

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

import com.haopai.controller.base.BaseController;
import com.haopai.entity.system.Menu;
import com.haopai.entity.Page;
import com.haopai.util.AppUtil;
import com.haopai.util.ObjectExcelView;
import com.haopai.util.Const;
import com.haopai.util.PageData;
import com.haopai.util.Tools;
import com.haopai.service.callsystem.student.StudentService;

/** 
 * 类名称：StudentController
 * 创建人：FH 
 * 创建时间：2017-07-23
 */
@Controller
@RequestMapping(value="/student")
public class StudentController extends BaseController {
	
	@Resource(name="studentService")
	private StudentService studentService;
	
	/**
	 * 新增
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, "新增Student");
		
		pd = this.getPageData();
		pd.put("STUDENT_ID", this.get32UUID());	//主键
		studentService.save(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**
	 * 删除
	 */
	@RequestMapping(value="/delete")
	public void delete(PrintWriter out){
		logBefore(logger, "删除Student");
		
		try{
			pd = this.getPageData();
			studentService.delete(pd);
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
		logBefore(logger, "修改Student");
		
		pd = this.getPageData();
		studentService.edit(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**
	 * 列表
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page){
		logBefore(logger, "列表Student");
		
		try{
			pd = this.getPageData();
			page.setPd(pd);
			List<PageData>	varList = studentService.list(page);	//列出Student列表
			getHC(); //调用权限
			mv.setViewName("callsystem/student/student_list");
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
		logBefore(logger, "去新增Student页面");
		
		pd = this.getPageData();
		try {
			mv.setViewName("callsystem/student/student_edit");
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
		logBefore(logger, "去修改Student页面");
		
		pd = this.getPageData();
		try {
			pd = studentService.findById(pd);	//根据ID读取
			mv.setViewName("callsystem/student/student_edit");
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
		logBefore(logger, "批量删除Student");
		Map map = new HashMap();
		try {
			pd = this.getPageData();
			List<PageData> pdList = new ArrayList<PageData>();
			String DATA_IDS = pd.getString("DATA_IDS");
			if(null != DATA_IDS && !"".equals(DATA_IDS)){
				String ArrayDATA_IDS[] = DATA_IDS.split(",");
				studentService.deleteAll(ArrayDATA_IDS);
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
		logBefore(logger, "导出Student到excel");
		ModelAndView mv = new ModelAndView();
		pd = this.getPageData();
		try{
			Map<String,Object> dataMap = new HashMap<String,Object>();
			List<String> titles = new ArrayList<String>();
			titles.add("姓名");	//1
			titles.add("年龄");	//2
			titles.add("级别");	//3
			titles.add("班级名称");	//4
			titles.add("地址");	//5
			titles.add("入学时间");	//6
			titles.add("创建时间");	//7
			titles.add("修改时间");	//8
			titles.add("课程ID");	//9
			dataMap.put("titles", titles);
			List<PageData> varOList = studentService.listAll(pd);
			List<PageData> varList = new ArrayList<PageData>();
			for(int i=0;i<varOList.size();i++){
				PageData vpd = new PageData();
				vpd.put("var1", varOList.get(i).getString("NAME"));	//1
				vpd.put("var2", varOList.get(i).get("AGE").toString());	//2
				vpd.put("var3", varOList.get(i).get("LEVEL").toString());	//3
				vpd.put("var4", varOList.get(i).getString("CLASS_NAME"));	//4
				vpd.put("var5", varOList.get(i).getString("ADDRESS"));	//5
				vpd.put("var6", varOList.get(i).getString("ENTER_TIME"));	//6
				vpd.put("var7", varOList.get(i).getString("CREATE_TIME"));	//7
				vpd.put("var8", varOList.get(i).getString("UPDATE_TIME"));	//8
				vpd.put("var9", varOList.get(i).getString("COURSE_ID"));	//9
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
