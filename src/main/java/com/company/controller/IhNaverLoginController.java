package com.company.controller;

import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.net.URLEncoder;
import java.security.SecureRandom;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.client.RestTemplate;

@Controller
public class IhNaverLoginController {
	
	//로그인페이지
	@RequestMapping("/prepareLogin.ih")
	public String prepareLogin(HttpServletRequest request) throws UnsupportedEncodingException {
	    String clientId = "HA45SpjNLNnGrNT2Hw0w";
	    String redirectURI = URLEncoder.encode("http://localhost:8080/moving/loginPage.ih", "UTF-8");
	    SecureRandom random = new SecureRandom();
	    String state = new BigInteger(130, random).toString(32);
	    String code = request.getParameter("code");
	    String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code"
	         + "&client_id=" + clientId
	         + "&redirect_uri=" + redirectURI
	         + "&state=" + state;
	    
	    request.getSession().setAttribute("state", state);
	    return "redirect:/naver_redirect.ih?code="+code+"&state="+state;
	}
	
	@RequestMapping("/naver_redirect.ih")
	public String naver_redirect(HttpServletRequest request) {
	    // CSRF 공격 방지를 위해 state 값 비교
	    String sessionState = (String) request.getSession().getAttribute("state");
	    String state = request.getParameter("state");

	    if (!state.equals(sessionState)) {
	        request.getSession().removeAttribute("state");
	        return "/error"; // 에러 페이지로 리디렉션
	    }

	    // Access token 요청
	    RestTemplate restTemplate = new RestTemplate();
	    String tokenURL = "https://nid.naver.com/oauth2.0/token";
	    HttpHeaders headers = new HttpHeaders();
	    headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);

	    MultiValueMap<String, String> parameters = new LinkedMultiValueMap<>();
	    parameters.add("grant_type", "authorization_code");
	    parameters.add("client_id", "HA45SpjNLNnGrNT2Hw0w");
	    parameters.add("client_secret", "VfWBMgcT3q");
	    parameters.add("code", request.getParameter("code"));
	    parameters.add("state", state);

	    ResponseEntity<HashMap> tokenResponse = restTemplate.postForEntity(tokenURL, new HttpEntity<>(parameters, headers), HashMap.class);
	    String accessToken = (String) tokenResponse.getBody().get("access_token");

	    // 사용자 정보 요청
	    HttpHeaders header = new HttpHeaders();
	    header.set("Authorization", "Bearer " + accessToken);
	    String profileUrl = "https://openapi.naver.com/v1/nid/me";

	    ResponseEntity<String> profileResponse = restTemplate.exchange(profileUrl, HttpMethod.GET, new HttpEntity<>(header), String.class);
	    String profileBody = profileResponse.getBody();

	    // 추후 사용자 정보 처리 로직 구현 필요
	    System.out.println(profileBody);
	    
		// 세션에 저장된 state 값 삭제
	    request.getSession().removeAttribute("state");

	    return "redirect:/loginPage.ih"; // 로그인 페이지로 리디렉션
	}
}
