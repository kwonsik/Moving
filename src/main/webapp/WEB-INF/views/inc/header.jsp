<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
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
            <!-- TODO: is-active 선택된 메뉴 li에 클래스 추가
            확인용 클래스 : 마이페이지 -->
            <!-- 링크 -> a / 2뎁스 버튼 -> button:button -->
            <!-- 임시 관리자 페이지 이동 -->
            <li class="gnb__item"><a href="admin.shj" class="gnb__link">
              <span>관리자</span>
            </a></li>
            <li class="gnb__item"><a href="#" class="gnb__link">
              <span>예매</span>
            </a></li>
            <li class="gnb__item"><a href="#" class="gnb__link">
              <span>영화</span>
            </a></li>
            <li class="gnb__item"><a href="main.shj" class="gnb__link">
              <span>영화관</span>
            </a></li>
            <!-- TODO: 스낵 진행시 주석제거 -->
            <!-- <li class="gnb__item"><a href="#" class="gnb__link">
              <span>스낵</span>
            </a></li> -->
            <li class="gnb__item"><a href="#" class="gnb__link">
              <span>공지사항</span>
            </a></li>
            <li class="gnb__item">
              <button type="button" class="gnb__link">
                <span>마이페이지</span>
              </button>
              <ul class="gnb__2depth">
                <!-- TODO: is-active 선택된 메뉴 li에 클래스 추가
                확인용 클래스 : first-child -->
                <li class="gnb__2depth-item is-active">
                  <a href="#" class="gnb__2depth-link">
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