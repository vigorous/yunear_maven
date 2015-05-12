package com.kakasure.entity.yunear;

import java.util.Date;

public class TbCode {
    private String TBCODE_ID;

    private String CODE_NAME;

    private String USER_ID;

    private String MEDIA_ID;

    private String SCAN_CODE_LINK;

    private Integer SCAN_CODE_NUM;

    private String IMG_LINK;

    private String STATUS;

    private Date CREATE_TIME;

    private Date UPD_TIME;

	public String getTBCODE_ID() {
		return TBCODE_ID;
	}

	public void setTBCODE_ID(String tBCODE_ID) {
		TBCODE_ID = tBCODE_ID;
	}

	public String getCODE_NAME() {
		return CODE_NAME;
	}

	public void setCODE_NAME(String cODE_NAME) {
		CODE_NAME = cODE_NAME;
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

	public String getSCAN_CODE_LINK() {
		return SCAN_CODE_LINK;
	}

	public void setSCAN_CODE_LINK(String sCAN_CODE_LINK) {
		SCAN_CODE_LINK = sCAN_CODE_LINK;
	}

	public Integer getSCAN_CODE_NUM() {
		return SCAN_CODE_NUM;
	}

	public void setSCAN_CODE_NUM(Integer sCAN_CODE_NUM) {
		SCAN_CODE_NUM = sCAN_CODE_NUM;
	}

	public String getIMG_LINK() {
		return IMG_LINK;
	}

	public void setIMG_LINK(String iMG_LINK) {
		IMG_LINK = iMG_LINK;
	}

	public String getSTATUS() {
		return STATUS;
	}

	public void setSTATUS(String sTATUS) {
		STATUS = sTATUS;
	}

	public Date getCREATE_TIME() {
		return CREATE_TIME;
	}

	public void setCREATE_TIME(Date cREATE_TIME) {
		CREATE_TIME = cREATE_TIME;
	}

	public Date getUPD_TIME() {
		return UPD_TIME;
	}

	public void setUPD_TIME(Date uPD_TIME) {
		UPD_TIME = uPD_TIME;
	}

    
}