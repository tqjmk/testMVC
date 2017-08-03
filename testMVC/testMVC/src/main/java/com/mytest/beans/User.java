package com.mytest.beans;


public class User {
	private Long id;
	private String username;
	private String password;
	private Long provinceId;
	private Long cityId;
	private Long streetId;
	private String birthday;

	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}

	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public Long getProvinceId() {
		return provinceId;
	}
	public void setProvinceId(Long provinceId) {
		this.provinceId = provinceId;
	}
	public Long getCityId() {
		return cityId;
	}
	public void setCityId(Long cityId) {
		this.cityId = cityId;
	}
	public Long getStreetId() {
		return streetId;
	}
	public void setStreetId(Long streetId) {
		this.streetId = streetId;
	}
	@Override
	public String toString() {
		return "User [id=" + id + ", username=" + username + ", password=" + password + ", provinceId=" + provinceId
				+ ", cityId=" + cityId + ", streetId=" + streetId + ", birthday=" + birthday + "]";
	}

	
	
	
	
}
