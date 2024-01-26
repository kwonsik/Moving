<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.sql.*"%>
<%@ include file="../../inc/admin_header.jsp"%>
<script>
$(function(){ readTotalUser(); });
function readTotalUser(){
    console.log('1출력완료: ' + 'readTotalUser');
	    $.ajax({
	        url:"readTotalUser.admin",
	        type:"GET", 
	        dataType:"xml",
	        success: userListResult,
	        error: function(xhr, status, msg){ alert(status + "/" + msg); }
	    });
	}
function userListResult(xml) {
    console.log('userListResult');
	console.log(xml);
	$(".usertable tbody").empty();
    $(xml).find("user>user").each(function(idx, user) {
    	$("<tr>")
		.append(  $("<td>").html(   $(user).find("user_no").text()))
		.append(  $("<td>").html(   $(user).find("usertp_no").text()))
		.append($("<td>").html("<a href='MyUpdatePageView.ih?user_id=" + $(user).find("user_id").text() + "'>" + $(user).find("user_id").text() + "</a>"))
		.append(  $("<td>").html(   $(user).find("user_name").text()))
		.append(  $("<td>").html(   $(user).find("user_nick").text()))
		.append(  $("<td>").html(   $(user).find("user_mail").text()))
		.append(  $("<td>").html(   $(user).find("user_age").text()))
		.append(  $("<td>").html(   $(user).find("user_phone").text()))
		.append(  $("<td>").html(   $(user).find("user_kakao").text()))
		.append(  $("<td>").html(   $(user).find("user_crtdate").text()))
		.append(  $("<td>").html(   $(user).find("user_ip").text()))
		.append($("<td>").html("<input type='checkbox' name='user_id' value='" + $(user).find("user_id").text() + "'>"))
		.appendTo(".usertable tbody");
	});
}
$(document).ready(function() {
    $("#deleteSelected").click(function() {
        $("input[name='deleteUser']:checked").each(function() {
            $(this).closest("tr").remove();
        });
    });
});

</script>
<main id="content">
<div class="page">
<h2>회원 관리</h2>
<div class="sub_content">
<div class="ih_adminUser">

<div class="panel-warning">
<form action="adminDeleteUser.admin" method="POST">
 	<table  class="table table-striped usertable">
		<thead>
			<tr>
				<th scope="col">번호</th>
				<th scope="col">등급</th>
				<th scope="col">ID</th>
				<th scope="col">이름</th>
				<th scope="col">별명</th>
				<th scope="col">이메일</th>
				<th scope="col">생년월일</th>
				<th scope="col">전화번호</th>
				<th scope="col">카카오코드</th>
				<th scope="col">가입날짜</th>
				<th scope="col">가입IP</th>
				<th scope="col">유저탈퇴</th>
			</tr>
		</thead>
		<tbody>
		
		</tbody>
 		</table>
 		<div class="cm_btns">
			<button id="deleteSelected" class="btn btn-danger">선택 삭제</button>
		</div>
</form>
 	</div>	
</div>
</div>
</div>
</main>
<%@ include file="../../inc/admin_footer.jsp"%>