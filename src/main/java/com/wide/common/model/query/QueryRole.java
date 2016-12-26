package com.wide.common.model.query;

import java.util.Date;

public class QueryRole {

	private String rolename;
	private String roletype;
	private Date starttimes;
	private Date endtimes;
	
	
	public String getRolename() {
		return rolename;
	}
	public void setRolename(String rolename) {
		this.rolename = rolename;
	}
	public String getRoletype() {
		return roletype;
	}
	public void setRoletype(String roletype) {
		this.roletype = roletype;
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
