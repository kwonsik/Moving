package com.company.moving;



import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;


import com.company.dao.ReservationDao;
import com.company.dao.TestDao;
import com.company.service.ReservationService;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="file:src/main/webapp/WEB-INF/spring/**/root-context.xml")
public class Test0 {
	@Autowired ApplicationContext context;
	@Autowired ReservationDao dao;
	@Autowired ReservationService service;

	
	@Test public void test0(){
		
	
	}
	
}
