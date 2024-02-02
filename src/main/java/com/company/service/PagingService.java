package com.company.service;

import java.util.List;
import java.util.Map;

import com.company.util.PagingDto;

public interface PagingService {
	public String searchType="";
	public String searchKey="";
    public <T> List<T> listCnt(Map<String, T> param);
    public PagingDto paging(int pstartno, String type);
    public Map<String, Object> getPagedData(int pstartno, String type);
}