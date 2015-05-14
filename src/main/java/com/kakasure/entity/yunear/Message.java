package com.kakasure.entity.yunear;

import java.io.Serializable;
import java.util.Date;

public class Message implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -3831788522132914516L;
	private String MESSAGE_ID;
	private String MEDIA_ID;
	private String TYPE;
	private String CONTENT;
	private Date DATE_CREATE;
	private Date DATE_MODIFY;
	private String IS_DELETE;
	public String getMESSAGE_ID() {
		return MESSAGE_ID;
	}
	public void setMESSAGE_ID(String mESSAGE_ID) {
		MESSAGE_ID = mESSAGE_ID;
	}
	public String getMEDIA_ID() {
		return MEDIA_ID;
	}
	public void setMEDIA_ID(String mEDIA_ID) {
		MEDIA_ID = mEDIA_ID;
	}
	public String getTYPE() {
		return TYPE;
	}
	public void setTYPE(String tYPE) {
		TYPE = tYPE;
	}
	public String getCONTENT() {
		return CONTENT;
	}
	public void setCONTENT(String cONTENT) {
		CONTENT = cONTENT;
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
	public String getIS_DELETE() {
		return IS_DELETE;
	}
	public void setIS_DELETE(String iS_DELETE) {
		IS_DELETE = iS_DELETE;
	}
	
}
