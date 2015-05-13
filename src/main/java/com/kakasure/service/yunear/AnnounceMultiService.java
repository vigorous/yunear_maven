package com.kakasure.service.yunear;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kakasure.dao.DaoSupport;
import com.kakasure.entity.Page;
import com.kakasure.util.PageData;


@Service("announcemultiService")
public class AnnounceMultiService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/*
	* 新增
	*/
	public void save(PageData pd)throws Exception{
		dao.save("AnnounceMultiMapper.save", pd);
	}
	
	/*
	* 删除
	*/
	public void delete(PageData pd)throws Exception{
		dao.delete("AnnounceMultiMapper.delete", pd);
	}
	
	/*
	* 修改
	*/
	public void edit(PageData pd)throws Exception{
		dao.update("AnnounceMultiMapper.edit", pd);
	}
	
	/*
	*版权方多媒体列表
	*/
	public List<PageData> allMultiList(Page page)throws Exception{
		return (List<PageData>)dao.findForList("AnnounceMultiMapper.multilistPage", page);
	}
	
	/*
	*列表
	*/
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("AnnounceMultiMapper.datalistPage", page);
	}
	
	/*
	*列表(全部)
	*/
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("AnnounceMultiMapper.listAll", pd);
	}
	
	/*
	* 通过id获取数据
	*/
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("AnnounceMultiMapper.findById", pd);
	}
	
	/*
	* 批量删除
	*/
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("AnnounceMultiMapper.deleteAll", ArrayDATA_IDS);
	}
	
}

