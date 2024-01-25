package com.company.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserDto {
	private int user_no;
	private int usertp_no;
	private String user_id;
	private String user_name;
	private String user_pass;
	private String user_nick;
	private String user_mail;
	private String user_age;
	private String user_phone;
	private String user_kakao;
	private String user_crtdate;
	private String user_ip;
}
