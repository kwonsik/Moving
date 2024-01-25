<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.sql.*"%>
<%@ include file="inc/header.jsp"%>
<div class="container panel panel-info" style="margin-top:150px;">
   <h3 class="panel-heading">성공페이지</h3>
   <a href="javascript:history.back();">돌아가기</a>
   <a href="index.ih" class="btn btn-danger">인덱스페이지로</a>
   
	<div class="container panel panel-info">
		<c:if test="${not empty sessionScope.user_id}">
			<p>내장객체로받기-정보전달</p>
		    <p><span>user_id세션 :</span> ${sessionScope.user_id} </p>
		    <p><span>user_no세션 :</span> ${sessionScope.user_no} </p>
		    <p><span>user_nick세션 :</span> ${sessionScope.user_nick} </p>
		    <p><span>user_age세션 :</span> ${sessionScope.user_age} </p>
		    <p><span>user_name세션 :</span> ${sessionScope.user_name} </p>
		    <p><span>user_mail세션 :</span> ${sessionScope.user_mail} </p>
		    <p><span>user_phone세션 :</span> ${sessionScope.user_phone} </p>
		    <p><span>usertp_name세션 :</span> ${sessionScope.usertp_name} </p>
		    <p>모델로받기-뷰에서쓰는법</p>
		    <p><span>user_id세션 :</span> ${user_id} </p>
		    <p><span>user_no세션 :</span> ${user_no} </p>
		    <p><span>user_nick세션 :</span> ${user_nick} </p>
		    <p><span>user_age세션 :</span> ${user_age} </p>
		    <p><span>user_name세션 :</span> ${user_name} </p>
		    <p><span>user_mail세션 :</span> ${user_mail} </p>
		    <p><span>user_phone세션 :</span> ${user_phone} </p>
		    <p><span>usertp_name세션 :</span> ${usertp_name} </p>
		</c:if>
		<c:if test="${empty sessionScope.user_id}">
		    <script>alert('세션없음'); location.href='index.ih';</script>
		</c:if>
    </div>
</div>

<%@ include file="inc/footer.jsp"%>