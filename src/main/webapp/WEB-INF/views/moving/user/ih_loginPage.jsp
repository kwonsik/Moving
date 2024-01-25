<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.sql.*"%>
<%@ include file="../../inc/header.jsp"%>
<div class="ih__loginPage">
	<form action="loginBtn.ih" method="post">
		<h2 class="h2">회원로그인</h2>
		<fieldset>
		
			<div class="inputType">
				<label for="id">아이디</label>
				<input type="text" name="id" id="id" placeholder="아이디를 입력해주세요." <c:if test="${not empty id}">value="${id}"</c:if> />
			</div>
			
			<div class="inputType">
				<label for="password">비밀번호</label>
				<input type="password" name="password" id="password" class="#" placeholder="비밀번호를 입력해주세요." />
			</div>
			
			<div class="remember">
				<input type="checkbox" name="remember" id="remember" <c:if test="${rememberId != ''}">checked</c:if> />
				<label for="remember">아이디저장</label>
			</div>
			
			<input type="submit" value="로그인" class="loginBtn" />
			
			<div class=find>
				<p> <a href="findIdView.ih">ID/PW찾기</a> </p>
				<p> <a href="joinForm.ih">회원가입</a> </p>
			</div>
			
			<div class="socialLogin">
				<p class="tit"><strong>간편로그인</strong></p>
				<p> <a href="#" class="#"><img alt="#" src="${pageContext.request.contextPath}/resources/assets/images/ih/kakao_4.png" style="width:250px;" /> </a> </p>
			</div>
			
			<div class="under">
				<p>무빙 사이트에 간편로그인계정을 연결한 경우에만 <span>간편로그인</span>이 가능합니다.</p>
			</div>
			
		</fieldset>
	</form>
<script>
    window.onload = function() {
    	//탈퇴신청성공
        <c:if test="${not empty joinSuccess}"> alert("${joinSuccess}"); </c:if>
    };
</script>
</div>
<%@include file="../../inc/footer.jsp"%>