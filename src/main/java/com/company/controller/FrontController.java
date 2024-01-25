package com.company.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.company.dao.TheaterManageDao;
import com.company.dto.ScheduleDto;
import com.company.dto.ScreenDto;
import com.company.dto.TheaterDto;
import com.company.service.AddTheaterService;
import com.company.service.SchService;
import com.google.gson.Gson;

@Controller
public class FrontController {
	@Autowired
	SchService service;

	// 관리자
	@GetMapping("/admin.shj")
	public String adminPage(Model model) {
		System.out.println(".... admin도착");
		model.addAttribute("theaterList", service.theaterList());

		return "schedule_management";
	}

	@RequestMapping(value = "/scheduleListAdmin.shj", method = RequestMethod.GET, produces = "text/html; charset=UTF-8")
	@ResponseBody
	public String scheduleListAdmin(@RequestParam("theaterNo") int no, @RequestParam("date") String date) {
		Map<String, Object> map = new HashMap<>();
		System.out.println(".... 상영시간표 보여주세요");

		map.put("theaterNo", no);
		map.put("date", date);

		System.out.println();
		Gson gson = new Gson();
		String json = gson.toJson(service.scheduleListAdmin(map));

		return json;
	}

	@RequestMapping(value = "/deleteSchedule.shj", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> deleteSchedule(ScheduleDto dto) {
		System.out.println(".... 상영시간표 삭제 보여주세요");
		Map<String, Object> result = new HashMap<>();
		result.put("result", service.deleteSchedule(dto));

		return result;
	}

	@RequestMapping(value = "/getMovieList.shj", method = RequestMethod.GET, produces = "text/html; charset=UTF-8")
	@ResponseBody
	public String getMovieList(ScheduleDto dto) {
		System.out.println(".... 영화리스트 보여주세요");

		Gson gson = new Gson();
		String json = gson.toJson(service.getMovieList());

		return json;
	}
	
	@RequestMapping(value = "/getScreenList.shj", method = RequestMethod.GET, produces = "text/html; charset=UTF-8")
	@ResponseBody
	public String getScreenListByTheater(ScreenDto dto) {
		System.out.println(".... 상영관리스트 보여주세요");
		System.out.println(dto);

		Gson gson = new Gson();
		String json = gson.toJson(service.getScreenList(dto));
		System.out.println(json);

		return json;
	}
	
	@RequestMapping(value = "/getTheaterInfo.shj", method = RequestMethod.GET, produces = "text/html; charset=UTF-8")
	@ResponseBody
	public String getTheaterHours(TheaterDto dto) {
		System.out.println(".... 영화관 운영시간 보여주세요");

		Gson gson = new Gson();
		String json = gson.toJson(service.getTheaterHours(dto));
		return json;
	}
	
	@RequestMapping(value = "/addSchedule.shj", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> addSchedule(ScheduleDto dto) {
		System.out.println(".... 상영시간표 추가 보여주세요");
		System.out.println(dto);
		Map<String, Object> result = new HashMap<>();
		
		result.put("result", service.insertScheduleAction(dto));

		return result;
	}
	
	
	// 사용자 /////////////////////////////////////////////
	@GetMapping("/main.shj")
	public String main(Model model) {

		model.addAttribute("theaterList", service.theaterList());
		return "main";
	}

	@RequestMapping(value = "/theaterDetail.shj", method = RequestMethod.POST, produces = "text/html; charset=UTF-8")
	@ResponseBody
	public String theaterDetail(TheaterDto dto) {

		return service.theaterDetail(dto);
	}

	@RequestMapping(value = "/scheduleList.shj", method = RequestMethod.GET, produces = "text/html; charset=UTF-8")
	@ResponseBody
	public String scheduleList(@RequestParam("theaterNo") int no, @RequestParam("date") String date) {
		Map<String, Object> map = new HashMap<>();

		map.put("theaterNO", no);
		map.put("date", date);

		return service.scheduleList(map);
	}
	
	///////////////////////////////////////////////////////////////////////////////////////////
	// hy
	
	@Autowired
	TheaterManageDao dao;
	
	@Autowired
	AddTheaterService ATservice;
	
	
	@RequestMapping(value="/theater-list.hy", method=RequestMethod.GET)
	public String theaterList(Model model) {
		model.addAttribute("theaterList", dao.theaterReadAll());
		
		return "theater_management";
	}
	
	
	//영화관 목록 - 상영관 리스트 ajax로 받아옴
	@RequestMapping(value="/screen-list.hy", method=RequestMethod.GET ,produces = "application/text; charset=utf8")
	@ResponseBody
	public String screenList() {
		System.out.println(".... ajax");
		
		Gson gson = new Gson();
		String json = gson.toJson(dao.screenReadAll());
		System.out.println(json);
		
		return json;
	}
	
	
	@RequestMapping(value="/add-theater.hy", method=RequestMethod.GET)
	public String addTheaterView() {
		return "add_theater";
	}
	
	
	@RequestMapping(value = "/add-theater.hy", method = RequestMethod.POST)
    public String addTheater(@ModelAttribute TheaterDto dto) {
        System.out.println("... 추가해주세요");
        System.out.println(dto);
        
        ATservice.insertTheaterAndScreen(dto);

        // 나머지 로직 수행

        return "redirect:theater-list.hy";
    }
	
}
