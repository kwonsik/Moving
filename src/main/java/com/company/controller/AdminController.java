package com.company.controller;


import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.company.dto.Reservation_ViewDto;
import com.company.service.ReservationService;

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
	



