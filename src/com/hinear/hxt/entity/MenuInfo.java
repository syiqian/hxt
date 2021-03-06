package com.hinear.hxt.entity;

import java.io.Serializable;
import java.util.List;

import com.google.gson.annotations.SerializedName;

public class MenuInfo implements Serializable, Comparable<MenuInfo> {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/*
	 * "NEWIDMENU_ID":0, "MENU_ID":1, "PARENTID":66, "MENU_INDEX":1,
	 * "MODULE_CODE":"SCHOOL_INFO", "MENU_ICONURL":null, "MENU_NAME":"学校简介",
	 * "MENU_URL":"/background/schoolinfo/schoolinfoindex.jsp", "REMARK":
	 * "/background/schoolinfo/schoolinfoindex.jsp---/schoolinfo/schoolinfo_toUpdatePage.action"
	 */
	@SerializedName("NEWIDMENU_ID")
	private int newIdMenuId;
	@SerializedName("MENU_ID")
	private int menuId;
	@SerializedName("PARENTID")
	private int parentId;
	@SerializedName("MENU_INDEX")
	private int menuIndex;
	@SerializedName("MODULE_CODE")
	private String moduleCode;
	@SerializedName("MENU_ICONURL")
	private String menuIconUrl;
	@SerializedName("MENU_NAME")
	private String menuName;
	@SerializedName("MENU_URL")
	private String menuUrl;
	@SerializedName("REMARK")
	private String remark;
	private List<MenuInfo> nodes;
	
	private String text; //节点名称
	private String href; // 节点链接
	private String tags; //额外参数
	

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getHref() {
		return href;
	}

	public void setHref(String href) {
		this.href = href;
	}

	public String getTags() {
		return tags;
	}

	public void setTags(String tags) {
		this.tags = tags;
	}

	public int getNewIdMenuId() {
		return newIdMenuId;
	}

	public void setNewIdMenuId(int newIdMenuId) {
		this.newIdMenuId = newIdMenuId;
	}

	public int getMenuId() {
		return menuId;
	}

	public void setMenuId(int menuId) {
		this.menuId = menuId;
	}

	public int getParentId() {
		return parentId;
	}

	public void setParentId(int parentId) {
		this.parentId = parentId;
	}

	public int getMenuIndex() {
		return menuIndex;
	}

	public void setMenuIndex(int menuIndex) {
		this.menuIndex = menuIndex;
	}

	public String getModuleCode() {
		return moduleCode;
	}

	public void setModuleCode(String moduleCode) {
		this.moduleCode = moduleCode;
	}

	public String getMenuIconUrl() {
		return menuIconUrl;
	}

	public void setMenuIconUrl(String menuIconUrl) {
		this.menuIconUrl = menuIconUrl;
	}

	public String getMenuName() {
		return menuName;
	}

	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}

	public String getMenuUrl() {
		return menuUrl;
	}

	public void setMenuUrl(String menuUrl) {
		this.menuUrl = menuUrl;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public List<MenuInfo> getMenuNodes() {
		return nodes;
	}

	public void setMenuNodes(List<MenuInfo> menuNodes) {
		this.nodes = menuNodes;
	}

	@Override
	public int compareTo(MenuInfo o) {
		if (this.menuIndex > o.menuIndex) {
			return 1;
		} else if (this.menuIndex < o.menuIndex) {
			return -1;
		}
		return 0;
	}

}
