<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.sql.*"%>
<%@ include file="inc/header.jsp"%>
<div class="ih__myUpdatePage">
<form action="myUpdateGo.ih" method="post" class="update" id="update">
	<div class="title"> <h2>회원정보</h2> </div>
		<fieldset>
			<div class="form-class">	
				<label for="id" >아이디</label> 
				<input type="text" id="id" name="id" value="${dto.user_id}" readonly />
			</div>
			<div class="form-class">
				<label for="name">이름</label>
				<input type="text" id="name" name="name" value="${dto.user_name}" readonly />
			</div>
			<div class="form-class">
				<label for="nickname">닉네임</label> 
            	<input type="text" id="nickname" name="nickname" value="${dto.user_nick}" readonly />
            <div class="form-class">
            </div>
            	<label for="nickname2" class="blind">닉네임</label> 
            	<input type="text" id="nickname2" name="nickname2" placeholder="변경할 닉네임을 적어주세요" />
				<p id="nicknameResult" class="checkedResult"> 2~8자 이내 한글,영문대소문자,숫자 사용가능<br/></p>
			</div>
			<div class="form-class">
				<label for="email">이메일</label>
            	<input type="email" id="email" name="email" value="${dto.user_mail}" readonly />
            </div>
            <div class="form-class">
            	<label for="email" class="blind">변경할 이메일</label>
            	<input type="email" id="email2" name="email2" placeholder="변경할 이메일을 적어주세요"/>
				<input type="button" class="btn btn-success" id="sendCode" value="코드발송" />
				<p id="emailResult" class="checkedResult"> </p>
			</div>
			<div class="form-class">
				<label for="inputEmail" class="myhidden">인증코드입력</label>
				<input type="text" id="inputEmail" class="inputEmail" placeholder="인증코드를 입력해주세요." />
				<input type="text" id="timeLimit" style="color:red;" readonly/>
				<input type="text" id="emailCode" class="blind" value="" />
			</div>
			<div class="form-class">
				<label for="phonenumber">휴대폰번호</label>
				<input type="tel" id="phonenumber" name="phonenumber" value="${dto.user_phone}" readonly />
            <div class="form-class">
            </div> 
            	<label for="phonenumber2" class="blind">변경할 번호</label>
				<input type="tel" id="phonenumber2" name="phonenumber2" placeholder="변경할 휴대폰번호를 적어주세요(-제외)"/>
			</div>
			<div class="form-class">
				<label for="age">생년월일</label>
				<input type="text" id="age" name="age" value="${dto.user_age}" disabled />
			</div>
			<a href="MyUpdatePassView.ih" class="btn btn-info">비밀번호변경</a>
			<div class="button-class">
				<a href="javascript:history.go(-2);" class="btn btn-danger">돌아가기</a>
				<input type="submit" class="btn btn-primary" value="정보수정" />
			</div>
		</fieldset>
	</form>	
	
<!-- 탈퇴신청을안한 회원 -->
<c:if test="${dto.usertp_no != '4'}">
    <form action="myDelete.ih?user_id=${dto.user_id}" method="GET">
    	<input type="text" name="user_id" value="${dto.user_id}" class="blind">
        <input type="submit" class="deleteAndCancleBtn" value="회원탈퇴">
    </form>
</c:if>

<!-- 탈퇴신청을한 회원 -->
<c:if test="${dto.usertp_no == '4'}">
    <form action="myDeleteCancle.ih?user_id=${dto.user_id}" method="GET">
    	<input type="text" name="user_id" value="${dto.user_id}" class="blind">
        <input type="submit" class="deleteAndCancleBtn" value="회원탈퇴취소">
    </form>
</c:if>

<script>
    window.onload = function() {
    	//탈퇴신청성공
        <c:if test="${not empty myDeleteSuccess}"> alert("${myDeleteSuccess}"); </c:if>
        //탈퇴신청취소성공
        <c:if test="${not empty myDeleteUserCancleSuccess}"> alert("${myDeleteUserCancleSuccess}"); </c:if>
        //개인정보변경성공
        <c:if test="${not empty updateSuccess}"> alert("${updateSuccess}"); </c:if>
        //개인정보변경실패
        <c:if test="${not empty updateFail}"> alert("${updateFail}"); </c:if>
        //비밀번호변경성공
        <c:if test="${not empty updatePassSuccess}"> alert("${updatePassSuccess}"); </c:if>
    };
</script>

</div>
<c:set var="myDeleteSuccess" value="${myDeleteSuccess}" />
<c:set var="updateSuccess" value="${updateSuccess}" />
<c:set var="updateFail" value="${updateFail}" />
<c:set var="myDeleteUserCancleSuccess" value="${myDeleteUserCancleSuccess}" />

<script src="${pageContext.request.contextPath}/resources/assets/js/ih_update.js"></script>
<%@include file="inc/footer.jsp"%>