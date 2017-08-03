package com.mytest.beans;

public class Search {
	private String name;
	private String province;
	private String minBirthday;
	private String maxBirthday;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getProvince() {
		return province;
	}
	public void setProvince(String province) {
		this.province = province;
	}
	public String getMinBirthday() {
		return minBirthday;
	}
	public void setMinBirthday(String minBirthday) {
		this.minBirthday = minBirthday;
	}
	public String getMaxBirthday() {
		return maxBirthday;
	}
	public void setMaxBirthday(String maxBirthday) {
		this.maxBirthday = maxBirthday;
	}
	@Override
	public String toString() {
		return "Search [name=" + name + ", province=" + province + ", minBirthday=" + minBirthday + ", maxBirthday="
				+ maxBirthday + "]";
	}
	
	
}
