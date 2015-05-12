
package com.kakasure.entity.yunear;

import java.util.Date;

public class TbAnnounceMulti {
	private String	TBANNOUNCEMULTI_ID;

	private String	NAME;//多媒体名称

	private String	USER_ID;//发布方ID

	private String	MEDIA_ID;//多媒体ID

	private String	CODE_ID;//二维码ID

	private String	STATUS;//状态

	private Date	CREATE_TIME;//创建日期

	private Date	UPD_TIME;//修改日期

	public String getTBANNOUNCEMULTI_ID() {
		return TBANNOUNCEMULTI_ID;
	}

	public void setTBANNOUNCEMULTI_ID(String tBANNOUNCEMULTI_ID) {
		TBANNOUNCEMULTI_ID = tBANNOUNCEMULTI_ID;
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