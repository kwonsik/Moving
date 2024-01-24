<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../inc/header.jsp"%>





<!-- main -->
<main id="main" class="main">
	<h2 class="blind">영화예매</h2>
	<form action="seat_view.ks" method="post" id="reservationForm">
	<input type="text" class="blind" id="sch_no" name="sch_no" value="">
	
		<div id="reservation" class="ks reservation">
			<div class="title">
				<h4>영화예매</h4>
			</div>
			<div id="theaterList" class="theaterList">
				<h5>영화관</h5>
				<ul>
					<c:forEach var="tt" items="${theaterList }">
						<li><input type="button" class="theater"
							value="${tt.tt_name }" id="${tt.tt_no}"></li>
					</c:forEach>
				</ul>
			</div>
			<div id="movieList" class="movieList">
				<h5>영화</h5>
				<ul>
					<c:forEach var="mv" items="${movieList }">
						<!--  <li><input type="button" class="movie"
							value="${mv.mv_ktitle }" id="_${mv.mv_cd}"></li> -->
						<li><input type="button" class="movie m${mv.mv_cd}"
							value="${mv.mv_ktitle }"  ></li>
					</c:forEach>
				</ul>
			</div>
			<div id="dateList" class="dateList">
				<h5>날짜</h5>
				<ul>
					<li><input type="button" class="time" value="" name="time"
						id="time1"></li>
					<li><input type="button" class="time" value="" name="time"
						id="time2"></li>
					<li><input type="button" class="time" value="" name="time"
						id="time3"></li>
					<li><input type="button" class="time" value="" name="time"
						id="time4"></li>
					<li><input type="button" class="time" value="" name="time"
						id="time5"></li>
					<li><input type="button" class="time" value="" name="time"
						id="time6"></li>
					<li><input type="button" class="time" value="" name="time"
						id="time7"></li>
				</ul>
			</div>
			
			<div id="scheduleList" class="scheduleList">
				<h5>상영시간</h5>
				<ul class="scheduleList ul">
				
					
				</ul>
			</div>
			<div id="submit" class="submit">
				<input type="submit" class="submitBtn" value="인원 좌석 선택">
			</div>
			


		</div>
	</form>
	<script>
	$(document).ready(function() {
		
			let  mv_cd = '${param.mv_cd}';
			let sch_no='${param.sch_no}';
			
			
			
		

			
			$(".theater").on("click", function() {
				
				if ($(this).parent().attr("class") == "selected") {
					$(this).parent().removeClass("selected");
				} else {
					$(this).parents("ul").find("li").removeClass("selected");
					$(this).parent().addClass("selected");
				}
				
				getMovieList();
				getDateList();
				check();
				 
			});
			
			
			
			$(document).on("click",".movie", function() {
				
				if ($(this).parent().attr("class") == "selected") {
					$(this).parent().removeClass("selected");
				} else {
					$(this).parents("ul").find("li").removeClass("selected");
					$(this).parent().addClass("selected");
				}
				getTheaterList();  // 다
				getDateList();
				check();

			});
			$(".time").on("click", function() {
				
				if ($(this).parent().attr("class") == "selected") {
					$(this).parent().removeClass("selected");
				} else {
					$(this).parents("ul").find("li").removeClass("selected");
					$(this).parent().addClass("selected");
				}
				getMovieList();
				getTheaterList();
				check();
			});
			
			
			
			
			
			let now = new Date();
			let nowdate = now.getDate();
			let weekday = [ "일", "월", "화", "수", "목", "금", "토", "일", "월", "화",
					"수", "목", "금", "토" ]
			$("#now").html(now.getFullYear() + "." + (now.getMonth() + 1));
			let cnt = 1;
			for (let i = now.getDay(); i < now.getDay() + 7; i++) {
				$("#time" + cnt).attr("value", weekday[i] + " " + nowdate);
				$("#time" + cnt).attr(
						'date',
						now.getFullYear() + "-0" + (now.getMonth() + 1) + "-"
								+ (now.getDate() + cnt - 1));
				if (weekday[i] == "일") {
					$("#time" + cnt).addClass("sunday");
				} else if (weekday[i] == "토") {
					$("#time" + cnt).addClass("saturday");
				}
				nowdate += 1;
				cnt += 1;
			}

			let getTheaterList = function() {
				$
						.ajax({
							type : "GET",
							url : "getTheaterList.ks",
							data : {
								mv_ktitle : $(".selected .movie").val(),
								sch_date : $(".selected .time").attr("date")
							},
							dataType : 'json',
							async : false,
							success : function(data) {
								let allTheaterList = document
										.querySelectorAll(".theater");
								let arr = new Array();
								for (let i = 0; i < allTheaterList.length; i++) {
									arr.push(allTheaterList[i]
											.getAttribute("id"));

								}
								arr.sort();
								for (let i = 0; i < allTheaterList.length; i++) {
									$("#" + arr[i]).parent().appendTo(
											$(allTheaterList[i]).parents("ul"));

								}

								$(".theater").attr("disabled", true);
								$(".theater").addClass("unable");


								for (let i = 0; i < allTheaterList.length; i++) {
									for (let j = 0; j < data.length; j++) {

										if (allTheaterList[i].value == data[j].tt_name) {
											allTheaterList[i]
													.removeAttribute("disabled");
											allTheaterList[i].classList
													.remove("unable");
											break;
										}

									}
								}
								$('.theater.unable').each(
										function() {
											$(this).parent().appendTo(
													$(this).parents("ul"));
										});

							},
							error : function(request, status, error) {
								console.log("code: " + request.status)
								console.log("message: " + request.responseText)
								console.log("error: " + error);
							}
						});
			}

			let getMovieList = function() {
				$
						.ajax({
							type : "GET",
							url : "getMovieList.ks",
							data : {
								tt_name : $(".selected .theater").val(),
								sch_date : $(".selected .time").attr("date")
							},
							dataType : 'json',
							async : false,
							success : function(data) {

								$(".movie").attr("disabled", true);
								$(".movie").addClass("unable");
								let allMovieList = document
										.querySelectorAll(".movie");
								let arr = new Array();
								for (let i = 0; i < allMovieList.length; i++) {
									arr
											.push(allMovieList[i]
													.getAttribute("id"));

								}
								arr.sort();
								for (let i = 0; i < allMovieList.length; i++) {
									$("#" + arr[i]).parent().appendTo(
											$(allMovieList[i]).parents("ul"));

								}

								for (let i = 0; i < allMovieList.length; i++) {
									for (let j = 0; j < data.length; j++) {

										if (allMovieList[i].value == data[j].mv_ktitle) {
											allMovieList[i]
													.removeAttribute("disabled");
											allMovieList[i].classList
													.remove("unable");
											break;
										}

									}
								}
								$('.movie.unable').each(
										function() {
											$(this).parent().appendTo(
													$(this).parents("ul"));
										});

							},
							error : function(request, status, error) {
								console.log("code: " + request.status)
								console.log("message: " + request.responseText)
								console.log("error: " + error);
							}
						});
			}
			let getDateList = function() {
				$
						.ajax({
							type : "GET",
							url : "getDateList.ks",
							data : {
								tt_name : $(".selected .theater").val(),
								mv_ktitle : $(".selected .movie").val()
							},
							dataType : 'json',
							async : false,
							success : function(data) {
								$(".time").attr("disabled", true);
								$(".time").addClass("unable");
								let allDateList = document
										.querySelectorAll(".time");

								console.log(data);

								for (let i = 0; i < allDateList.length; i++) {
									for (let j = 0; j < data.length; j++) {

										if (allDateList[i]
												.getAttribute("date") == data[j].sch_date) {
											allDateList[i]
													.removeAttribute("disabled");
											allDateList[i].classList
													.remove("unable");
											break;
										}

									}
								}

							},
							error : function(request, status, error) {
								console.log("code: " + request.status)
								console.log("message: " + request.responseText)
								console.log("error: " + error);
							}
						});
				
				
			}
			let check=function(){
				let theater=$(".theaterList .selected input").val();
				let movie=$(".movieList .selected input").val();
				let date=$(".dateList .selected input").attr("date");

				if(theater!=null&&movie!=null&&date!=null){
					$(".scheduleList .ul").html("");
					getScheduleList();
					
					$(".schedule").on("click",function(){
					
						
						if ($(this).parent().attr("class") == "selected") {
							$(this).parent().removeClass("selected");
						} else {
							$(this).parents("ul").find("li").removeClass("selected");
							$(this).parent().addClass("selected");
						}
						let value=$(this).val();
						$("#sch_no").attr('value',value);
					});
					
				}
				else{
					$(".scheduleList .ul").html("");

				}
			}
			let getScheduleList = function() {
				$
						.ajax({
							type : "GET",
							url : "getScheduleList.ks",
							data : {
								tt_name : $(".selected .theater").val(),
								mv_ktitle : $(".selected .movie").val(),
								sch_date : $(".selected .time").attr("date")
							},
							dataType : 'json',
							async : false,
							success : function(data) {

								for(let i=0;i<data.length;i++){
									let li=("<li><button type='button' class='schedule "+data[i].sch_no+"' name='schedule' value="+data[i].sch_no+">"			
											+"<div class='scr_name'>"+data[i].scr_name+"</div>"	
											+"<div>"				
											+"<p class='sch_time'>"+data[i].sch_start+"<span>~"+data[i].sch_end+"</span></p>"				
											+"<p class='cnt'>"+data[i].sch_cnt+"/<span>"+data[i].scr_st_cnt+"</span></p>"			
											+"</div>"		
											+"</button></li>");
									$(".scheduleList ul").append(li);
								}
								

							},
							error : function(request, status, error) {
								console.log("code: " + request.status)
								console.log("message: " + request.responseText)
								console.log("error: " + error);
							}
						});
				
				
			}
			$("#reservationForm").on("submit",function(){
				let theater=$(".theaterList .selected input").val();
				let movie=$(".movieList .selected input").val();
				let date=$(".dateList .selected input").val();
				let schedule=$(".scheduleList .selected button").val();
				console.log(theater+"/"+movie+"/"+date+"/"+schedule);
				let array1=new Array();
				let array2=["영화관","영화","날짜","상영스케쥴"];
				array1.push(theater);array1.push(movie);array1.push(date);array1.push(schedule);
				console.log(array1);
				console.log(array2);
				
				for(let i=0;i<array1.length;i++){
					if(array1[i]==null){
						alert(array2[i]+"을(를) 선택해주세요");return false; break;
					}
				}
				
			});
			
			
			
			
			if(sch_no!=''){
				$
				.ajax({
					type : "GET",
					url : "allClick.ks",
					data : {
						sch_no : sch_no
						
					},
					dataType : 'json',
					async : false,
					success : function(data) {
						console.log(data)
						$("#"+data.tt_no).trigger("click");
						$(".movie.m"+data.mv_cd).trigger("click");				
						$("[date='"+data.sch_date+"']").trigger("click");
						$(".schedule."+sch_no).trigger("click");
						
						
					},
					error : function(request, status, error) {
						console.log("code: " + request.status)
						console.log("message: " + request.responseText)
						console.log("error: " + error);
					}
				});
				
			}
					
			$(".movie.m"+mv_cd).trigger("click");
			
		});
	</script>
</main>
<!-- //main -->
<%@ include file="../../inc/footer.jsp"%>