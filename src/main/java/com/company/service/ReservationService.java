package com.company.service;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;

import com.company.dto.*;
import com.company.service.ReservationServiceImpl.PagingUtil;


public interface ReservationService {
	public List<TheaterDto> getAllTheaterList();
	public List<TheaterDto> getTheaterList(Reservation_ViewDto dto);
	public List<MovieDto> getAllMovieList();
	public List<MovieDto> getMovieList(Reservation_ViewDto dto);
	public List<ScheduleDto> getDateList(Reservation_ViewDto dto);
	public List<Reservation_ViewDto> getScheduleList(Reservation_ViewDto dto);
	public Reservation_ViewDto allClick(Reservation_ViewDto dto);
	public ScreenDto getSeatList(ScheduleDto dto);
	public List<BrokenSeatDto> getBrokenSeatList(ScheduleDto dto);
	public void seat_view(Model model,ScheduleDto dto);
	public Reservation_ViewDto getPayList(ScheduleDto dto);
	public void kakaoPay(HttpServletRequest request,HttpServletResponse response,Reservation_ViewDto dto) throws IOException;
	public void success(HttpServletRequest request,HttpServletResponse response) throws Exception;
	public Integer getRno();
	public int insertReservation(Reservation_ViewDto dto);
	public int insertReservationDetailA(Reservation_ViewDto dto);
	public int insertReservationDetailC(Reservation_ViewDto dto);
	public void my_reservation_view(Reservation_ViewDto dto,Model model,HttpServletRequest request) throws IOException;
	public List<ReservationdetailDto> getMyReservationView_2(Reservation_ViewDto dto);
	public void reservationCancle(Reservation_ViewDto dto,HttpServletRequest request, HttpServletResponse response) throws IOException;
	
	public void my_cancled_reservation_view(Reservation_ViewDto dto,Model model,HttpServletRequest request) throws IOException;
	
	public void paging(Reservation_ViewDto dto,Model model);
	public int admin_reservationCancle(HttpServletRequest request,HttpServletResponse response) throws IOException;
	public String stt(HttpServletRequest request,HttpServletResponse response) throws Exception;
	
}
