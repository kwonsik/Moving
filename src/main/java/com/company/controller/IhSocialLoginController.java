package com.company.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.net.HttpURLConnection;
import java.net.InetAddress;
import java.net.URL;
import java.security.SecureRandom;
import java.time.LocalDate;
import java.time.Year;
import java.util.HashMap;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.company.dto.IhResultDto;
import com.company.dto.UserDto;
import com.company.dto.UsertypeDto;
import com.company.service.IhService;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

@Controller
public class IhSocialLoginController {
	@Autowired IhService service;
	
	//1. 네이버 인증
	@RequestMapping("/prepareLogin.ih")
	public String prepareLogin(HttpServletRequest request, HttpSession session) throws ServletException, IOException, UnsupportedEncodingException {
	    SecureRandom random = new SecureRandom();
	    String state = new BigInteger(130, random).toString(32);
	    String code = request.getParameter("code");
	    
	    request.getSession().setAttribute("state", state);
	    request.getSession().setAttribute("code", code);
	    return "redirect:/naver_redirect.ih?code="+code+"&state="+state;
	}
	
	//2. 네이버 인가
	@RequestMapping("/naver_redirect.ih")
	public String naver_redirect(HttpServletRequest request, HttpSession session, RedirectAttributes rttr) throws IOException {

	    String sessionState = (String) request.getSession().getAttribute("state");
	    String sessionCode = (String) request.getSession().getAttribute("code");
	    String state = request.getParameter("state");
	    String code = request.getParameter("code");

	    // 요청으로 받은 'state' 값과 세션에 저장된 'state' 값을 비교합니다. 일치하지 않으면 에러 페이지로 리디렉션합니다.
	    if (!state.equals(sessionState)) {
	        request.getSession().removeAttribute("state");
	        return "/error";
	    }
	    // 요청으로 받은 'code' 값과 세션에 저장된 'code' 값을 비교합니다. 일치하지 않으면 에러 페이지로 리디렉션합니다.
	    else if (!code.equals(sessionCode)) {
	        request.getSession().removeAttribute("code");
	        return "/error";
	    }

	    // RestTemplate: Spring에서 제공하는 HTTP 요청/응답을 간편하게 처리할 수 있는 템플릿입니다. 여기서는 네이버 OAuth 서버로부터 토큰을 요청하고 사용자 정보를 요청하는 데 사용됩니다.
	    RestTemplate restTemplate = new RestTemplate();
	    // 9. 네이버에서 액세스 토큰을 요청하는 URL입니다.
	    String tokenURL = "https://nid.naver.com/oauth2.0/token";
	    // HttpHeaders: HTTP 요청 또는 응답에 사용될 헤더들을 캡슐화하는 객체입니다. 여기서는 Content-Type 설정 및 Authorization 헤더에 액세스 토큰을 추가하는 데 사용됩니다.
	    HttpHeaders headers = new HttpHeaders();
	    headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);

	    // MultiValueMap: 값으로 리스트를 가질 수 있는 Map 인터페이스를 상속받은 인터페이스입니다. 여기서는 HTTP 요청에 필요한 파라미터들을 저장하는 데 사용됩니다.
	    MultiValueMap<String, String> parameters = new LinkedMultiValueMap<>();
	    parameters.add("grant_type", "authorization_code");
	    parameters.add("client_id", "HA45SpjNLNnGrNT2Hw0w");
	    parameters.add("client_secret", "VfWBMgcT3q");
	    parameters.add("code", code);
	    parameters.add("state", state);

	    // 12. restTemplate를 사용하여 토큰 요청을 보내고 응답을 HashMap으로 받습니다.
	    ResponseEntity<HashMap> tokenResponse = restTemplate.postForEntity(tokenURL, new HttpEntity<>(parameters, headers), HashMap.class);
	    // 13. 응답으로 받은 HashMap에서 "access_token"을 가져옵니다.
	    String accessToken = (String) tokenResponse.getBody().get("access_token");

	    // 14. 사용자 정보를 요청할 때 사용할 HttpHeaders 객체를 생성하고, Authorization 헤더에 액세스 토큰을 포함시킵니다.
	    HttpHeaders header = new HttpHeaders();
	    header.set("Authorization", "Bearer " + accessToken);
	    // 15. 네이버 사용자 정보 API의 URL입니다.
	    String profileUrl = "https://openapi.naver.com/v1/nid/me";

	    // ResponseEntity: HTTP 요청에 대한 응답 데이터와 상태 코드를 포함하는 객체입니다. 여기서는 네이버로부터 받은 토큰 응답과 사용자 정보 응답을 담는 데 사용됩니다.
	    ResponseEntity<String> profileResponse = restTemplate.exchange(profileUrl, HttpMethod.GET, new HttpEntity<>(header), String.class);
	    String profileBody = profileResponse.getBody();

		// ObjectMapper: JSON 문자열을 Java 객체로 변환하거나, Java 객체를 JSON으로 변환하는 데 사용되는 클래스입니다. 여기서는 네이버로부터 받은 사용자 정보(JSON)를 파싱하는 데 사용됩니다.
		ObjectMapper objectMapper = new ObjectMapper();
		// JsonNode: Jackson 라이브러리에서 JSON 데이터를 트리 형태로 다루기 위한 클래스입니다. 여기서는 ObjectMapper를 통해 변환된 JSON 데이터를 탐색하고 접근하는 데 사용됩니다.
		JsonNode rootNode = objectMapper.readTree(profileBody);
		JsonNode responseNode = rootNode.path("response");
		
		UserDto dto = new UserDto();
		dto.setUser_naver(responseNode.path("id").asText());
		
		UserDto result = service.naverJoin(dto);
		System.out.println(dto.getUser_naver());
		
		//연동한 계정이 있다면
		if(result!=null) {
		IhResultDto loginResult = service.login(result);
		
		dto = loginResult.getUser();
		UsertypeDto tdto = loginResult.getUsertype();
		
		session.setAttribute("user_id", dto.getUser_id());
		session.setAttribute("user_no", dto.getUser_no());
		session.setAttribute("user_nick", dto.getUser_nick());
		session.setAttribute("user_age", dto.getUser_age());
		session.setAttribute("user_name", dto.getUser_name());
		session.setAttribute("user_mail", dto.getUser_mail());
		session.setAttribute("user_phone", dto.getUser_phone());
		session.setAttribute("usertp_name", tdto.getUsertp_name());
		
		System.out.println("로그인성공 : 메인으로");
		return "redirect:/main.ks";
		} else {
			rttr.addFlashAttribute("noIntegrationUser", "연동된 계정이 없습니다. 마이페이지에서 계정연동을 진행해주세요");
			System.out.println("로그인실패 : 로그인페이지로");
			return "redirect:/loginPage.ih";
		}
	}

	//3. 카카오 인증
	@RequestMapping("/kakaoLogin.ih")
	public String kakaoLogin(HttpServletRequest request, HttpSession session) throws ServletException, IOException, UnsupportedEncodingException {
		SecureRandom random = new SecureRandom();
		String state = new BigInteger(130, random).toString(32);
		String code = request.getParameter("code");
		
		request.getSession().setAttribute("state", state);
		request.getSession().setAttribute("code", code);
		
		return "redirect:/kakao_redirect.ih?code="+code+"&state="+state;
	}
	
	//4. 카카오 인가
	@RequestMapping("/kakao_redirect.ih")
	protected String kakao_redirect(HttpServletRequest request, HttpServletResponse response, HttpSession session,RedirectAttributes rttr) throws ServletException, IOException {
		
		// 1. 코드받기
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String code = request.getParameter("code");
		
		// 2. 토큰받기
		String client_id = "3d769a0fec3ae6e8966e62f3a2e7456b";
		String redirect_uri = "http://localhost:8080/moving/kakaoLogin.ih";
		String  client_secret ="VwIP3zM0WuSHqvWHBSgtbt6uy0nB0iSA";
		String tokenUrl = "https://kauth.kakao.com/oauth/token?";
		tokenUrl += "grant_type=authorization_code" + "&client_id=" + client_id + "&redirect_uri=" + redirect_uri
				+ "&code=" + code
				+ "&client_secret=" + client_secret;
		
		URL url = null;
		HttpURLConnection conn = null;
		BufferedReader br = null;
		String line = "";
		StringBuffer buffer = new StringBuffer();
		String resultToken = "";
		try {
		    url = new URL(tokenUrl);
		    conn = (HttpURLConnection) url.openConnection();
		    conn.setRequestMethod("POST");
		conn.setDoInput(true);
		conn.setDoOutput(true);
		conn.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
		
		if (conn.getResponseCode() == 200) {
		   br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		} else {
		   br = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
		}
		while ((line = br.readLine()) != null) {
		   buffer.append(line);
		}
		br.close();
		conn.disconnect();
		resultToken = buffer.toString();
		} catch (Exception e) {
		   e.printStackTrace();
		}
		
		// System.out.println("step2)" + resultToken);
		// json
		JsonParser parser = new JsonParser();
		JsonObject job = (JsonObject) parser.parse(resultToken);
		String token = job.get("access_token").getAsString();
		// System.out.println("step3) token > " + token);
		
		//////////////// STEP3) 사용자 정보 받아오기
		
		String userinfoUrl = "https://kapi.kakao.com/v2/user/me";
		url = new URL(userinfoUrl);
		conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Authorization", "Bearer " + token);
		conn.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
		
		if (conn.getResponseCode() == 200) {
		   br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		} else {
		   br = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
		}
		line = "";
		buffer = new StringBuffer();
		String inforesult = "";
		while ((line = br.readLine()) != null) {
		   buffer.append(line);
		}
		br.close();
		conn.disconnect();
		inforesult = buffer.toString();
		System.out.println("STEP4) "+inforesult);
		
		parser = new JsonParser();
		JsonElement element = JsonParser.parseString(inforesult);
		JsonObject jsonObj = element.getAsJsonObject();
		
		String id = jsonObj.get("id").getAsString();
		
		System.out.println("ID: " + id);
		
		UserDto dto = new UserDto();
		
		dto.setUser_kakao(id);
		
		UserDto result = service.kakaoJoin(dto);
		
		System.out.println("result: "+result);
		
		//연동한 계정이 있다면
		if(result!=null) {
		IhResultDto loginResult = service.login(result);
		
		dto = loginResult.getUser();
		UsertypeDto tdto = loginResult.getUsertype();
		
		session.setAttribute("user_id", dto.getUser_id());
		session.setAttribute("user_no", dto.getUser_no());
		session.setAttribute("user_nick", dto.getUser_nick());
		session.setAttribute("user_age", dto.getUser_age());
		session.setAttribute("user_name", dto.getUser_name());
		session.setAttribute("user_mail", dto.getUser_mail());
		session.setAttribute("user_phone", dto.getUser_phone());
		session.setAttribute("usertp_name", tdto.getUsertp_name());
		
		System.out.println("로그인성공 : 메인으로");
		
		return "redirect:/main.ks";
		
		} else {
			rttr.addFlashAttribute("noIntegrationUser", "연동된 계정이 없습니다. 마이페이지에서 계정연동을 진행해주세요");
			System.out.println("로그인실패 : 로그인페이지로");
			
			return "redirect:/loginPage.ih";
		}
	}
	
//////////////////////////////////////  연동  /////////////////////////////////////////////////

	

}
