package com.company.moving;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.company.dao.ScheduleDao;
import com.company.dao.TestDao;
import com.company.dao.TheaterManageDao;
import com.company.dto.MovieDto;
import com.company.dto.ScreenDto;
import com.company.dto.TheaterDto;
import com.company.service.SchService;
import com.google.gson.Gson;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/spring/**/root-context.xml")
@Log4j
public class Test0 {
	@Autowired
	ApplicationContext context;
	@Autowired
	TestDao dao;

	@Autowired
	ScheduleDao sDao;

	@Autowired
	SchService service;

	@Autowired
	TheaterManageDao tDao;

	@Test
	@Ignore
	public void test1() {
		System.out.println(dao.readTime());
	}

	@Test
	@Ignore
	public void testDao() {
//		System.out.println(sDao.theaterList());
		TheaterDto dto = new TheaterDto();
		dto.setTt_no(1);

		String json = "";
		Gson gson = new Gson();
		json = gson.toJson(service.theaterDetail(dto));
		System.out.println(json);

//		Map<String, Object> map = new HashMap<>();
//		map.put("theaterNO", 1);
//		map.put("date", "2024-01-15");
//		System.out.println(sDao.scheduleList(map));
	}

	@Test
	@Ignore
	public void testService() {
		ScreenDto scrDto = new ScreenDto();

		scrDto.setTt_no(1);

		List<ScreenDto> scrList = sDao.screenList(scrDto);
		System.out.println(scrList);

		List<MovieDto> mList = sDao.movieListAll();
		System.out.println(mList);

		scrDto.setScr_no(1);

		System.out.println(sDao.updateScheduleState());

//		ScheduleDto schDto = new ScheduleDto();
//		schDto.setScr_no(scrList.get(0).getScr_no());
//		schDto.setMv_cd(mList.get(0).getMv_cd());
//		schDto.setSch_cnt(scrList.get(0).getScr_st_cnt());
//		schDto.setSch_date("2024-01-17");
//		schDto.setSch_start("14:30");
//		schDto.setSch_end("16:30");
//		schDto.setSch_period(2);
//		schDto.setSch_cnt(scrList.get(0).getScr_st_cnt());
//		
//		System.out.println(sDao.insertSchedule(schDto));

	}

	@Test
	@Ignore
	public void testScheduleList() {
		Map<String, Object> map = new HashMap<>();
		int no = 1;
		String date = "2024-01-18";
		map.put("theaterNO", no);
		map.put("date", date);

		System.out.println(service.scheduleList(map));
	}

	@Test
//	@Ignore
	public void testAdminMapper() {
//        ScheduleDto dto = new ScheduleDto();
//        dto.setScr_no(8);
//        dto.setSch_date("2024-01-18");
//        dto.setSch_start("09:00");
//        dto.setSch_end("19:00");
//
//        int result = sDao.isValidDataForInsert(dto);
//        
//        System.out.println(result);

		Map<String, Object> map = new HashMap<>();
		int no = 1;
		String date = "2024-01-19";
		map.put("theaterNo", no);
		map.put("date", date);

		System.out.println(sDao.scheduleListAdmin(map));
	}

	@Test
	@Ignore
	public void testAdminService() {
		ScreenDto dto = new ScreenDto();
		dto.setTt_no(2);
		System.out.println(sDao.screenList(dto));
//		System.out.println(sDao.movieListAll());
		System.out.println(sDao.brokenSeatCnt(1));

//		System.out.println(service.insertScheduleView(dto));
	}

	@Test

	public void insertTheater() {
//		System.out.println(tDao.insertNowTheater());

		char startRow = 'A';
		int startColumn = 1;
		char endRow = 'D';
		int endColumn = 4;
		int rowCount = endRow - startRow + 1;
		int columnCount = endColumn - startColumn + 1;
		System.out.println(rowCount * columnCount);

	}
}
