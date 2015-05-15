package com.kakasure.entity.yunear;

import java.io.Serializable;
import java.util.Date;

public class CopyrightMulti implements Serializable {
	
	private static final long serialVersionUID = 1677739575742150591L;
	
	private String COPYRIGHTMULTI_ID;//上传多媒体id
	private String USER_ID;//版权方ID
	private String MEDIA_NAME;//多媒体名称
	private String KEYWORD;//标签
	private String PAY_TYPE;//付费类型
	private String DESCR;//描述
	private String PATH;//多媒体路径
	private String TYPE;//多媒体类型
	private String AUDIT_STATUS;//审核状态
	private double PRICE;//价格
	private Date DATE_CREATE;//上传日期
	private Date DATE_CREATE1;
	private Date DATE_MODIFY;//修改日期
	private String IS_DELETE;//状态
	private String SPREAD_NUM;//推广次数
	private String CLICK_NUM;//点击次数
	private String SCAN_CODE_NUM;//扫码次数
	public Date getDATE_CREATE1() {
		return DATE_CREATE1;
	}
	public void setDATE_CREATE1(Date dATE_CREATE1) {
		DATE_CREATE1 = dATE_CREATE1;
	}
	public Date getDATE_CREATE() {
		return DATE_CREATE;
	}
	public void setDATE_CREATE(Date dATE_CREATE) {
		DATE_CREATE = dATE_CREATE;
	}
	public Date getDATE_MODIFY() {
		return DATE_MODIFY;
	}
	public void setDATE_MODIFY(Date dATE_MODIFY) {
		DATE_MODIFY = dATE_MODIFY;
	}
	
	public String getCOPYRIGHTMULTI_ID() {
		return COPYRIGHTMULTI_ID;
	}
	public void setCOPYRIGHTMULTI_ID(String cOPYRIGHTMULTI_ID) {
		COPYRIGHTMULTI_ID = cOPYRIGHTMULTI_ID;
	}
	public String getUSER_ID() {
		return USER_ID;
	}
	public void setUSER_ID(String uSER_ID) {
		USER_ID = uSER_ID;
	}
	public String getMEDIA_NAME() {
		return MEDIA_NAME;
	}
	public void setMEDIA_NAME(String mEDIA_NAME) {
		MEDIA_NAME = mEDIA_NAME;
	}

	public String getKEYWORD() {
		return KEYWORD;
	}
	public void setKEYWORD(String kEYWORD) {
		KEYWORD = kEYWORD;
	}
	public String getPAY_TYPE() {
		return PAY_TYPE;
	}
	public void setPAY_TYPE(String pAY_TYPE) {
		PAY_TYPE = pAY_TYPE;
	}
	public String getDESCR() {
		return DESCR;
	}
	public void setDESCR(String dESCR) {
		DESCR = dESCR;
	}
	public String getPATH() {
		return PATH;
	}
	public void setPATH(String pATH) {
		PATH = pATH;
	}
	public String getTYPE() {
		return TYPE;
	}
	public void setTYPE(String tYPE) {
		TYPE = tYPE;
	}
	public String getAUDIT_STATUS() {
		return AUDIT_STATUS;
	}
	public void setAUDIT_STATUS(String aUDIT_STATUS) {
		AUDIT_STATUS = aUDIT_STATUS;
	}
	public double getPRICE() {
		return PRICE;
	}
	public void setPRICE(double pRICE) {
		PRICE = pRICE;
	}

	public String getIS_DELETE() {
		return IS_DELETE;
	}
	public void setIS_DELETE(String iS_DELETE) {
		IS_DELETE = iS_DELETE;
	}
	public String getSCAN_CODE_NUM() {
		return SCAN_CODE_NUM;
	}
	public void setSCAN_CODE_NUM(String sCAN_CODE_NUM) {
		SCAN_CODE_NUM = sCAN_CODE_NUM;
	}
	public String getSPREAD_NUM() {
		return SPREAD_NUM;
	}
	public void setSPREAD_NUM(String sPREAD_NUM) {
		SPREAD_NUM = sPREAD_NUM;
	}
	public String getCLICK_NUM() {
		return CLICK_NUM;
	}
	public void setCLICK_NUM(String cLICK_NUM) {
		CLICK_NUM = cLICK_NUM;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
}
