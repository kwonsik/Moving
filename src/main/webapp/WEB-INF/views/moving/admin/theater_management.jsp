<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../../inc/admin_header.jsp"%>

<!-- 영화관 관리 페이지 -->
<main id="content">
	<div id="theater-management" class="page">
		<h2>영화관 관리</h2>
		<!-- 검색 및 필터 -->
		<div class="search-filter">
			<input type="text" class="search-input" placeholder="영화관 이름을 입력해주세요.">
			<p>
				<img
					src="${pageContext.request.contextPath}/resources/admin_assets/images/search.png">
			</p>
		</div>
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
				<hr style="clear: both;">
				<div id="scr-list">
					
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

                        console.log(ttNos);
                    	
                    	
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
                        console.log("..................screenListResult");

                        if (result && result.length > 0) {
                            // 여기서 <ul> 열고, 각각의 상영관에 대한 <li>를 추가하고, 마지막에 </ul> 닫습니다.
                            let ul = "<div class='screenlists'><ul>";
                            for (let i = 0; i < result.length; i++) {
                                let screen = result[i];
                                let li = "<li><a href='screen-manage.admin?scr_no="+screen.scr_no+"'>"+screen.scr_name+"</a></li>";
                                ul += li;
                            }
                            ul += "</ul></div>";

                            // 화면에 추가합니다.
                            $("#scr-list").append(ul);
                        } else {
                            // 상영관이 없을 경우 메시지를 표시합니다.
                            $("#scr-list").append("<ul><li>No screens available</li></ul>");
                        }
                    }  ///end screenListResult()
                    
                   
                    
       

                    
                    </script>

	</div>
	<!-- end 영화관관리 페이지 -->
</main>



<%@ include file="../../inc/admin_footer.jsp"%>