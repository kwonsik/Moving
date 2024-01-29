package com.company.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.dao.ScheduleDao;
import com.company.dto.MovieDto;
import com.company.dto.ScheduleDto;
import com.company.dto.ScheduleResultDto;
import com.company.dto.ScreenDto;
import com.company.dto.TheaterDto;
import com.google.gson.Gson;

@Service("schService")
public class SchServiceImpl implements SchService {

	@Autowired
	ScheduleDao dao;

	@Override
	public List<TheaterDto> theaterList() {
		return dao.theaterList();
	}

	@Override
	public String theaterDetail(TheaterDto dto) {
		String json = "";
		Gson gson = new Gson();
		json = gson.toJson(dao.theaterDetail(dto));
		System.out.println(json);
		return json;
	}

	@Override
	public String scheduleList(Map<String, Object> map) {
		// 
		int result = dao.updateScheduleState();
		System.out.println(result);

		List<ScheduleResultDto> list = dao.scheduleList(map);
		System.out.println(list);
		List<MovieDto> movieNameList = dao.scheduleMovieList(map);

		// 
		List<Map<String, Object>> convertedData = new ArrayList<>();
		for (MovieDto movie : movieNameList) {
			Map<String, Object> movieMap = new HashMap<>();
			movieMap.put("title", movie.getMv_ktitle());
			movieMap.put("mv_cert", movie.getMv_cert());

			List<Map<String, Object>> schedules = new ArrayList<>();
			for (ScheduleResultDto scheduleResultDto : list) {
				if (movie.getMv_ktitle().equals(scheduleResultDto.getMv_ktitle())) {
					Map<String, Object> schedule = new HashMap<>();
					schedule.put("section", scheduleResultDto.getScr_name());

					//
					SimpleDateFormat inputFormat = new SimpleDateFormat("HH:mm:ss");
					SimpleDateFormat outputFormat = new SimpleDateFormat("HH:mm");

					try {
						Date startTime = inputFormat.parse(scheduleResultDto.getSch_start());
						Date endTime = inputFormat.parse(scheduleResultDto.getSch_end());

						schedule.put("time", outputFormat.format(startTime));
						schedule.put("endTime", outputFormat.format(endTime));
					} catch (ParseException e) {
						e.printStackTrace();
					}

					schedule.put("totalSeats", scheduleResultDto.getScr_st_cnt());
					schedule.put("availableSeats", scheduleResultDto.getSch_cnt());
					schedule.put("scheduleNo", scheduleResultDto.getSch_no());
					schedules.add(schedule);
				}
			}

			movieMap.put("schedules", schedules);
			convertedData.add(movieMap);
		}
		Gson gson = new Gson();
		String json = gson.toJson(convertedData);
		return json;
	}

	// 
	@Override
	public List<ScheduleResultDto> scheduleListAdmin(Map<String, Object> map) {
		int result = dao.updateScheduleState();
		return dao.scheduleListAdmin(map);
	}

	@Override
	public int insertScheduleAction(ScheduleDto dto) {
		int result = -1;
		
		System.out.println("유효데이터 확인 : " +dao.isValidDataForInsert(dto));
		
		if (dao.isValidDataForInsert(dto) == 0) {
			dto.setSch_cnt(dto.getSch_cnt() - dao.brokenSeatCnt(dto.getScr_no())); // 

			result = dao.insertSchedule(dto);
		}
		System.out.println("인서트 결과 : "+result);

		return result;
	}

	@Override
	public int deleteSchedule(ScheduleDto dto) {
		return dao.deleteSchedule(dto);
	}

	@Override
	public List<MovieDto> getMovieList() {
		return dao.movieListAll();
	}

	@Override
	public List<ScreenDto> getScreenList(ScreenDto dto) {
		return dao.screenList(dto);
	}

	@Override
	public TheaterDto getTheaterHours(TheaterDto dto) {
		return dao.getTheaterHours(dto);
	}

}
