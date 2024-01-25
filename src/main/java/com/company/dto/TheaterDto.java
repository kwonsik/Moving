package com.company.dto;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class TheaterDto {
	private int tt_no;
	private String tt_name;
	private String tt_tel;
	private String tt_start;
	private String tt_close;
	private int tt_scrcnt;
	private String tt_img;
	private String tt_address;
	private String tt_crtdate;
	private int total_st_cnt;
	List<ScreenDto> screenList;
	
//	mysql> desc theater;
//	+------------+--------------+------+-----+---------+----------------+
//	| Field      | Type         | Null | Key | Default | Extra          |
//	+------------+--------------+------+-----+---------+----------------+
//	| tt_no      | int          | NO   | PRI | NULL    | auto_increment |
//	| tt_name    | varchar(255) | YES  |     | NULL    |                |
//	| tt_tel     | varchar(255) | YES  |     | NULL    |                |
//	| tt_start   | time         | YES  |     | NULL    |                |
//	| tt_close   | time         | YES  |     | NULL    |                |
//	| tt_scrcnt  | int          | YES  |     | NULL    |                |
//	| tt_img     | varchar(255) | YES  |     | NULL    |                |
//	| tt_address | varchar(255) | YES  |     | NULL    |                |
//	| tt_crtdate | datetime     | YES  |     | NULL    |                |
//	+------------+--------------+------+-----+---------+----------------+
}
