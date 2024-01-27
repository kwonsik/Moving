package com.company.dao;

import java.util.List;
import java.util.Map;

import com.company.dto.MovieDto;
import com.company.dto.ScheduleDto;
import com.company.dto.ScheduleResultDto;
import com.company.dto.ScreenDto;
import com.company.dto.TheaterDto;

@MyDao
public interface ScheduleDao {
	public List<TheaterDto> theaterList(); // 전체 영화관 뽑기

	public TheaterDto theaterDetail(TheaterDto dto); // 영화관 상세정보

	public List<ScheduleResultDto> scheduleList(Map<String, Object> map); // 상영시간표 출력

	public List<MovieDto> scheduleMovieList(Map<String, Object> map); // 상영영화 리스트

	public int updateScheduleState(); // 상영시간표 상태 업데이트
//	현재시간이 상영날짜, 상영시작시간과 상영끝시간안에 포함되면 2 로 바꾸고 상영끝시간이 지나면 3 으로 바뀜
//	사용자가 영화관 페이지에 진입했을때 혹은 상영시간표를 볼때 실행시켜줌

	// 관리자
	public List<ScheduleResultDto> scheduleListAdmin(Map<String, Object> map); // 상영시간표 출력

	public List<ScreenDto> screenList(ScreenDto dto); // 상영관 리스트 scr_no,scr_name,scr_st_cnt

	public List<MovieDto> movieListAll(); // 전체 영화 리스트 mv_cd, mv_ktitle, mv_runtime

	public Integer isValidDataForInsert(ScheduleDto dto); // 상영시간표 추가 전 유효한 데이터 판별
	// 0 보다 클때 유효하지 않은 데이터 / 0 일 때 유효한 데이터

	public int insertSchedule(ScheduleDto dto); // 상영시간표 추가

	public int deleteSchedule(ScheduleDto dto); // 상영시간표 삭제

	public TheaterDto getTheaterHours(TheaterDto dto); // 영화관 운영시간

	public Integer brokenSeatCnt(int scr_no); // 고장난 좌석수

}
