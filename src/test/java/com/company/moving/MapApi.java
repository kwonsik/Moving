package com.company.moving;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;


import com.company.service.TheaterMapService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/spring/**/root-context.xml")
public class MapApi {
	
	@Autowired
	TheaterMapService mapApi;
	
	@Test
	public void map(String query) {
		query="서울특별시 강남구";
		System.out.println(mapApi.getMap(query));
	}

}
