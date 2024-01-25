<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../../admin_inc/header.jsp"%>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/admin_assets/css/admin_hy.css" />

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
							<li>${dto.tt_name}</li>
						</c:forEach>
					</ul>
				</div>
				<hr style="clear: both;">
				<div id="scr-list">
					<ul>
						<!-- ajax로 상영관 리스트 받아옴 -->
					</ul>
				</div>
			</div>
			<!-- end lists -->

			<!-- 페이지네이션 -->
		</div>
		<!-- end sub_content -->


		<!-- 영화관 검색 빈칸검사 -->



	</div>
	<!-- end 영화관관리 페이지 -->
</main>
<script>
                    $(document).ready(function(){
                    	screenReadAll();
                    });

                    <!-- 상영관 LIST -->
                    function screenReadAll(){
                    	$.ajax({
                    		url:"screen-list.hy",
                    		type:"GET",
                    		dataType:"json",
                    		error:function(xhr, status, msg){alert(status="/" +msg)},
                    		success: screenListResult
                    	});
                    }// end screenReadAll()
                    
                    function screenListResult(ss){ //ss는 screen-list.hy에서 받아온 값!!
                        console.log("..................screenListResult");
                        $("#scr-list ul").empty();  // 기존의 ul 내용을 비웁니다.
                        
                     	// 리스트를 , 기준으로 나누고 세로로 정렬
                        var result = ss.map(function (scr) {
                        	
                            return scr.scr_name.split(",");
                        }); 
                        
                      	//console.log(result);
                      	
                      	/* 	result는 2차원 배열로 출력.
                      	['상영1관', '상영2관', '상영3관', '아이맥스관', '4D 상영관']
                      	['1관', '2관', '3관', '4관', '5관']
                      	... */
                      	
                        // result 배열 중 가장 긴 길이 maxLength
                        var maxLength = 0;
                        for (var i = 0; i < result.length; i++) {
    						if (result[i].length > maxLength) {
        					maxLength = result[i].length;
    						}
						}

                        for (var i = 0; i < maxLength; i++) {
                        	//row 배열의 요소를 빈칸으로 연결해서 새로운 <li> 태그 생성하고 #scr-list ul에 추가
                            var row =  result.map(subArray => subArray[i] || "").filter(Boolean);
                               
                            //console.log(row.join(", "));
                            $("<li>").html(row.join("   				")).appendTo("#scr-list ul");
                        }  
                        
                    } //end screenListResult()
                    
</script>



<%@ include file="../../admin_inc/footer.jsp"%>
