<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../../inc/admin_header.jsp"%>

<!-- 영화관 관리 페이지 -->
<main id="content">
	<div id="theater-management" class="page">
		<h2>영화관 관리</h2>
		<!-- 검색 및 필터 -->
		<%-- <div class="search-filter">
			<input type="text" class="search-input" placeholder="영화관 이름을 입력해주세요.">
			<p>
				<img
					src="${pageContext.request.contextPath}/resources/admin_assets/images/search.png">
			</p>
		</div> --%>
		<section style="min-height: 20px;"></section>
		<div class="sub_content">
			<!-- 영화관 / 상영관 목록 view -->
			<div id="lists">
				<div id="tt-list">
					<ul>
						<c:forEach var="dto" items="${theaterList}" varStatus="status">
							<li data-tt_no="${dto.tt_no}"><a
								href="revise-theater.admin?tt_no=${dto.tt_no}">${dto.tt_name}</a></li>
						</c:forEach>
					</ul>
				</div>

			</div>
			<!-- end lists -->

			<!-- 페이지네이션 -->
		</div>
		<!-- end sub_content -->

		

		<script>
                    $(document).ready(function(){
                    	screenReadAll();	
                    });

                    <!-- 상영관 LIST -->
                    function screenReadAll(){
                    	let ttNos = [];
                        $("#tt-list li").each(function() {
                            ttNos.push($(this).data("tt_no"));
                        });

                        console.log("ttNOs : "+ttNos);
                    	
                    	
                    	for (let i = 0; i < ttNos.length; i++) {
                            let ttNo = ttNos[i];
                            $.ajax({
                                url: "screen-list.admin",
                                type: "GET",
                                dataType: "json",
                                data: { tt_no: ttNo },
                                error: function(xhr, status, msg) { alert("목록불러오기 에러"); },
                                success: screenListResult
                            });
                        }
                    	
                    	
                    }// end screenReadAll()
                    
                    
                    
                    function screenListResult(result){ //result는 screen-list.hy에서 받아온 값!!
                        console.log("..................영화관 목록 screenList");

                        if (result && result.length > 0) {
                            // 여기서 <ul> 열고, 각각의 상영관에 대한 <li>를 추가하고, 마지막에 </ul> 닫습니다.
                            let ul = "<div class='screenlists'><ul>";
                            for (let i = 0; i < result.length; i++) {
                                let screen = result[i];
                                let li = "<li data-scrstate='"+screen.scrstate_no+"'><a href='screen-manage.admin?scr_no="+screen.scr_no+"'>"+screen.scr_name+"</a></li>";
                                ul += li;
                            }
                            ul += "</ul></div>";

                            // 해당 영화관의 data-tt_no를 가져와서 해당 영화관의 하위에 추가
                            let ttNo = result[0].tt_no; // 예시로 첫 번째 상영관의 tt_no를 가져옴
                            $("#tt-list li[data-tt_no='" + ttNo + "']").append("<hr style='clear: both;'>" + ul);
                            
                         	// 중지된 상영관들은 흐리게 표시
                            /*  $(".screenlists li[data-scrstate='2']").css({ "color": "#8d8787", "background-color": "#afafaf" });*/
                            $(".screenlists li[data-scrstate='2']").addClass('stopScreens');
                         	
                        } else {
                            // 상영관이 없을 경우 메시지를 표시
                            $("#tt-list li[data-tt_no='" + ttNo + "']").append("<ul><li>No screens available</li></ul>");
                        }
                        
                       
                    }  ///end screenListResult()
                    
                    
                   
                   
                    
       

                    
                    </script>

	</div>
	<!-- end 영화관관리 페이지 -->
</main>



<%@ include file="../../inc/admin_footer.jsp"%>