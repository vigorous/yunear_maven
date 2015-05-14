package com.kakasure.service.yunear;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kakasure.dao.DaoSupport;
import com.kakasure.entity.Page;
import com.kakasure.entity.yunear.Message;
import com.kakasure.util.PageData;


@Service("messageService")
public class MessageService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/*
	* 新增
	*/
	public void save(PageData pd)throws Exception{
		dao.save("MessageMapper.save", pd);
	}
	
	public void savemessage(Message message)throws Exception{
		dao.save("MessageMapper.savemessage", message);
	}
	
	/*
	* 删除
	*/
	public void delete(PageData pd)throws Exception{
		dao.delete("MessageMapper.delete", pd);
	}
	
	/*
	* 修改
	*/
	public void edit(PageData pd)throws Exception{
		dao.update("MessageMapper.edit", pd);
	}
	
	/*
	*列表
	*/
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("MessageMapper.datalistPage", page);
	}
	
	/*
	*列表(全部)
	*/
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("MessageMapper.listAll", pd);
	}
	
	/*
	* 通过id获取数据
	*/
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("MessageMapper.findById", pd);
	}
	
	/*
	* 批量删除
	*/
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("MessageMapper.deleteAll", ArrayDATA_IDS);
	}
	
}

