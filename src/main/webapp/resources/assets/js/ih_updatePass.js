 window.addEventListener('load', function(){   
    document.getElementById('myUpdatePass').addEventListener('submit', function(event) {
		///////////////////공백검사 유효성검사/////////////////////////
        let updatePassword = document.getElementById("updatePassword");
        let updatePasswordConfirm = document.getElementById('updatePasswordConfirm');
        let pwcriteria = /^(?:(?=.*[A-Za-z])(?=.*\d)|(?=.*[A-Za-z])(?=.*[^A-Za-z0-9])|(?=.*\d)(?=.*[^A-Za-z0-9]))[A-Za-z\d\W_]{8,16}$/;
		let checkOriginalPasswordSpan = document.querySelector("#checkOriginalPassword span");
		let password = document.getElementById("password");

	///////////////////공백검사 유효성검사/////////////////////////
		if (checkOriginalPasswordSpan.textContent.includes("비밀번호를 정확하게 입력해주세요.")) {
		    alert("현재 비밀번호를 확인해주세요");
			event.preventDefault();
			password.focus();
            return false;
		}
        // 비밀번호 유효성 검사
        if (!pwcriteria.test(updatePassword.value)) {
            alert("비밀번호가 요구 사항을 충족하지 않습니다.");
            updatePassword.focus();
            event.preventDefault();
            return false;
        }
        // 비밀번호 공백검사
        if(updatePassword.value == ""||updatePasswordConfirm.value == ""||password==""){
            alert("빈칸을 확인해주세요");
            updatePassword.focus();
            event.preventDefault();
            return false;
        }
        // 비밀번호 일치 검사
        if (updatePassword.value !== updatePasswordConfirm.value) {
            alert("비밀번호가 일치하지 않습니다.");
            updatePasswordConfirm.focus();
            event.preventDefault();
            return false;
        }
	///////////////////공백검사 유효성검사/////////////////////////
	});
});
$(document).ready(function() {

    // 비밀번호 유효성 검사
    $("#updatePassword").on("keyup", function() {
        var password = $(this).val();
        var regex = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-]|.*[0-9]).{8,16}$/;
        validateField(password, regex, $("#passwordCriteria"));
    });

    // 필드 유효성 검사 함수
    function validateField(value, regex, criteriaElement) {
        if (regex.test(value)) {
            criteriaElement.css("color", "blue").text("위 조건을 만족합니다.");
        } else {
            criteriaElement.css("color", "red").text("위 조건을 만족하지않습니다.");
        }
    }
    
    // 비밀번호 일치 검사
    $("#updatePasswordConfirm").on("keyup", function() {
        let password = $("#updatePassword").val();
        let confirmPassword = $(this).val();
        let passduplication = $("#passduplication");
        
        if (password === confirmPassword) {
            passduplication.css("color", "blue").text("비밀번호가 일치합니다.");
        } else {
            passduplication.css("color", "red").text("비밀번호가 일치하지 않습니다.");
        }
    });
    
	// 비밀번호 변경페이지의 원래비밀번호 체크 ajax 
	$("#password").on("blur", function() {
	    $.ajax({
	        url: "originalPasswordCheck.ih",
	        type: "get",
	        dataType: "text",
	        data: { "id": $("#id").val(),
	        		"password": $("#password").val()
	         },
	        success: function(data) {
	            $("#checkOriginalPassword").html(data);
	        },
	        error: function(xhr, textStatus, errorThrown) {
	            $("#checkOriginalPassword").html(textStatus + "(HTTP-" + xhr.status + ")");
	        }
	    });
	});
});


