package com.wide.common.model.base;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.IBean;

/**
 * Generated by JFinal, do not modify this file.
 */
@SuppressWarnings("serial")
public abstract class BaseOffice<M extends BaseOffice<M>> extends Model<M> implements IBean {

	public void setId(String id) {
		set("id", id);
	}

	public String getId() {
		return get("id");
	}

	public void setParentId(String parentId) {
		set("parent_id", parentId);
	}

	public String getParentId() {
		return get("parent_id");
	}

	public void setParentIds(String parentIds) {
		set("parent_ids", parentIds);
	}

	public String getParentIds() {
		return get("parent_ids");
	}

	public void setName(String name) {
		set("name", name);
	}

	public String getName() {
		return get("name");
	}

	public void setSort(Double sort) {
		set("sort", sort);
	}

	public Double getSort() {
		return get("sort");
	}

	public void setAreaId(String areaId) {
		set("area_id", areaId);
	}

	public String getAreaId() {
		return get("area_id");
	}

	public void setCode(String code) {
		set("code", code);
	}

	public String getCode() {
		return get("code");
	}

	public void setType(String type) {
		set("type", type);
	}

	public String getType() {
		return get("type");
	}

	public void setGrade(String grade) {
		set("grade", grade);
	}

	public String getGrade() {
		return get("grade");
	}

	public void setAddress(String address) {
		set("address", address);
	}

	public String getAddress() {
		return get("address");
	}

	public void setZipCode(String zipCode) {
		set("zip_code", zipCode);
	}

	public String getZipCode() {
		return get("zip_code");
	}

	public void setMaster(String master) {
		set("master", master);
	}

	public String getMaster() {
		return get("master");
	}

	public void setPhone(String phone) {
		set("phone", phone);
	}

	public String getPhone() {
		return get("phone");
	}

	public void setFax(String fax) {
		set("fax", fax);
	}

	public String getFax() {
		return get("fax");
	}

	public void setEmail(String email) {
		set("email", email);
	}

	public String getEmail() {
		return get("email");
	}

	public void setUSEABLE(String USEABLE) {
		set("USEABLE", USEABLE);
	}

	public String getUSEABLE() {
		return get("USEABLE");
	}

	public void setPrimaryPerson(String primaryPerson) {
		set("PRIMARY_PERSON", primaryPerson);
	}

	public String getPrimaryPerson() {
		return get("PRIMARY_PERSON");
	}

	public void setDeputyPerson(String deputyPerson) {
		set("DEPUTY_PERSON", deputyPerson);
	}

	public String getDeputyPerson() {
		return get("DEPUTY_PERSON");
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

}
