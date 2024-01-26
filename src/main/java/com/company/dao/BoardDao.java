package com.company.dao;

import java.util.List;
import java.util.Map;

import com.company.dto.BoardDto;

@MyDao
public interface BoardDao {
	public int b_insert(BoardDto dto);
	public int b_update(BoardDto dto);
	public int b_update_hit(int board_no);
	public int b_delete(BoardDto dto);
	
	public BoardDto b_read(int board_no);
	public List<BoardDto> b_readAll();
	
	public int b_total(); // 상영중 영화 전체 갯수
	public <T> List<BoardDto> b_listCnt(Map<String, T> param);
}
