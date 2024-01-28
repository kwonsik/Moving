<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.sql.*"%>
<%@ include file="../../inc/header.jsp"%>
<div class="container panel panel-info" style="margin-top:150px;">
	<h3 class="panel-heading">Welcome, ${sessionScope.user_id}</h3>
	<a href="joinForm.ih" class="btn btn-danger">회원가입페이지</a>
	<a href="loginPage.ih" class="btn btn-danger">로그인페이지</a>
	<a href="preMyUpdatePage.ih?user_id=${user_id}" class="btn btn-danger">회원정보수정입장</a>
	<a href="joinForm.ih" class="btn btn-danger">x</a>
	<a href="result.ih" class="btn btn-danger">로그인세션결과페이지</a>
	<a href="logout.ih" class="btn btn-danger">로그아웃</a>
</div>
<%@ include file="../../inc/footer.jsp"%>