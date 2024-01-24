package com.company.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ScreenDto {
	private int scr_no;
	private int tt_no;
	private String scr_name;
	private int scr_st_cnt;
	private String scr_crtdate;
	private int scr_price;
	private char scr_st_row;
	private int scr_st_col;
	private int scrstate_no;
	
//	mysql> desc screen;
//	+-------------+--------------+------+-----+---------+----------------+
//	| Field       | Type         | Null | Key | Default | Extra          |
//	+-------------+--------------+------+-----+---------+----------------+
//	| scr_no      | int          | NO   | PRI | NULL    | auto_increment |
//	| tt_no       | int          | YES  | MUL | NULL    |                |
//	| scr_name    | varchar(255) | YES  |     | NULL    |                |
//	| scr_st_cnt  | int          | YES  |     | NULL    |                |
//	| scr_crtdate | datetime     | YES  |     | NULL    |                |
//	| scr_price   | int          | YES  |     | NULL    |                |
//	| scr_st_row  | int          | YES  |     | NULL    |                |
//	| scr_st_col  | char(1)      | YES  |     | NULL    |                |
//	| scrstate_no | int          | YES  | MUL | NULL    |                |
//	+-------------+--------------+------+-----+---------+----------------+
}
