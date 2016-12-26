package com.wide.constant;

public enum EnumDictType {
	dict_office(1000, "机构"),
	dict_role(1001, "角色"),
	dict_right(1002, "权限"),
	dict_persontype(1003, "人员类型"),
	dict_political(1004, "政治面貌"),
	dict_nation(1005, "民族"),
	dict_institution (1006,"单位性质"),
	dict_education(1007, "学历"),
	dict_degree(1008, "学位"),
	dict_title(1009, "职称"),
	dict_areatype(1010,"区域类型"),
	dict_logoptype(1011,"日志操作类型"),
	dict_logfntype(1012,"日志功能类型"),
	dict_classification(1013,"微信信息分类"),
	dict_topstate(1014,"置顶状态"),
	dict_releasestate(1015,"发布状态");
	 
	
	private int enumKey;
	private String enumText;

	private EnumDictType(int key, String text) {
		this.enumKey = key;
		this.enumText = text;
	}

	public int getEnumKey() {
		return enumKey;
	}

	public String getEnumText() {
		return enumText;
	}
	
	public static final String getFromKey(int key) {
		for (EnumDictType e : EnumDictType.values()) {
			if (e.getEnumKey()==key) {
				return e.getEnumText();
			}
		}
		return null;
	}
}
