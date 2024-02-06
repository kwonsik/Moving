package com.company.service;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

@Service
public class TheaterMapServiceImpl implements TheaterMapService {
	private String rest_api_key = "c58c19ade079896c9555aee9161dc4b1";
	private String kakao_map_url ="https://dapi.kakao.com/v2/local/search/address.json";

	@Override
	public String getMap(String query) {
		 String apiUrl = kakao_map_url + "?query=" + query;

	     HttpHeaders httpHeader = new HttpHeaders();
	     httpHeader.set("Authorization", "KakaoAK "+rest_api_key); 
	

	     HttpEntity<String> entity = new HttpEntity<String>("parameter", httpHeader);
	     
	     RestTemplate restTemplate = new RestTemplate();
	     
	     ResponseEntity<String> response = restTemplate.exchange(apiUrl, HttpMethod.GET, entity, String.class);

	     return response.getBody();

	}

}
