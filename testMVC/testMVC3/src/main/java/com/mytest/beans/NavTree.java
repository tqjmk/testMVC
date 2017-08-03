package com.mytest.beans;

public class NavTree {
	private Long id;
	private String text;
	private String state;
	private String iconCls;
	private String url;
	private Long nid;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getIconCls() {
		return iconCls;
	}
	public void setIconCls(String iconCls) {
		this.iconCls = iconCls;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public Long getNid() {
		return nid;
	}
	public void setNid(Long nid) {
		this.nid = nid;
	}
	@Override
	public String toString() {
		return "NavTree [id=" + id + ", text=" + text + ", state=" + state + ", iconCls=" + iconCls + ", url=" + url
				+ ", nid=" + nid + "]";
	}
	
	
}
