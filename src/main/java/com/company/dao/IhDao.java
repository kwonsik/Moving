package com.company.dao;

import java.util.List;

import com.company.dto.IhResultDto;
import com.company.dto.UserDto;

@MyDao
public interface IhDao {
	//①로그인
	public IhResultDto login(UserDto dto);

	//③회원가입할때씀
	public int join(UserDto dto);

	//④아이디 찾기 
	public String findId(UserDto dto);
	
	//⑤비번찾기
	//비번찾기안에 아이디와 일치하는 이메일찾기
	public UserDto findPassFindMail (UserDto dto);
	//이메일찾았으면 업데이트된 임시비밀번호 보내기
	public int findPassSendMail (UserDto dto);

	//⑥회원정보수정안에서 비밀번호변경
	public int changePass (UserDto dto);

	//⑦마이페이지의 회원정보수정 입장
	public UserDto goToUpdateTab (UserDto dto);
	
	//⑧회원정보수정
	public int userUpdate (UserDto dto);	

	//⑩탈퇴시도 이메일로 코드발송
<<<<<<< HEAD
	public UserDto SendMailForDeleteUser (UserDto dto);

	//⑪관리자의 회원관리페이지테이블
	public List<UserDto> readTotalUser ();

	//⑫관리자가 들어가는 [ 회원의 마이페이지 ]
	public UserDto selectedUserPage (UserDto dto);

	//⑬관리자가 탈퇴시키는 회원 5등급으로
	public int deleteUser (UserDto dto);
		
	//② 사용자가 탈퇴시도하면 4등급 24시간유지
	public int preDeleteUser (UserDto dto);
	//  24시간후 탈퇴처리
		public int myDeleteUser();
	//  탈퇴취소
		public int myDeleteUserCancle(UserDto dto);
		
	//⑭아이디 중복체크
	public int idCheck (UserDto dto);
	
	//⑮닉네임 중복체크
	public int nicknameCheck (UserDto dto);
	
	//⑨이메일 중복체크
	public int emailCheck (UserDto dto);
	
	//비밀번호변경 페이지의 현재비밀번호 검증 ajax
	public int originalPasswordCheck (UserDto dto);
=======
	public UserDto SendMailForDeleteUser (UserDto user_mail);

	//⑪관리자의 회원관리페이지테이블
	public List<UserDto> readTotalUser ();

	//⑫관리자가 들어가는 [ 회원의 마이페이지 ]
	public UserDto selectedUserPage (UserDto user_id);

	//⑬관리자가 탈퇴시키는 회원 5등급으로
	public int deleteUser (UserDto user_id);
		
	//② 사용자가 탈퇴시도하면 4등급 24시간유지
	public int preDeleteUser (UserDto dto);
	//  24시간후 탈퇴처리
		public int myDeleteUser();
	//  탈퇴취소
		public int myDeleteUserCancle(UserDto dto);
		
	//⑭아이디 중복체크
	public int idCheck (UserDto user_id);
	
	//⑮닉네임 중복체크
	public int nicknameCheck (UserDto user_nick);
	
	//⑨이메일 중복체크
	public int emailCheck (UserDto user_mail);
>>>>>>> refs/heads/master
	
}
