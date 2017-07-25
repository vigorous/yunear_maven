package com.haopai.entity.yunear;

import java.io.Serializable;

@SuppressWarnings("serial")
public class AnnounceMulti implements Serializable {

	private String ANNOUNCEMULTI_ID;// 发布方多媒体ID
	private String USER_ID;
	private String MEDIA_ID;
	private String MEDIA_NAME;
	private String CODE_ID;
	private String SCAN_CODE_LINK;
	private String SCAN_CODE_NUM;
	private String IMG_LINK;
	private String DATE_CREATE;
	private String DATE_MODIFY;
	private String IS_DELETE;

	public String getANNOUNCEMULTI_ID() {
		return ANNOUNCEMULTI_ID;
	}

	public void setANNOUNCEMULTI_ID(String aNNOUNCEMULTI_ID) {
		ANNOUNCEMULTI_ID = aNNOUNCEMULTI_ID;
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

	public String getMEDIA_NAME() {
		return MEDIA_NAME;
	}

	public void setMEDIA_NAME(String mEDIA_NAME) {
		MEDIA_NAME = mEDIA_NAME;
	}

	public String getCODE_ID() {
		return CODE_ID;
	}

	public void setCODE_ID(String cODE_ID) {
		CODE_ID = cODE_ID;
	}

	public String getSCAN_CODE_LINK() {
		return SCAN_CODE_LINK;
	}

	public void setSCAN_CODE_LINK(String sCAN_CODE_LINK) {
		SCAN_CODE_LINK = sCAN_CODE_LINK;
	}

	public String getSCAN_CODE_NUM() {
		return SCAN_CODE_NUM;
	}

	public void setSCAN_CODE_NUM(String sCAN_CODE_NUM) {
		SCAN_CODE_NUM = sCAN_CODE_NUM;
	}

	public String getIMG_LINK() {
		return IMG_LINK;
	}

	public void setIMG_LINK(String iMG_LINK) {
		IMG_LINK = iMG_LINK;
	}

	public String getDATE_CREATE() {
		return DATE_CREATE;
	}

	public void setDATE_CREATE(String dATE_CREATE) {
		DATE_CREATE = dATE_CREATE;
	}

	public String getDATE_MODIFY() {
		return DATE_MODIFY;
	}

	public void setDATE_MODIFY(String dATE_MODIFY) {
		DATE_MODIFY = dATE_MODIFY;
	}

	public String getIS_DELETE() {
		return IS_DELETE;
	}

	public void setIS_DELETE(String iS_DELETE) {
		IS_DELETE = iS_DELETE;
	}

}
