package com.kakasure.entity.yunear;

import java.io.Serializable;
import java.util.Date;

public class CopyrightMulti implements Serializable {
	
	private static final long serialVersionUID = 1677739575742150591L;
	
	private String COPYRIGHTMULTI_ID;//上传多媒体id
	private String USER_ID;//版权方ID
	private String MEDIA_NAME;//多媒体名称
	private String MEDIA_THEME;//主题
	private String KEYWORD;//标签
	private String PAY_TYPE;//付费类型
	private String DESCR;//描述
	private String PATH;//多媒体路径
	private String TYPE;//多媒体类型
	private String AUDIT_STATUS;//审核状态
	private double PRICE;//价格
	private Date UPLOAD_TIME;//上传日期
	private Date UPD_TIME;//修改日期
	private String STATUS;//状态
	private String SPREAD_NUM;//推广次数
	private String CLICK_NUM;//点击次数
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
	public String getMEDIA_THEME() {
		return MEDIA_THEME;
	}
	public void setMEDIA_THEME(String mEDIA_THEME) {
		MEDIA_THEME = mEDIA_THEME;
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
	public Date getUPLOAD_TIME() {
		return UPLOAD_TIME;
	}
	public void setUPLOAD_TIME(Date uPLOAD_TIME) {
		UPLOAD_TIME = uPLOAD_TIME;
	}
	public Date getUPD_TIME() {
		return UPD_TIME;
	}
	public void setUPD_TIME(Date uPD_TIME) {
		UPD_TIME = uPD_TIME;
	}
	public String getSTATUS() {
		return STATUS;
	}
	public void setSTATUS(String sTATUS) {
		STATUS = sTATUS;
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
