package com.kakasure.entity.yunear;

import java.io.Serializable;

@SuppressWarnings("serial")
public class AnnounceMulti implements Serializable {
	
	private String ANNOUNCEMULTI_ID;//发布方多媒体ID
	private String NAME;//多媒体名称
	private String USER_ID;//发布方ID
	private String MEDIA_ID;//版权方多媒体ID
	private String CODE_ID;//二维码ID
	private String STATUS;//状态
	private String CREATE_TIME;//创建日期
	private String UPD_TIME;//修改日期
	
	public String getANNOUNCEMULTI_ID() {
		return ANNOUNCEMULTI_ID;
	}
	public void setANNOUNCEMULTI_ID(String aNNOUNCEMULTI_ID) {
		ANNOUNCEMULTI_ID = aNNOUNCEMULTI_ID;
	}
	public String getNAME() {
		return NAME;
	}
	public void setNAME(String nAME) {
		NAME = nAME;
	}
	public String getUSER_ID() {
		return USER_ID;
	}
	public void setUSER_ID(String uSER_ID) {
		USER_ID = uSER_ID;
	}
	public String getMEDIA_ID() {
		return MEDIA_ID;
	}
	public void setMEDIA_ID(String mEDIA_ID) {
		MEDIA_ID = mEDIA_ID;
	}
	public String getCODE_ID() {
		return CODE_ID;
	}
	public void setCODE_ID(String cODE_ID) {
		CODE_ID = cODE_ID;
	}
	public String getSTATUS() {
		return STATUS;
	}
	public void setSTATUS(String sTATUS) {
		STATUS = sTATUS;
	}
	public String getCREATE_TIME() {
		return CREATE_TIME;
	}
	public void setCREATE_TIME(String cREATE_TIME) {
		CREATE_TIME = cREATE_TIME;
	}
	public String getUPD_TIME() {
		return UPD_TIME;
	}
	public void setUPD_TIME(String uPD_TIME) {
		UPD_TIME = uPD_TIME;
	}
	
}
