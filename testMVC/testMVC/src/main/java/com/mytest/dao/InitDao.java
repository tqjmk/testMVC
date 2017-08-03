package com.mytest.dao;

import java.util.List;

import com.mytest.beans.City;
import com.mytest.beans.Province;
import com.mytest.beans.Street;

public interface InitDao {

	List<Province> selectProvince();

	List<City> selectCityByProvincedId(Long provinceId);

	List<Street> selectStreetByCityId(Long cityId);

}
