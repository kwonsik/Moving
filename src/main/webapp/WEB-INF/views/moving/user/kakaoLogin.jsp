<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>KAKAO LOGIN</title>
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
   <div class="container panel panel-info">
      <h3 class="panel-heading"></h3>

      <pre>
   1. 카카오로그인 설정 
   * 동의항목
   * REST API 키   d00005ed65e673d8957a8eb42c7007d5
   * Redirect URI http://localhost:8080/jsp_basic/kakao
   
   2. STEP1. 인가코드 받기 https://developers.kakao.com/docs/latest/ko/kakaologin/rest-api
      인증 : ID, 비밀번호 - 사용자신원확인
      인가 : 사용자개인정보같은 자원에 대한 접근권한 - 동의화면 항목
      Redirect URI
      
      준비 : GET   https://kauth.kakao.com/oauth/authorize
      https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=d00005ed65e673d8957a8eb42c7007d5&redirect_uri=http://localhost:8080/jsp_basic/kakao
      
      
   3. STEP2. 토큰받기
       Redirect URI - 인가코드를 토큰으로 줌
      
      POST   https://kauth.kakao.com/oauth/token
      Header > Content-type   Content-type: application/x-www-form-urlencoded;charset=utf-8
      Body >
      - curl -v -X POST "https://kauth.kakao.com/oauth/token" \
             -H "Content-Type: application/x-www-form-urlencoded" \
             
             "?grant_type=authorization_code"+
             "&client_id=" + client_id+
             "&redirect_uri=" + redirect_uri+
             "&code="+code;
   4. STEP3. 사용자 로그인처리
      사용자정보 가져오기
      GET/POST   https://kapi.kakao.com/v2/user/me
      "https://kapi.kakao.com/v2/user/me"
        "Authorization: Bearer GQ0XQyBS3k2qsPL8z_CvzZxmR5_cBJMuPGYKPXPsAAABjJAGW0dUdd9ffL_GXA"
        GQ0XQyBS3k2qsPL8z_CvzZxmR5_cBJMuPGYKPXPsAAABjJAGW0dUdd9ffL_GXA
        
        POST
        curl -v -X POST "https://kapi.kakao.com/v2/user/me" \
       "Content-Type: application/x-www-form-urlencoded" \
       "Authorization: Bearer ${ACCESS_TOKEN}" \
   </pre>

   <p>
   <a href="https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=d00005ed65e673d8957a8eb42c7007d5&redirect_uri=http://localhost:8080/jsp_basic/kakao" title="KAKAO LOGIN">
   <img src="img/kakao_login.png" alt="login" ></a>
   </p>
   </div>

</body>
</html>