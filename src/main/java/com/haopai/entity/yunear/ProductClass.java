package com.haopai.entity.yunear;

import java.io.Serializable;
import java.util.List;

@SuppressWarnings("serial")
public class ProductClass implements Serializable {
	
	private String PRODUCTCLASS_ID;
	private String CLASS_NAME;
	private String CLASS_PARENTID;
	private Integer GRADE;
	private String CREATE_DATE;
	private String UPDATE_DATE;
	
	private ProductClass parentProductClass;
	private List<ProductClass> subProductClass;
	
	public String getPRODUCTCLASS_ID() {
		return PRODUCTCLASS_ID;
	}
	public void setPRODUCTCLASS_ID(String pRODUCTCLASS_ID) {
		PRODUCTCLASS_ID = pRODUCTCLASS_ID;
	}
	public String getCLASS_NAME() {
		return CLASS_NAME;
	}
	public void setCLASS_NAME(String cLASS_NAME) {
		CLASS_NAME = cLASS_NAME;
	}
	public String getCLASS_PARENTID() {
		return CLASS_PARENTID;
	}
	public void setCLASS_PARENTID(String cLASS_PARENTID) {
		CLASS_PARENTID = cLASS_PARENTID;
	}
	public Integer getGRADE() {
		return GRADE;
	}
	public void setGRADE(Integer gRADE) {
		GRADE = gRADE;
	}
	public String getCREATE_DATE() {
		return CREATE_DATE;
	}
	public void setCREATE_DATE(String cREATE_DATE) {
		CREATE_DATE = cREATE_DATE;
	}
	public String getUPDATE_DATE() {
		return UPDATE_DATE;
	}
	public void setUPDATE_DATE(String uPDATE_DATE) {
		UPDATE_DATE = uPDATE_DATE;
	}
	public ProductClass getParentProductClass() {
		return parentProductClass;
	}
	public void setParentProductClass(ProductClass parentProductClass) {
		this.parentProductClass = parentProductClass;
	}
	public List<ProductClass> getSubProductClass() {
		return subProductClass;
	}
	public void setSubProductClass(List<ProductClass> subProductClass) {
		this.subProductClass = subProductClass;
	}
	
}
