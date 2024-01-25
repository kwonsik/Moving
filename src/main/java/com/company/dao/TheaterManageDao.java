package com.company.dao;

import java.util.List;

import com.company.dto.ScreenDto;
import com.company.dto.TheaterDto;

@MyDao
public interface TheaterManageDao {
	//�쁺�솕愿� 紐⑸줉  
	public List<TheaterDto> theaterReadAll();
	
	public List<ScreenDto> screenReadAll();
	
	//�쁺�솕愿� 異붽�
	public int ttInsert(TheaterDto dto);
	
	public TheaterDto readTT(TheaterDto dto);
	
	public int scrInsert(ScreenDto dto);
	
	public Integer insertNowTheater();
	

}
