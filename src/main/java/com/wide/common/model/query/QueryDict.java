package com.wide.common.model.query;

import java.util.Date;

public class QueryDict {

	private String dictname;
	private String dicttype;
	private Date starttimes;
	private Date endtimes;
	
	
	
	public String getDictname() {
		return dictname;
	}
	public void setDictname(String dictname) {
		this.dictname = dictname;
	}
	public String getDicttype() {
		return dicttype;
	}
	public void setDicttype(String dicttype) {
		this.dicttype = dicttype;
	}
	public Date getStarttimes() {
		return starttimes;
	}
	public void setStarttimes(Date starttimes) {
		this.starttimes = starttimes;
	}
	public Date getEndtimes() {
		return endtimes;
	}
	public void setEndtimes(Date endtimes) {
		this.endtimes = endtimes;
	}
	
	
}
