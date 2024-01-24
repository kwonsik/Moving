package com.company.controller;


import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.InvalidObjectException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;

import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import com.company.dto.*;
import com.company.service.ReservationService;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

@Controller

public class AdminController {
	
	
	@Autowired ReservationService service;
	
	@GetMapping("/main.admin")
	public String main() {
		return "main";
	}
	@GetMapping("/reservation_management.admin")
	public String reservation_management(Model model,HttpServletRequest request,Reservation_ViewDto dto) {
		
		dto.setPstartno(0);
		
		if(request.getParameter("pstartno")!=null) {
			System.out.println("pstartno : "+request.getParameter("pstartno"));
			dto.setPstartno(Integer.parseInt(request.getParameter("pstartno"))) ;
		}		
		service.paging(dto, model);		
		return "reservation_management";
	}
	@PostMapping("/admin_reservationCancle.admin")
	public void admin_reservationCancle(HttpServletRequest request,HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		int result=service.admin_reservationCancle(request, response);
		PrintWriter out=response.getWriter();
		if(result>0) {out.print("<script>alert('예매를 취소했습니다.');location.href='reservation_management.admin'</script>");}
		else {out.print("<script>alert('오류가 발생했습니다.');location.href='reservation_management.admin'</script>");}	
		
	}

	
	
}
	



