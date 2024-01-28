<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.sql.*"%>
<%@ include file="../../inc/header.jsp"%>
<div class="ih_preMyUpdatePage">
	<form action="checkpass.ih" method="post" id="preUpdate">		<div class="head">
			<img alt="lock" src="${pageContext.request.contextPath}/resources/assets/images/ih/lock.png">
			<pre>회원님의 정보를 안전하게 보호하기 위해<br/>비밀번호를 다시 한번 확인해주세요</pre>
		</div>
		<div class="#">
			<label for="user_id">아이디</label>
			<input type="text" id="user_id" name="user_id" value="${user_id}" readonly/>
		</div>
		<div class="input-group">
			<label for="password">비밀번호</label>
			<input type="password" id="password" name="password" placeholder="비밀번호를 입력해주세요" required>
			<p id="chechPasswordResult"><p>
		</div>
		<div class="btn-group">
			<input type="button" class="btn btn-danger" value="&nbsp돌아가기" id="backButton" />
			<button type="submit" class="submitBtn">확인&nbsp&nbsp&nbsp</button>
			
		</div>
	</form>
</div>
<script>
//돌아가기버튼
window.onload = function() {
document.getElementById('backButton').addEventListener('click', function() { history.back();});
//비밀번호 검증실패
<c:if test="${not empty loginError}"> alert("${loginError}"); </c:if>
};
</script>
<%@include file="../../inc/footer.jsp"%>