<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../inc/header.jsp"%>
<style>
.mic {
	width: 60px;
	height: 60px;
	position: fixed;
	right: 5%;
	bottom: 5%;
}
.mic:hover{
	cursor: pointer;
}
.mic img {
	width: 60px;
	height: 60px;
}
</style>
<div class="mic">
	<img
		src="${pageContext.request.contextPath}/resources/assets/images/common/mic.jpg"
		alt="음성인식" />
</div>
<script>
	$(function() {
		$(".mic").on("click", function() {
			$.ajax({
				type : "GET",
				url : "stt.ks",
				dataType : 'json',
				async : false,
				success : function(data) {

					let result = data.return_object.recognized;

					if (result.includes("예매")) {

						location.href = 'reservation_view.ks';
					} else {
						alert("다시 말해주세요");
					}

				},
				error : function(request, status, error) {
					console.log("code: " + request.status)
					console.log("message: " + request.responseText)
					console.log("error: " + error);
				}
			});
		});
	});
</script>
<%@ include file="../../inc/footer.jsp"%>