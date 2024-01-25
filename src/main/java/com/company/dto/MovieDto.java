package com.company.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MovieDto {
	private int mv_cd;
	private String mv_ktitle;
	private String mv_etitle;
	private int runtime;
	private String mv_plot;
	private String mv_dname;
	private String movie_genre;
	private String mv_aname;
	private String mv_rating;
	private String mv_nation;
	private String mv_company;
	private String mv_img;
	private String mv_start;
	private String mv_crtdate;
	/*
	  
	mv_cd	int	NO	PRI		auto_increment
mv_ktitle	varchar(255)	YES			
mv_etitle	varchar(255)	YES			
mv_runtime	int	YES			
mv_plot	text	YES			
mv_dname	varchar(255)	YES			
movie_genre	varchar(255)	YES			
mv_aname	varchar(255)	YES			
mv_rating	varchar(255)	YES			
mv_nation	varchar(255)	YES			
mv_company	varchar(255)	YES			
mv_img	varchar(255)	YES			
mv_start	date	YES			
mv_crtdate	datetime	YES						*/
}
