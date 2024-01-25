package com.company.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BrokenSeatDto {
	private int bk_st_no;
	private int scr_no;
	private String bk_st_name;

//	mysql> desc broken_seat;
//	+------------+--------------+------+-----+---------+----------------+
//	| Field      | Type         | Null | Key | Default | Extra          |
//	+------------+--------------+------+-----+---------+----------------+
//	| bk_st_no   | int          | NO   | PRI | NULL    | auto_increment |
//	| scr_no     | int          | YES  | MUL | NULL    |                |
//	| bk_st_name | varchar(255) | YES  |     | NULL    |                |
//	+------------+--------------+------+-----+---------+----------------+
}
