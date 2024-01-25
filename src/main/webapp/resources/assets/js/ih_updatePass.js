 window.addEventListener('load', function(){   
    document.getElementById('myUpdatePass').addEventListener('submit', function(event) {
		///////////////////공백검사 유효성검사/////////////////////////
        let updatePassword = document.getElementById("updatePassword");
        let updatePasswordConfirm = document.getElementById('updatePasswordConfirm');
        let pwcriteria = /^(?:(?=.*[A-Za-z])(?=.*\d)|(?=.*[A-Za-z])(?=.*[^A-Za-z0-9])|(?=.*\d)(?=.*[^A-Za-z0-9]))[A-Za-z\d\W_]{8,16}$/;
	///////////////////공백검사 유효성검사/////////////////////////
        // 비밀번호 유효성 검사
        if (!pwcriteria.test(updatePassword.value)) {
            alert("비밀번호가 요구 사항을 충족하지 않습니다.");
            updatePassword.focus();
            event.preventDefault();
            return false;
        }
        // 비밀번호 공백검사
        if(updatePassword.value == ""){
            alert("비밀번호를 입력하세요");
            updatePassword.focus();
            event.preventDefault();
            return false;
        }
        // 비밀번호 확인 공백검사
        if(updatePasswordConfirm.value == ""){
            alert("비밀번호확인을 입력하세요");
            updatePasswordConfirm.focus();
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