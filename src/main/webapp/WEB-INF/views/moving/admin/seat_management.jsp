<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../../inc/admin_header.jsp"%>

            <main id="content">
                <!-- 좌석 관리 페이지 -->
                <div id="seat-management" class="page">
                    <h2>좌석 관리</h2>
                    <div class="sub_content">
                        <h4> ${dto.tt_name} </h4>
                        <hr>
                        
                        <div id="seat" data-bkLists="${bkLists}" >
                        	<!-- 열 반복 -->
                        	<c:forEach var="row" begin="0" end="${dto.st_row}" step="1">
                        		<!-- 행 반복 -->
                        		<p data-scr_no="${dto.scr_no}">
                        			<c:forEach var="col"  begin="1" end="${dto.scr_st_col}" step="1">
                        				<div class="eachSeat">
                        				<input type="checkbox" class="${dto.list[row]}${col} hidden" data-bkSeat="${dto.list[row]}${col}"/>
                        				<label for="${dto.list[row]}${col}" >${dto.list[row]}${col}</label>
                        				</div>
                        			</c:forEach>
                        		</p>
                        	</c:forEach>
						</div>
                        

                        <input type="button" value="좌석 수정하기" id="revise-seats-btn"/>
                     
                    </div>
                    
                </div>
            </main>
   
<script>
	$(document).ready(function(){
	
		/* 고장난 좌석리스트 읽고 블러처리 해주기 */
		/* console.log("고장난 좌석 리스트 : " + $($("#seat").data("bkSeatLists")));
		 */
		 //let bkLists = $("#seat").data("bkLists");
		
		 //let ${bkLists} = "${bkLists}";
		/** 
		  let bkLists = ${bkLists}; 
		 for( int i=0; i < bkLists.size(); i++ ){
			 let ${bkLists.get(i)} = "${bkLists.get(i)}";
		 }
		 
		 
		 bkLists = JSON.stringify(bkLists);
		 console.log("고장난 좌석 리스트: " + bkLists);
		 **/
		
////////////////////////////////////////////////////////////////
		let bkList = [];
		$("#seat label").on("click", function(){
			//console.log($(this).closest('div').find('input'));
			let checkbox = $(this).closest('div').find('input');
			
			<!-- 클릭한 label과 연결된 가장 가까운 div 요소 찾고, 그 안의 input 요소 checked 속성을 토글시킴 -->
			checkbox.prop('checked', function(i, currentValue) {
				return !currentValue;
			});
			
			let seatValue = "${dto.list[row]}${col}";
			<!-- 체크된 좌석 class='check' 넣고 그 class만 버튼 색깔 변경 -->
			if (checkbox.prop('checked')) {
				$(this).addClass('check');
				//
				bkList = bkList.concat($(this).closest('.eachSeat').find('input').attr("data-bkSeat"));
				
			} 
			else {
		        $(this).removeClass('check');
		        bkList = bkList.filter(item => item !== seatValue);
		    }
			
			//console.log(bkList);

			//console.log($(this).closest('.eachSeat').find('input').attr("data-bkSeat"));

		});
		
		scrNo = $("#seat p").data("scr_no");
		$("#revise-seats-btn").on("click", function(){
			$.ajax({
    			url:"seat-manage.hy",
    			type:"POST",
    			dataType: "json", 
    		    data: {
    		        scr_no: scrNo,
    		        bkList: JSON.stringify(bkList)
    		    },
    			error:function(xhr, status, msg){
					alert("에러 : ");
				},
    			success: function(result){
    				if(result==1){
    					alert("좌석 수정이 완료되었습니다. ");
        				location.href="screen-manage.hy?scr_no="+scrNo;
    				}
    				else{
    					alert("좌석 수정을 성공적으로 처리하지 못하였습니다. ");
    				}
    				
    			}	
    		});//end ajax
		}); 
		
		
	});
</script>
    
    
          
<%@ include file="../../inc/admin_footer.jsp"%>