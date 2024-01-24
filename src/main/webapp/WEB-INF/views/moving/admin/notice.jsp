<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="../../inc/admin_header.jsp" %>

<c:set var="total" value="${list.size()}" />
<h2 class="blind">본문</h2>
<div class="as_inner inner">
   <h3>공지사항 목록</h3>
   <div class="as_board-list">
	   <div class="search-box">
	      <p class="table-summary">
	         총 ${total}개의 게시글
	         <c:if test="false">
	         		<span> | 검색된 항목: 10편</span>
	         </c:if>
	      </p>
	      
	      <div class="search-group">
	         <label>
	            <input type="text" class="form-control" id="as_sch-key" placeholder="제목/내용을 입력해주세요.">
	         </label>
	         <button type="button" class="btn btn-primary">검색</button>
	      </div>
	   </div>
	   
	   <table class="table table-hover as_table as_list-table">
	      <colgroup>
	         <col class="col4">
	         <col class="col4">
	         <col class="colA">
	         <col class="col4">
	         <col class="col8">
	         <col class="col4">
	      </colgroup>
	      <thead>
	         <tr>
         	    <th scope="col"><label><input type="checkbox" value="allChk" class="all-check"></label></th>
	            <th scope="col">No</th>
	            <th scope="col">제목</th>
	            <th scope="col">작성자</th>
	            <th scope="col">작성일</th>
	            <th scope="col">조회수</th>
	         </tr>
	      </thead>
	      <tbody>
			<c:choose>
				<c:when test="${list.size() > 0}">
					<c:forEach var="dto" items="${list}" varStatus="status">
					<tr>
						<td><label><input type="checkbox" value="${dto.board_no}"></label></td>
						<td>${total-status.index}</td>
						<td><a href="${pageContext.request.contextPath}/noticeDetail.admin?board_no=${dto.board_no}">${dto.b_title}</a></td>
						<td>${dto.user_no==0?"관리자":"Unknown"}</td>
						<td>${dto.b_crtdate.split(' ')[0]}</td>
						<td>${dto.b_hit}</td>
					</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
					   <td colspan="8" class="is-empty">
					      <p>등록된 게시글이 없습니다.</p>
					   </td>
					</tr>
				</c:otherwise>
			</c:choose>
	      </tbody>
	   </table>
	
	 <div class="as_inner-footer">
	    <div class="pagination-container">
	     <ul class="pagination">
	        <li class="previous"><a href="#">이전</a></li>
	        <li class="active"><a href="#">1</a></li>
	        <li><a href="#">2</a></li>
	        <li><a href="#">3</a></li>
	        <li><a href="#">4</a></li>
	        <li><a href="#">5</a></li>
	        <li class="next"><a href="#">다음</a></li>
	     </ul>
	    </div>
	
	    <div class="btns">
	       <button type="button" class="btn btn-danger btn-delete">선택 삭제</button>
	       <a href="${pageContext.request.contextPath}/noticeWrite.admin" class="btn btn-primary">글 작성</a>
	    </div>
	 </div>
	</div>
</div>

<script>
$(function(){
	$(".btn-delete").on("click", function(){
		deleteNotice();
	});
	
    // checkbox
    $(document).on("change", ".as_list-table input[type='checkbox']", function () {
       let totalCheckboxes = $('.as_list-table input[type="checkbox"]:not(.all-check)').length;
       let checkedCheckboxes = $('.as_list-table input[type="checkbox"]:checked:not(.all-check)').length;

       // 모든 하위 체크박스가 체크되어 있으면 .all-check도 체크
       $('.as_list-table .all-check').prop('checked', totalCheckboxes === checkedCheckboxes);

       saveSelectedNotice(); // 체크박스 상태가 변할 때마다 호출
    });

    // allchk
    $('.as_list-table .all-check').change(function () {
       let isChecked = $(this).prop('checked');

       // .as_list-table 내 하위 체크박스 상태를 .all-check 와 맞춤
       $('.as_list-table input[type="checkbox"]').prop('checked', isChecked);
    });
});

// 선택한 게시글을 저장하는 함수
function saveSelectedNotice() {
	selectedNotices = [];

   $(".as_list-table input[type='checkbox']:checked").each(function () {
      let value = $(this).val();

      if (value == 'allChk') {
         return;
      } else {
    	  selectedNotices.push(parseInt(value, 10));
      }
   });
}

// 게시글 삭제
function deleteNotice() {
    if (selectedNotices.length > 0) {
        $.ajax({
            type: "POST",
            contentType: "application/json",
            url: "${pageContext.request.contextPath}/noticeDelete.admin",
            data: JSON.stringify(selectedNotices),
            dataType: "text",
            success: function (data) {
                if (data === "success") {
                	let restult = confirm("선택한 게시글을 삭제하시겠습니까?");
                    if(restult) {
                    	alert("게시글이 삭제되었습니다.");
                    	location.reload();
                   	}
                } else {
                    alert("게시글 삭제 중 오류가 발생했습니다.");
                }
            },
            error: function (xhr, status, msg) {
                alert(status + "/" + msg);
            }
        });
    } else {
        alert("삭제할 게시글를 선택해주세요!");
    }
}
</script>

<%@ include file="../../inc/admin_footer.jsp" %>