package com.company.moving;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.company.dao.IhDao;
import com.company.dao.TestDao;
import com.company.dto.MovieDto;
//import com.company.service.MovieService;
import com.company.dto.UserDto;
import com.company.service.IhService;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="file:src/main/webapp/WEB-INF/spring/**/root-context.xml")
@Log4j
public class Test0 {
	@Autowired ApplicationContext context;
	@Autowired TestDao dao;
	@Autowired IhDao ihdao;
	@Autowired IhService service;
//	@Autowired MovieService mv_service;

	@Test  public void test1() {
		UserDto dto=new UserDto();
		dto.setUser_id("kkang318");
		System.out.println(service.idCheck(dto));
	}
	@Test @Ignore public void test2() {
		MovieDto mv_dto = new MovieDto();

		// MovieDto에 설정
//		mv_dto.setMv_cd(572802);
//		mv_dto.setMv_ktitle("아쿠아맨과 로스트 킹덤");
//		mv_dto.setMv_etitle("Aquaman and the Lost Kingdom");
//		mv_dto.setMv_runtime(124);
//		mv_dto.setMv_plot("아틀란티스 왕국을 이끌 왕의 자리에 오른 아쿠아맨. 그 앞에 블랙 만타가 세상을 뒤흔들 강력한 지배 아이템 블랙 트라이던트를 손에 넣게 된다. 그동안 겪지 못 했던 최악의 위협 속 아쿠아맨은 블랙 만타와 손을 잡았던 이복 동생 옴 없이는 절대적 힘이 부족한 상황. 바다를 지배할 슈퍼 히어로가 세상의 판도를 바꾼다!");
//		mv_dto.setMv_dname("James Wan");
//		mv_dto.setMovie_genre("액션, 모험, 판타지");
//		mv_dto.setMv_aname("Jason Momoa, Patrick Wilson, Yahya Abdul-Mateen II, Randall Park 外");
//		mv_dto.setMv_rating("null");
//		mv_dto.setMv_nation("United States of America");
//		mv_dto.setMv_company("Warner Bros. Pictures, The Safran Company, Atomic Monster, DC Films, Domain Entertainment");
//		mv_dto.setMv_img("/eDps1ZhI8IOlbEC7nFg6eTk4jnb.jpg");
//		mv_dto.setMv_start("2023-12-19");
//		mv_dto.setMv_stilcut("/jXJxMcVoEuXzym3vFnjqDW4ifo6.jpg, /7S0bXv3BqCuPfImKRf5kkmBVYZR.jpg, /iNgn9LP0iMuLSnWqolivcY3Y7F6.jpg, /bckxSN9ueOgm0gJpVJmPQrecWul.jpg, /zgYQmJHrpjjiCzWs97IhFEUrLui.jpg, /nxUT101UPWZvhRGqAzs81IJMJp7.jpg, /iXOOGQrR2aVGJ2oSbJtOvnPWMb5.jpg");
//		mv_dto.setMv_video("Srlwzx9itl0");
//		mv_dto.setMv_popularity(936);
//		mv_dto.setMv_cert("12");
//		log.info(".............."+mv_service.mv_insert(mv_dto));
//		log.info(mv_service.mv_readLive());
	}
	
}
