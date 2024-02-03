<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="java.math.BigInteger"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.security.SecureRandom"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.sql.*"%>
<%@ include file="../../inc/header.jsp"%>
<main id="main" class="main">
      <h2 class="blind">메인 컨텐츠</h2>
      <div id="container" class="container">
<div class="ih__loginPage">
	<form action="loginBtn.ih" method="post" id="loginForm">
		<h2 class="h2">회원로그인</h2>
		<fieldset>
		
			<div class="inputType">
				<label for="id">아이디</label>
				<input type="text" name="id" id="id" placeholder="아이디를 입력해주세요." <c:if test="${not empty id}">value="${id}"</c:if> />
			</div>
			
			<div class="inputType">
				<label for="password">비밀번호</label>
				<input type="password" name="password" id="password" class="#" placeholder="비밀번호를 입력해주세요." />
				<p id="userCheckResult"></p>
			</div>
			
			<div class="remember">
				<input type="checkbox" name="remember" id="remember" <c:if test="${rememberId != ''}">checked</c:if> />
				<label for="remember">아이디저장</label>
			</div>
			
			<input type="submit" value="로그인" class="loginBtn" />
			
			<div class="find">
				<p> <a href="findIdView.ih">ID/PW찾기</a> </p>
				<p> <a href="joinForm.ih">회원가입</a> </p>
			</div>
			
			<div class="socialLogin">
				<p class="tit"><strong>간편로그인</strong></p>

				<!-- 카카오 -->
				<p> <a href="https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=d00005ed65e673d8957a8eb42c7007d5&redirect_uri=http://localhost:8080/jsp_basic/kakao" title="KAKAO LOGIN"> <img src="${pageContext.request.contextPath}/resources/assets/images/ih/kakao_4.png" alt="login" style="width:250px; height: 42px;" /></a> </p>
				
				<%
				    // 클라이언트 ID와 리디렉션 URI를 설정
				    String clientId = "HA45SpjNLNnGrNT2Hw0w";
				    String redirectURI = URLEncoder.encode("http://localhost:8080/moving/prepareLogin.ih", "UTF-8");
				    SecureRandom random = new SecureRandom();
				    String state = new BigInteger(130, random).toString(32);
				    session.setAttribute("state", state);
//				    String code = request.getParameter("code");
//				    session.setAttribute("code", code);
										    
				    // 네이버 로그인 URL을 생성
				    String naverAuthURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code"
				        + "&client_id=" + clientId
				        + "&redirect_uri=" + redirectURI
				        + "&state=" + state;
				%>
				<!-- 네이버 로그인 버튼 -->
				<p> <a href="<%= naverAuthURL %>"> <img alt="네이버 로그인 버튼" src="${pageContext.request.contextPath}/resources/assets/images/ih/naver_1.png" style="width:250px; height: 42px;" /> </a> </p>
			</div>
				
			<div class="under">
				<p>무빙 사이트에 간편로그인계정을 연결한 경우에만 <span>간편로그인</span>이 가능합니다.</p>
			</div>
		</fieldset>
	</form>
</div>
</div>
</main>
<%@include file="../../inc/footer.jsp"%>
<script>
$(function() {
	//로그인검증아작스
    var form = $("#loginForm");
    form.on("submit", function(event) {
        event.preventDefault();
        $.ajax({
            url: "userCheck.ih",
            type: "POST",
            dataType: "text",
            data: {
                "id": $("#id").val(),
                "password": $("#password").val()
            },
            success: function(data) {
                if (data === "pass") {
                    form[0].submit();
                } else {
                    $("#userCheckResult").html(data);
                }
            },
            error: function(xhr, textStatus, errorThrown) {
                $("#userCheckResult").html(textStatus + "(HTTP-" + xhr.status + ")");
            }
        });
    });
});
</script>