package com.wide.common.model.base;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.IBean;

/**
 * Generated by JFinal, do not modify this file.
 */
@SuppressWarnings("serial")
public abstract class BaseRoleRight<M extends BaseRoleRight<M>> extends Model<M> implements IBean {

	public void setRoleId(String roleId) {
		set("role_id", roleId);
	}

	public String getRoleId() {
		return get("role_id");
	}

	public void setRightId(String rightId) {
		set("right_id", rightId);
	}

	public String getRightId() {
		return get("right_id");
	}

}