package com.company.service;

import java.util.List;
import java.util.Map;

import com.company.dto.MovieDto;
import com.company.dto.ScheduleDto;
import com.company.dto.ScheduleResultDto;
import com.company.dto.ScreenDto;
import com.company.dto.TheaterDto;

public interface SchService {
	public List<TheaterDto> theaterList(); // ��ü ��ȭ�� �̱�

	public String theaterDetail(TheaterDto dto); // ��ȭ�� ������

	public String scheduleList(Map<String, Object> map); // �󿵽ð�ǥ ����Ʈ - json Ÿ������ ������ �簡��

	// ������
	public List<ScheduleResultDto> scheduleListAdmin(Map<String, Object> map);

//	public Map<String, List<? extends Object>> insertScheduleView(ScreenDto dto); // �󿵽ð�ǥ �߰� ��� ��
	
	public List<MovieDto> getMovieList(); // ��ü ��ȭ ����Ʈ
	
	public List<ScreenDto> getScreenList(ScreenDto dto); // �󿵰� ����Ʈ

	public int insertScheduleAction(ScheduleDto dto); // �󿵽ð�ǥ �߰��ϱ�

	public int deleteSchedule(ScheduleDto dto); // �󿵽ð�ǥ ����
	
	public TheaterDto getTheaterHours(TheaterDto dto); // ��ȭ�� � �ð�

}
