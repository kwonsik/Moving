package com.company.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.dao.TheaterManageDao;
import com.company.dto.ScreenDto;
import com.company.dto.TheaterDto;

@Service
public class AddTheaterServiceImpl implements AddTheaterService{
	@Autowired TheaterManageDao dao;

	@Override
	public int ttInsert(TheaterDto dto) {
		
		return 0;
	}

	@Override
	public TheaterDto readTT(TheaterDto dto) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int scrInsert(ScreenDto dto) {
		// TODO Auto-generated method stub
		return 0;
	}
///////////////////////////////////////////////////////////////////////////////////////////////
	
	@Override
	public int insertTheaterAndScreen(TheaterDto dto) {
		char startRow = 'A';
		int startColumn = 1;
		dto.setTt_scrcnt(dto.getScreenList().size());
		dao.ttInsert(dto);
		
		for(ScreenDto scr : dto.getScreenList()) {
			scr.setTt_no(dao.insertNowTheater());

			char endRow = scr.getScr_st_row();
			int endColumn = scr.getScr_st_col();
			int rowCount = endRow - startRow + 1;
			int columnCount = endColumn - startColumn + 1;
			System.out.println(rowCount * columnCount);
			
			scr.setScr_st_cnt(rowCount * columnCount);
			dao.scrInsert(scr);
		}
		
		return 0;
	}
	
	
	
}
