<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <!-- lib -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

  <!-- base -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/font.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/reset.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/component.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/layout.css">
  <script src="${pageContext.request.contextPath}/resources/assets/js/common.js"></script>
  
  <!-- page -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/main.css">

	<!-- ih start -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/ih.css">
	<script src="${pageContext.request.contextPath}/resources/assets/js/ih_alert.js"></script>
	<!-- ih end -->

<title>무빙</title>
</head>
<body>
  <!-- root -->
  <div id="root">
    <header id="header" class="header">
      <div class="header__inner">
        <h1 class="logo"><a href="#" class="logo__img" title="메인으로 이동"><span class="blind">무빙</span></a></h1>

        <nav class="gnb__wrap">
          <h2 class="blind">주메뉴</h2>
          <!-- TODO: 2depth가 열렸을 경우, is-expand 클래스 추가 -->
          <ul id="gnb" class="gnb">
            <li class="gnb__item"><a href="#" class="gnb__link">
              <span>예매</span>
            </a></li>
            <li class="gnb__item"><a href="#" class="gnb__link">
              <span>영화</span>
            </a></li>
            <li class="gnb__item"><a href="#" class="gnb__link">
              <span>영화관</span>
            </a></li>
            <li class="gnb__item"><a href="#" class="gnb__link">
              <span>공지사항</span>
            </a></li>
            <li class="gnb__item is-active">
              <button type="button" class="gnb__link" >
                <span>마이페이지</span>
              </button>
              <ul class="gnb__2depth">
                <li class="gnb__2depth-item is-active">
                  <a href="#" class="gnb__2depth-link">
                    <span>예매/취소 내역</span>
                  </a>
                </li>
                <li class="gnb__2depth-item">
                  <a href="preMyUpdatePage.ih?user_id=${user_id}" class="gnb__2depth-link">
                    <span>회원정보수정</span>
                  </a>
                </li>
              </ul>
            </li>
          </ul>
        </nav>

        <div class="header-util">
			<ul class="header-util__list">
			    <c:if test="${usertp_name == '삭제된회원'}">
			        <script>
			            alert("탈퇴한 회원입니다.");
			            window.location.href = "logout.ih"; // 로그아웃 처리 URL로 이동
			        </script>
			    </c:if>
			
			    <!-- 관리자인 경우 관리자 페이지와 로그아웃 링크 표시 -->
			    <c:if test="${usertp_name == '관리자'}">
			        <li>${usertp_name} 님 환영합니다!</li>
			        <li class="header-util__item">
			            <a href="adminPage.ih">관리자페이지</a>
			        </li>
			        <li class="header-util__item">
			            <a href="logout.ih">로그아웃</a>
			        </li>
			    </c:if>
			
			    <!-- 로그인하지 않은 경우 로그인과 회원가입 링크 표시 -->
			    <c:if test="${user_id == null}">
			        <li class="header-util__item">
			            <a href="loginPage.ih" class="header-util__link">로그인</a>
			        </li>
			        <li class="header-util__item">
			            <a href="joinForm.ih" class="header-util__link">회원가입</a>
			        </li>
			    </c:if>
			
			    <!-- 일반 사용자인 경우 로그아웃 링크만 표시 -->
			    <c:if test="${user_id != null and usertp_name != '관리자' and usertp_name != '삭제된회원'}">
			        <li>${user_nick}님 환영합니다!</li>
			        <li class="header-util__item">
			            <a href="logout.ih">로그아웃</a>
			        </li>
			    </c:if>
          </ul>
        </div>
      </div>
    </header>
    <!-- main -->
    <main id="main" class="main">
      <h2 class="blind">메인 컨텐츠</h2>
      <div id="container" class="container">