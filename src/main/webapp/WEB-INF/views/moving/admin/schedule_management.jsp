<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../inc/admin_header.jsp"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<main id="content">

	<div id="schedule-management" class="page">
		<h2>
			상영시간표 관리
			<button id="add-schedule-btn" class="btn btn-info"
				style="float: right">추가</button>
		</h2>

		<div id="theater-selection">
			<h2>영화관 선택</h2>
			<div class="theater-list">
				<!-- 좌측 화살표 -->
				<div id="left-arrow" class="arrow">&lt;</div>

				<c:forEach var="the" items="${theaterList}" varStatus="status">
					<div class="theater" data-no="${the.tt_no}">
						<p>${the.tt_name}</p>
					</div>
				</c:forEach>

				<!-- 우측 화살표 -->
				<div id="right-arrow" class="arrow">&gt;</div>
			</div>
		</div>

		<div class="sub_content">
			<h2>날짜 선택</h2>
			<div id="date-list">
				<!-- 7일 동안의 날짜를 나타내는 버튼들이 여기에 표시됨 -->
			</div>

			<div id="schedule-table">
				<h2>상영시간표 관리</h2>
				<!-- 영화관 선택 날짜 선택에 대한 상영시간표가 테이블로 보여짐 -->
				<table class="table table-bordered">
					<thead>
						<tr>
							<th scope="col">상영관</th>
							<th scope="col">상영시간</th>
							<th scope="col">영화</th>
							<th scope="col">티켓</th>
							<th scope="col">상영상태</th>
							<th scope="col">버튼</th>
						</tr>
					</thead>
					<tbody>

					</tbody>
				</table>

			</div>

		</div>
	</div>
</main>

<!-- 추가 모달 -->
<div id="add-schedule-modal" class="modal fade" role="dialog">
	<div class="modal-dialog">
		<!-- 모달 내용 -->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">상영시간표 추가</h4>
			</div>
			<div class="modal-body">
				<!-- 영화관 선택 -->
				<label for="theater-select">영화관 선택:</label> <select
					id="theater-select" class="form-control">
					<c:forEach var="the" items="${theaterList}" varStatus="status">
						<option value="${the.tt_no}"
							${status.index == 0 ? 'selected' : ''}>${the.tt_name}</option>
					</c:forEach>
				</select>

				<!-- 영화 선택 -->
				<label for="movie-select">영화 선택:</label> <select id="movie-select"
					class="form-control"></select>

				<!-- 상영관 선택 -->
				<label for="screen-select">상영관 선택:</label> <select
					id="screen-select" class="form-control"></select>

				<!-- 날짜 선택 -->
				<label for="date-select">날짜 선택:</label> <select id="date-select"
					class="form-control"></select>

				<!-- 시작 시간 -->
				<label for="start-time">시작 시간:</label> <select id="start-time"
					class="form-control"></select>

				<!-- 종료 시간 -->
				<label for="end-time">종료 시간:</label> <input type="text"
					id="end-time" class="form-control" readonly>

			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				<button id="add-schedule-confirm-btn" class="btn btn-success">추가하기</button>
			</div>
		</div>
	</div>
</div>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
<script>
$(document).ready(function () {
    // 상수 정의
    const maxVisibleTheaters = 5;
    // 초기화 함수 호출
    initialize();

    // 초기화 함수
    function initialize() {
        setupTheaterSelection();
        setupDateSelection();
        setupScheduleTable();
        setupAddScheduleModal();
    }

    // 영화관 선택 설정
    function setupTheaterSelection() {
        let theaters = $('.theater');
        let selectedDate = $('.date-btn.selected').data('date');
        console.log()
        
        let currentIndex = 0;

        theaters.slice(currentIndex, currentIndex + maxVisibleTheaters).show();

        $('#left-arrow').on('click', function () {
            if (currentIndex > 0) {
                currentIndex--;
                theaters.hide();
                theaters.slice(currentIndex, currentIndex + maxVisibleTheaters).show();
            }
        });

        $('#right-arrow').on('click', function () {
            if (currentIndex < theaters.length - maxVisibleTheaters) {
                currentIndex++;
                theaters.hide();
                theaters.slice(currentIndex, currentIndex + maxVisibleTheaters).show();
            }
        });

        $('.theater').on('click', function () {
            $('.theater.selected').removeClass('selected');
            $(this).addClass('selected');
            var selectedDate = $('.date-btn.selected').data('date');
            console.log(selectedDate);
            updateMovieSchedule($(this).data('no'), selectedDate);
            updateStartTimeOptions();
        });

        var selectedTheaterNo = $('.theater').first().data('no');
        $('.theater').first().addClass('selected');

        updateMovieSchedule(selectedTheaterNo, getCurrentDate());
        updateStartTimeOptions();
    }

    // 날짜 선택 설정
    function setupDateSelection() {
        var dateList = $('#date-list');
        var currentDate = new Date();

        for (var i = 0; i < 7; i++) {
            var date = new Date(currentDate);
            date.setDate(currentDate.getDate() + i);
            var dateString = (date.getMonth() + 1).toString().padStart(2, '0') + '/' + date.getDate().toString().padStart(2, '0');
            var dayOfWeek = getDayDisplay(date.getDay());

            var button = $('<button class="date-btn" data-date="' + date.toISOString().split('T')[0] + '">' + dateString + '<br>' + dayOfWeek + '</button>');

            if (date.toISOString().split('T')[0] === getCurrentDate()) {
                button.addClass('today');
            }

            if (date.getDay() === 0) {
                button.addClass('sunday');
            } else if (date.getDay() === 6) {
                button.addClass('saturday');
            }

            button.data('date', date.toISOString().split('T')[0]);
            dateList.append(button);
        }

        $('.date-btn').first().addClass('selected');

        dateList.on('click', '.date-btn', function () {
            $('.date-btn.selected').removeClass('selected');
            $(this).addClass('selected');
            console.log('Selected Date:', $('.date-btn.selected').data('date')); // 추가 부분
            updateMovieSchedule($('.theater.selected').data('no'), $(this).data('date'));
        });
    }

    // 상영시간표 테이블 설정
    function setupScheduleTable() {
        $('#schedule-table').on('click', '.delete-btn', function () {
            var scheduleNo = $(this).data('schedule-no');
            var $this = $(this);
            deleteMovieSchedule(scheduleNo, $this);
        });
    }

    // 추가 모달 설정
    function setupAddScheduleModal() {
        $('#add-schedule-btn').on('click', function () {
            $('#theater-select').val($('.theater').first().data('no'));
            updateScreenOptions();

            var dateList = generateDateList();
            var dateSelect = $('#date-select');
            dateSelect.empty();
            
            dateList.forEach(function (date) {
                dateSelect.append('<option value="' + date + '">' + date + '</option>');
            });

            $('#date-select').val(getCurrentDate());
            updateMovieOptions();
            updateStartTimeOptions();
            
            $('#start-time').val('');
            $('#end-time').val('');

            $('#add-schedule-modal').modal('show');
        });

        $('#theater-select').on('change', function () {
        	$('#start-time').val('');
            $('#end-time').val('');
            updateScreenOptions();
            updateStartTimeOptions();
        });
        
        $('#date-select').on('change', function () {
        	$('#start-time').val('');
            $('#end-time').val('');
            updateStartTimeOptions();
        });

        // 영화 선택 시 상영 종료 시간 업데이트
        $('#movie-select').on('change', function () {
            updateEndTime();
        });

        // 상영 시작 시간 선택 시 상영 종료 시간 업데이트
        $('#start-time').on('change', function () {
 
            updateEndTime();
        });

     // 상영시간표 추가 로직
        $('#add-schedule-confirm-btn').on('click', function () {
            // 필요한 데이터 수집
            var theaterNo = $('#theater-select').val();
            var screenNo = $('#screen-select').val();
            var movieNo = $('#movie-select').val();
            var selectedDate = $('#date-select').val();
            var startTime = $('#start-time').val();
            var endTime = $('#end-time').val();
            var selectedScreenOption = $('#screen-select option:selected');
            var scrStCnt = selectedScreenOption.data('scr-st-cnt');

            // 서버로 상영시간표 추가 요청 보내기
            $.ajax({
                url: 'addSchedule.shj', 
                method: 'POST',
                data: {
                    scr_no: screenNo,
                    mv_cd: movieNo,
                    sch_date: selectedDate,
                    sch_start: startTime,
                    sch_end: endTime,
                    sch_cnt: scrStCnt
                },
                dataType: 'json',
                success: function (data) {
                    // 성공 시 처리
                    console.log(data.result);
                    if (data.result > 0) {
                        // 상영시간표가 추가되었을 때의 동작을 구현
                    	$('.theater[data-no="' + theaterNo + '"]').trigger('click');
                        $('.date-btn[data-date="' + selectedDate + '"]').trigger('click');
                    } else {
                        alert("이미 해당 시간대에 다른 상영 일정이 예약되어 있습니다.\n상영 일정을 확인해주세요.");
                    }
                },
                error: function (error) {
                    console.error('Failed to add schedule:', error);
                    alert('상영시간표 추가 중 오류가 발생했습니다.');
                }
            });

            // 모달 닫기
            $('#add-schedule-modal').modal('hide');
        });
    }

    // 현재 날짜를 ISO 형식으로 반환
    function getCurrentDate() {
        return new Date().toISOString().split('T')[0];
    }

    // 날짜의 요일 표시 반환
    function getDayDisplay(dayIndex) {
        let daysOfWeek = ['일', '월', '화', '수', '목', '금', '토'];
        return daysOfWeek[dayIndex];
    }

    // 날짜 목록 생성
    function generateDateList() {
        let dateList = [];
        let currentDate = new Date();
        for (let i = 0; i < 7; i++) {
            let date = new Date(currentDate);
            date.setDate(currentDate.getDate() + i);
            dateList.push(date.toISOString().split('T')[0]);
        }
        return dateList;
    }

    // 상영관 업데이트 - 모달 데이터
    function updateScreenOptions() {
        let theaterSelect = $('#theater-select');
        let screenSelect = $('#screen-select');

        let selectedTheaterNo = theaterSelect.val();

        $.ajax({
            url: 'getScreenList.shj',
            method: 'GET',
            data: { tt_no : selectedTheaterNo },
            dataType: 'json',
            success: function (data) {
                screenSelect.empty();
                data.forEach(function (screen) {
                	// scr_no를 value로, scr_name을 표시 텍스트로 지정
                    // 추가로 scr_st_no와 scr_st_cnt를 data 속성으로 저장
                    screenSelect.append('<option value="' + screen.scr_no + '" ' 
                    	    + ' data-scr-st-cnt="' + screen.scr_st_cnt + '">' 
                    		+ screen.scr_name + '</option>');
                });
            },
            error: function (error) {
                console.error('Failed to fetch screens:', error);
            }
        });
    }

    // 영화 목록 업데이트 - 모달 데이터 
    function updateMovieOptions() {
        let movieSelect = $('#movie-select');
        $.ajax({
            url: 'getMovieList.shj',
            method: 'GET',
            dataType: 'json',
            success: function (data) {
                movieSelect.empty();
                data.forEach(function (movie) {
                    movieSelect.append('<option value="' + movie.mv_cd + '" data-runtime="' + movie.mv_runtime + '">' + movie.mv_ktitle + '</option>');
                });
            },
            error: function (error) {
                console.error('Failed to fetch movies:', error);
            }
        });
    }

    // 상영시간표 업데이트
    function updateMovieSchedule(theaterNo, selectedDate) {
        $.ajax({
            url: 'scheduleListAdmin.shj',
            method: 'GET',
            data: { theaterNo: theaterNo, date: selectedDate },
            dataType: 'json',
            success: function (data) {
                let scheduleTableBody = $('#schedule-table tbody');
                scheduleTableBody.empty();

                if (data.length === 0) {
                    scheduleTableBody.html('<tr><td colspan="6">상영시간표가 없습니다.</td></tr>');
                } else {
                    data.forEach(function (schedule) {
                        let row = '<tr>' +
                            '<td>' + schedule.scr_name + '</td>' +
                            '<td>' + schedule.sch_start + ' ~ ' + schedule.sch_end + '</td>' +
                            '<td>' + schedule.mv_ktitle + '</td>' +
                            '<td>' + schedule.sch_cnt + ' / ' + schedule.available_seats + '</td>' +
                            '<td>' + schedule.schstate_state + '</td>' +
                            '<td><button class="delete-btn btn btn-danger" data-schedule-no="' + schedule.sch_no + '">삭제</button></td>' +
                            '</tr>';

                        scheduleTableBody.append(row);
                    });
                }
            },
            error: function (error) {
                console.error('Failed to fetch movie schedule:', error);
            }
        });
    }

    // 상영시간표 삭제
    function deleteMovieSchedule(scheduleNo, $this) {
        $.ajax({
            url: 'deleteSchedule.shj',
            method: 'POST',
            data: { sch_no: scheduleNo },
            dataType: 'json',
            success: function (data) {
                if (data.result > 0) {
                    $this.closest('tr').remove();
                } else {
                    alert('삭제 실패');
                }
            },
            error: function (error) {
                console.error('Failed to delete schedule:', error);
            }
        });
    }

    // 상영 시작 시간 옵션 업데이트
    function updateStartTimeOptions() {
        let startTimeSelect = $('#start-time');
        let theaterSelect = $('#theater-select');
        let selectedTheaterNo = theaterSelect.val();
        let selectedDate = $('#date-select').val();

        // 영화관 정보 가져오기
        $.ajax({
            url: 'getTheaterInfo.shj',
            method: 'GET',
            data: { tt_no: selectedTheaterNo },
            dataType: 'json',
            success: function (data) {
                if (data.tt_start && data.tt_close) {
                    // 영화관의 시작 시간과 종료 시간을 기반으로 옵션 생성
                    let startTime = moment(data.tt_start, 'HH:mm');
                    let closeTime = moment(data.tt_close, 'HH:mm');

                    startTimeSelect.empty();
                    let currentTime = moment();
					
                    // 오늘 날짜이고 현재 시간 이후라면 30분 단위로 반올림하여 현재 시간 이후의 옵션만 생성
                    if (selectedDate === getCurrentDate() && startTime.isBefore(currentTime)) {
                        let roundedTime = Math.ceil(currentTime.minutes() / 30) * 30; // 30분 간격으로 반올림
                        currentTime.minutes(roundedTime);
                        startTime = currentTime;
                    }
                    
                    while (startTime.isBefore(closeTime)) {
                        startTimeSelect.append('<option value="' + startTime.format('HH:mm') + '">' + startTime.format('HH:mm') + '</option>');
                        startTime.add(30, 'minutes');
                    }
                }
            },
            error: function (error) {
                console.error('Failed to fetch theater info:', error);
            }
        });
    }

 // 상영 종료 시간 계산
    function calculateEndTime(startTime, runtime, selectedDate) {
        let startTimeMoment = moment(selectedDate + ' ' + startTime, 'YYYY-MM-DD HH:mm');
        let runtimeMoment = moment.duration(runtime, 'minutes');
        let endTimeMoment = startTimeMoment.clone().add(runtimeMoment);
        return endTimeMoment.format('YYYY-MM-DD HH:mm');
    }

 // 상영 종료 시간 업데이트
    function updateEndTime() {
        let startTimeSelect = $('#start-time');
        let endTimeSelect = $('#end-time');
        let selectedMovieOption = $('#movie-select option:selected');
        let movieRuntime = selectedMovieOption.data('runtime');
        let selectedDate = $('#date-select').val();

        if (startTimeSelect.val() && movieRuntime) {
            let endTime = calculateEndTime(startTimeSelect.val(), movieRuntime, selectedDate);

            // 영화관 종료 시간 가져오기
            let theaterSelect = $('#theater-select');
            let selectedTheaterNo = theaterSelect.val();

            $.ajax({
                url: 'getTheaterInfo.shj',
                method: 'GET',
                data: { tt_no: selectedTheaterNo },
                dataType: 'json',
                success: function (data) {
                    console.log(data.tt_start);
                    console.log(data.tt_close);

                    if (data.tt_close) {
                        // 선택된 날짜와 영화관 종료 시간 조합
                        let closeTime = moment(selectedDate + ' ' + data.tt_close, 'YYYY-MM-DD HH:mm');

                        if (moment(endTime, 'YYYY-MM-DD HH:mm').isBefore(closeTime)) {
                            // endTime 값을 'HH:mm' 형식으로 변경
                            let formattedEndTime = moment(endTime, 'YYYY-MM-DD HH:mm').format('HH:mm');
                            endTimeSelect.val(formattedEndTime);
                        } else {
                            alert('상영 종료 시간은 영화관 종료 시간 이전이어야 합니다.');
                            startTimeSelect.val('');
                            endTimeSelect.val('');
                        }
                    }
                },
                error: function (error) {
                    console.error('Failed to fetch theater info:', error);
                }
            });
        }
    }
});
</script>

<%@ include file="../../inc/admin_footer.jsp"%>