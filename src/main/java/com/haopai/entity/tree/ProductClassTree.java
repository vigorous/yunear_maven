package com.haopai.entity.tree;

import java.io.Serializable;

@SuppressWarnings("serial")
public class ProductClassTree implements Serializable {
	private String PRODUCTCLASS_ID;
	private String CLASS_NAME;
	private String CLASS_PARENTID;
	
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
	
}
