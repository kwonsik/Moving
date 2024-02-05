package com.company.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.dao.BoardDao;
import com.company.dao.MovieDao;
import com.company.util.PagingDto;

@Service
public class PagingServiceImpl implements PagingService {
    @Autowired private MovieDao movieDao;
    @Autowired private BoardDao boardDao;

    // 10개씩 리스트
    @SuppressWarnings("unchecked")
	@Override public <T> List<T> listCnt(Map<String, T> param) {
    	String type = String.valueOf(param.get("type"));
    	
        if (param.get("type").equals("board")) {
            return (List<T>) boardDao.b_listCnt(param);
        } else if (param.get("type").equals("live")) {
            return (List<T>) movieDao.mv_cntLive(param);
        } else if (param.get("type").equals("unLive")) {
        	return (List<T>) movieDao.mv_cntUnlive(param);
        }
        return null;
    }

    // 페이징
    @Override public PagingDto paging(int pstartno, String type) {
        if (type.equals("board")) {
            return new PagingDto(boardDao.b_total(), pstartno);
        } else if (type.equals("live")) {
            return new PagingDto(movieDao.mv_totalLive(), pstartno);
        } else if (type.equals("unLive")) {
        	return new PagingDto(movieDao.mv_totalUnlive(), pstartno);
        }
        return null;
    }
    
    @Override public Map<String, Object> getPagedData(int pstartno, String type) {
        Map<String, Object> result = new HashMap<>();
		
        result.put("list", listCnt(Map.of("pstartno", pstartno, "onepagelimit", 10, "type", type)));
        result.put("paging", paging(pstartno, type));
        return result;
    }
}