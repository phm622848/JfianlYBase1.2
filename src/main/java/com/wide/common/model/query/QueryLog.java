package com.wide.common.model.query;

import java.util.Date;

public class QueryLog {
	private String LogName;
	private Date starttimes;
	private Date endtimes;
	
	public String getLogName() {
		return LogName;
	}
	public void setLogName(String logName) {
		LogName = logName;
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
