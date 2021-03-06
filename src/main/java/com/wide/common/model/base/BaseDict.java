package com.wide.common.model.base;

import com.wide.config.DbModel;
import com.jfinal.plugin.activerecord.IBean;

/**
 * Generated by JFinal, do not modify this file.
 */
@SuppressWarnings("serial")
public abstract class BaseDict<M extends BaseDict<M>> extends DbModel<M> implements IBean {

	public void setId(String id) {
		set("id", id);
	}

	public String getId() {
		return get("id");
	}

	public void setDictkey(String dictkey) {
		set("dictkey", dictkey);
	}

	public String getDictkey() {
		return get("dictkey");
	}

	public void setDictvalue(String dictvalue) {
		set("dictvalue", dictvalue);
	}

	public String getDictvalue() {
		return get("dictvalue");
	}

	public void setDescription(String description) {
		set("description", description);
	}

	public String getDescription() {
		return get("description");
	}

	public void setType(String type) {
		set("type", type);
	}

	public String getType() {
		return get("type");
	}

	public void setCreateBy(String createBy) {
		set("create_by", createBy);
	}

	public String getCreateBy() {
		return get("create_by");
	}

	public void setCreateDate(java.util.Date createDate) {
		set("create_date", createDate);
	}

	public java.util.Date getCreateDate() {
		return get("create_date");
	}

	public void setUpdateBy(String updateBy) {
		set("update_by", updateBy);
	}

	public String getUpdateBy() {
		return get("update_by");
	}

	public void setUpdateDate(java.util.Date updateDate) {
		set("update_date", updateDate);
	}

	public java.util.Date getUpdateDate() {
		return get("update_date");
	}

	public void setRemarks(String remarks) {
		set("remarks", remarks);
	}

	public String getRemarks() {
		return get("remarks");
	}

	public void setDelFlag(String delFlag) {
		set("del_flag", delFlag);
	}

	public String getDelFlag() {
		return get("del_flag");
	}

	public void setTypeinfo(String typeinfo) {
		set("typeinfo", typeinfo);
	}

	public String getTypeinfo() {
		return get("typeinfo");
	}

}
