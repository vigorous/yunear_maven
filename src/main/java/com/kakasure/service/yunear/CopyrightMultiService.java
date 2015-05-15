package com.kakasure.service.yunear;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kakasure.dao.DaoSupport;
import com.kakasure.entity.Page;
import com.kakasure.util.PageData;


@Service("copyrightmultiService")
public class CopyrightMultiService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/*
	* 新增
	*/
	public void save(PageData pd)throws Exception{
		dao.save("CopyrightMultiMapper.save", pd);
	}
	
	public void savemulti(PageData pd)throws Exception{
		dao.save("CopyrightMultiMapper.savemulti", pd);
	}
	
	/*
	* 删除
	*/
	public void delete(PageData pd)throws Exception{
		dao.delete("CopyrightMultiMapper.deletlj", pd);
	}
	
	/*
	* 修改
	*/
	public void edit(PageData pd)throws Exception{
		dao.update("CopyrightMultiMapper.edit", pd);
	}
	/**
	 * 审核状态修改
	 * @param pd
	 * @throws Exception
	 */
	public void update(PageData pd)throws Exception{
		dao.update("CopyrightMultiMapper.update", pd);
	}
	/*
	*列表
	*/
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("CopyrightMultiMapper.datalistPage", page);
	}
	/*
	*列表
	*/
	public List<PageData> fuzzylist(Page page)throws Exception{
		return (List<PageData>)dao.findForList("CopyrightMultiMapper.fuzzylistPage", page);
	}
	/*
	*审核多媒体列表
	*/
	public List<PageData> auditlist(Page page)throws Exception{
		return (List<PageData>)dao.findForList("CopyrightMultiMapper.auditlistPage", page);
	}
	
	/*
	*列表(全部)
	*/
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("CopyrightMultiMapper.listAll", pd);
	}
	
	/*
	* 通过id获取数据
	*/
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("CopyrightMultiMapper.findById", pd);
	}
	
	/*
	* 批量删除
	*/
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("CopyrightMultiMapper.deleteAll", ArrayDATA_IDS);
	}
	
}

