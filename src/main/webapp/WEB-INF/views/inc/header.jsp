<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <!-- lib -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery.mb.YTPlayer/3.3.8/css/jquery.mb.YTPlayer.min.css">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mb.YTPlayer/3.3.8/jquery.mb.YTPlayer.min.js"></script>

  <!-- base -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/font.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/reset.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/component.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/layout.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/css.css">
  <script src="${pageContext.request.contextPath}/resources/assets/js/common.js"></script>
  
  <!-- page -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/board.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/movie.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/main.css">
  <title>무빙</title>
</head>
<body>
   <header id="header" class="header">
     <div class="header__inner">
       <h1 class="logo"><a href="main.ks" class="logo__img" title="메인으로 이동"><span class="blind">무빙</span></a></h1>

       <nav class="gnb__wrap">
         <h2 class="blind">주메뉴</h2>
         <ul id="gnb" class="gnb">
           <!-- 링크 -> a / 2뎁스 버튼 -> button:button -->
           <li class="gnb__item">
             <c:set var="user_no" value="1"/>
             <c:choose>
             <c:when test="${user_no!=null }"><a href="reservation_view.ks" class="gnb__link"><span>예매</span>
             </a></c:when>
             <c:when test="${user_no==null }"><a href="main.ks" class="gnb__link" id="res"><span>예매</span>
             </a></c:when>
             </c:choose>
           </li>
           <li class="gnb__item"><a href="movie.as" class="gnb__link">
             <span>영화</span>
           </a></li>
           <li class="gnb__item"><a href="#" class="gnb__link">
             <span>영화관</span>
           </a></li>
           <!-- TODO: 스낵 진행시 주석제거 -->
           <!-- <li class="gnb__item"><a href="#" class="gnb__link">
             <span>스낵</span>
           </a></li> -->
           <li class="gnb__item"><a href="notice.as" class="gnb__link">
             <span>공지사항</span>
           </a></li>
           <li class="gnb__item">
             <button type="button" class="gnb__link">
               <span>마이페이지</span>
             </button>
             <ul class="gnb__2depth">
               <li class="gnb__2depth-item">
                 <a href="my_reservation.ks" class="gnb__2depth-link">
                   <span>예매/취소 내역</span>
                 </a>
               </li>
               <li class="gnb__2depth-item">
                 <a href="#" class="gnb__2depth-link">
                   <span>회원정보수정</span>
                 </a>
               </li>
             </ul>
           </li>
         </ul>
       </nav>

       <div class="header-util">
         <ul class="header-util__list">
           <!-- [D] 비로그인 상태 시 노출 -->
           <li class="header-util__item">
             <a href="#" class="header-util__link">
               <span>로그인</span>
             </a>
           </li>
           <li class="header-util__item">
             <a href="#" class="header-util__link">
               <span>회원가입</span>
             </a>
           </li>
           <!-- [D] 로그인 상태 시 노출 -->
           <!-- <li class="header-util__item">
             <button type="button" class="header-util__link">
               <span>로그아웃</span>
             </button>
           </li> -->
         </ul>
       </div>
     </div>
   </header>