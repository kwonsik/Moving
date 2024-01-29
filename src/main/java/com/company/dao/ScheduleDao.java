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
	public List<TheaterDto> theaterList(); // ��ü ��ȭ�� �̱�

	public TheaterDto theaterDetail(TheaterDto dto); // ��ȭ�� ������

	public List<ScheduleResultDto> scheduleList(Map<String, Object> map); // �󿵽ð�ǥ ���

	public List<MovieDto> scheduleMovieList(Map<String, Object> map); // �󿵿�ȭ ����Ʈ

	public int updateScheduleState(); // �󿵽ð�ǥ ���� ������Ʈ
//	����ð��� �󿵳�¥, �󿵽��۽ð��� �󿵳��ð��ȿ� ���ԵǸ� 2 �� �ٲٰ� �󿵳��ð��� ������ 3 ���� �ٲ�
//	����ڰ� ��ȭ�� �������� ���������� Ȥ�� �󿵽ð�ǥ�� ���� ���������

	// ������
	public List<ScheduleResultDto> scheduleListAdmin(Map<String, Object> map); // �󿵽ð�ǥ ���

	public List<ScreenDto> screenList(ScreenDto dto); // �󿵰� ����Ʈ scr_no,scr_name,scr_st_cnt

	public List<MovieDto> movieListAll(); // ��ü ��ȭ ����Ʈ mv_cd, mv_ktitle, mv_runtime

	public Integer isValidDataForInsert(ScheduleDto dto); // �󿵽ð�ǥ �߰� �� ��ȿ�� ������ �Ǻ�
	// 0 ���� Ŭ�� ��ȿ���� ���� ������ / 0 �� �� ��ȿ�� ������

	public int insertSchedule(ScheduleDto dto); // �󿵽ð�ǥ �߰�

	public int deleteSchedule(ScheduleDto dto); // �󿵽ð�ǥ ����

	public TheaterDto getTheaterHours(TheaterDto dto); // ��ȭ�� ��ð�

	public Integer brokenSeatCnt(int scr_no); // ���峭 �¼���

}
