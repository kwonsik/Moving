package com.company.service;

import java.util.List;
import java.util.Map;

import com.company.dto.MovieDto;
import com.company.dto.ScheduleDto;
import com.company.dto.ScheduleResultDto;
import com.company.dto.ScreenDto;
import com.company.dto.TheaterDto;

public interface SchService {
	public List<TheaterDto> theaterList(); // 전체 영화관 뽑기

	public String theaterDetail(TheaterDto dto); // 영화관 상세정보

	public String scheduleList(Map<String, Object> map); // 상영시간표 리스트 - json 타입으로 데이터 재가공

	// 관리자
	public List<ScheduleResultDto> scheduleListAdmin(Map<String, Object> map);

//	public Map<String, List<? extends Object>> insertScheduleView(ScreenDto dto); // 상영시간표 추가 모달 뷰
	
	public List<MovieDto> getMovieList(); // 전체 영화 리스트
	
	public List<ScreenDto> getScreenList(ScreenDto dto); // 상영관 리스트

	public int insertScheduleAction(ScheduleDto dto); // 상영시간표 추가하기

	public int deleteSchedule(ScheduleDto dto); // 상영시간표 삭제
	
	public TheaterDto getTheaterHours(TheaterDto dto); // 영화관 운영 시간

}
