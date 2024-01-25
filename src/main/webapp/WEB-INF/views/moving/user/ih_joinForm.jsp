<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.sql.*"%>
<%@ include file="../../inc/header.jsp"%>
<script src="${pageContext.request.contextPath}/resources/assets/js/ih_join.js"></script>
<main id="main" class="main">
      <h2 class="blind">메인 컨텐츠</h2>
      <div id="container" class="container">
<div class="ih__joinForm">
	<form action="submitJoinFrom.ih" method="post" id="join" class="join">
		<div class="title">
			<h2>회원가입</h2>
		</div>
		
		<fieldset>
			<div class="form-class">
				<label for="name">이름</label> <input type="text" id="name" name="name" placeholder="이름 입력" />
			</div>
			
			<div class="form-class">
				<label for="id" class="#">아이디</label> <input type="text" id="id" name="id" class="id chk_validator" placeholder="아이디 입력" />
				<p>영문 또는 영문,숫자 조합(8~12자)</p>
				<p id="idCriteria"></p>
				<p id="idResult" class="checkedResult"><br/> </p>
			</div>
			
			<div class="form-class">
				<label for="password">비밀번호</label>
				<input type="password" id="password" name="password" class="password" placeholder="비밀번호입력 " />
				<p>영문, 숫자, 특수문자 중 2가지 이상 조합하여 8-16글자</p>
				<p id="passwordCriteria"></p>
			</div>
			
			<div class="form-class">
				<label for="password2">비밀번호 확인</label>
				<input type="password" id="password2" name="password2" class="password2" placeholder="비밀번호입력 확인" />
			</div>
			
			<div class="form-class">
				<label for="nickname">닉네임</label> 
				<input type="text" id="nickname" name="nickname" class="nickname chk_validator" placeholder="닉네임 입력" />
				<p>2~8자 이내 한글,영문대소문자,숫자 사용가능</p>
				<p id="nicknameCriteria"></p>
				<p id="nicknameResult" class="checkedResult"> <br/></p>
			</div>
			
			<div class="form-class">
				<label for="email">이메일</label> <input type="email" id="email" name="email" class="email" placeholder="이메일 입력" />
				<input type="button" class="btn btn-success" id="sendCode" value="코드발송" />
				<p id="emailResult" class="checkedResult"> </p>
			</div>
<script>
$(document).ready(function() {
    // 아이디 유효성 검사
    $("#id").on("keyup", function() {
        var id = $(this).val();
        var regex = /^[a-zA-Z0-9]{8,12}$/;
        validateField(id, regex, $("#idCriteria"));
    });

    // 비밀번호 유효성 검사
    $("#password").on("keyup", function() {
        var password = $(this).val();
        var regex = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-]|.*[0-9]).{8,16}$/;
        validateField(password, regex, $("#passwordCriteria"));
    });

    // 닉네임 유효성 검사
    $("#nickname").on("keyup", function() {
        var nickname = $(this).val();
        var regex = /^[a-zA-Z0-9가-힣]{2,8}$/;
        validateField(nickname, regex, $("#nicknameCriteria"));
    });

    // 필드 유효성 검사 함수
    function validateField(value, regex, criteriaElement) {
        if (regex.test(value)) {
            criteriaElement.css("color", "blue").text("조건을 만족합니다.");
        } else {
            criteriaElement.css("color", "red");
        }
    }
});
</script>
			<div class="form-class">
				<label for="inputEmail" class="myhidden">인증코드입력</label>
				<input type="text" id="inputEmail" class="email2" placeholder="인증코드를 입력해주세요." />
				<input type="text" id="timeLimit" style="color:red;" disabled/>
				<input type="text" id="emailCode" class="blind" value="" />
			</div>
			<div class="form-class">
				<label for="phonenumber">휴대폰번호</label>
				<input type="tel" id="phonenumber" name="phonenumber" placeholder="-없이 휴대폰번호 입력" />
			</div>
			
			<div class="form-class">
				<label for="age">생년월일</label>
				<input type="text" id="age" name="age" placeholder="생년월일 8자리 ex) 19810101" />
			</div>

			<div class=agreement>
				<div class="flip-box">
					<div class="checkbox-box">
						<label>
							<input type="checkbox" id="chk1" class="checkbox chkAll"><em></em>
							<span>&nbsp;서비스 이용약관(필수)</span>
						</label>
						<button type="button" class="btn-flip"></button>
					</div>
					<div class="service">
						<div class="terms">
							<div class="t1">이용약관</div>
							<div class="t2">제 1장 총칙</div>
							<div class="t3">제 1 조 (목적)</div>
							<div class="t4">본 약관은 무빙 주식회사(이하 "회사"라 합니다)가 제공하는 무빙
								홈페이지(이하 "서비스"라 합니다)를 이용함에 있어 회사와 이용자의 권리, 의무 및 책임사항을 규정함을 목적으로
								합니다.</div>


							<div class="t3">제 2 조 (약관의효력및변경)</div>
							<div class="t4">
								1) 본 약관은 서비스를 이용하고자 본 약관에 동의한 모든 회원에 대하여 그 효력을 발생합니다.<br>
								2) 본 약관의 내용은 회원(서비스)가입 시 게재되거나 공지된 내용에 회원이 동의함으로써 그 효력이 발생합니다.<br>
								3) 회사는 약관이 변경되는 경우 변경된 약관의 내용과 시행일을 정하여 시행일로부터 최소 7일 전, 고객에게
								불리하게 변경되거나 중요한 내용인 경우에는 최소 30일 전에 회사의 홈페이지 또는 전자메일등을 통해 공지합니다.<br>
								4) 회원은 변경된 약관에 동의하지 않을 경우 회원 탈퇴/약관철회를 요청할 수 있으며, 변경된 약관의 효력 발생일
								이후 탈퇴/약관철회 요청을 하지 않을 경우 약관의 변경 사항에 동의한 것으로 간주됩니다.<br>
							</div>


							<div class="t3">제 3 조 (약관외준칙)</div>
							<div class="t4">
								1) 본 약관에 명시되지 아니한 사항에 대해서는 전자서명법, 전자상거래 등에서의 소비자보호에 관한 법률, 정보통신망
								이용촉진 및 정보보호 등에 관한 법률 등 관련 제반 규정 및 상관례에 따릅니다.<br> 2) 본 약관에
								명시되지 않은 서비스에 대한 사항은 당사 홈페이지, 모바일 또는 영화관 현장을 통한 해당 서비스 공지사항에
								따릅니다.

							</div>


							<div class="t3">제 4 조 (용어의정의)</div>
							<div class="t4">
								본 약관에서 사용하는 주요한 용어의 정의는 다음과 같습니다.<br> 1) "사이트"란 회사가
								재화•용역•정보를 이용자에게 제공하기 위하여 컴퓨터 등 정보통신 설비를 이용하여 재화•용역을 거래할 수 있도록
								설정한 가상의 영업장 또는 회사가 운영하는 웹사이트(홈페이지, 모바일 웹/어플리케이션, SNS 등)를 말하며,
								아울러 사이트를 운영하는 사업자의 의미로도 사용합니다.<br> 2) “회원”이란 회사에 개인정보를 제공하여
								회원등록을 한 자로서, 회사가 제공하는 정보를 수령하고 회사의 서비스를 계속적으로 이용할 수 있는 자를 의미하며,
								하기 각호의 회원을 통칭합니다.v (1) 회원 : 무빙 홈페이지에서 가입한 회원을 말합니다.<br>
								(2) 비회원 : 회원에 가입하지 않고 무빙 홈페이지에서 제공하는 서비스를 이용하는 자를 말합니다.<br>
								(3) 아이디 : 회원의 식별과 회원의 서비스 이용을 위하여 회원이 선정하고 회사가 승인하는 문자나 숫자 혹은 그
								조합을 말합니다(이하"ID"라 합니다).<br> (4) 비밀번호 : 회원이 부여 받은 ID와 일치된
								회원임을 확인하고, 회원 자신의 비밀을 보호하기 위하여 회원이 정한 문자와 숫자의 조합을 말합니다.<br>
								(5) 이용중지 : 회사가 정한 일정한 요건에 따라 일정기간 동안 서비스의 제공을 중지하는 것을 말합니다.

							</div>





							<div class="t2">제 2 장서비스이용약관</div>
							<div class="t3">제 5 조 (회원가입)</div>
							<div class="t4">
								1) 회원 가입은 회사가 운영하는 사이트를 통해 가능하며, 서비스 가입 신청 시 본 약관과 개인정보
								처리방침(‘개인정보수집 및 이용안내’ 및 ‘마케팅 활용 동의’ 등)′에 동의함으로써 회원 가입을 신청합니다.<br>
								2) 고객으로부터 회원 가입 신청이 있는 경우 회사는 자체 기준에 따른 심사를 거친 후 고객에게 회원 자격을 부여
								할 수 있으며 회원 자격이 부여된 고객은 회사로부터 가입 완료 공지를 받은 시점부터 회원으로서의 지위를 취득합니다.

							</div>


							<div class="t3">제 6 조 (이용약관의성립)</div>
							<div class="t4">
								1) 서비스신청 시 본 약관을 읽고 "동의함" 버튼을 클릭하면 본 약관에 동의하는 것으로 간주됩니다.<br>
								2) 이용약관은 서비스 이용희망자의 이용약관 동의 후 이용 신청에 대하여 회사가 승낙함으로써 성립하며, 이용 신청
								및 회사의 승낙에 대해서는 본 약관 제7조 및 제8조에서 규정된 바에 따릅니다.<br> 3)
								『정보통신망이용촉진및정보보호등에관한법률』상 만14세 미만의 아동은 온라인으로 타인에게 개인정보를 보내기 전에 반드시
								개인정보의 수집 및 이용목적에 대하여 충분히 숙지하고 법정대리인(부모)의 동의를 받아야 합니다. 법정 대리인의
								동의를 받아도 청소년 관람불가 영화 예매 등 일부 서비스는 제한될 수 있습니다.

							</div>


							<div class="t3">제 7 조 (이용신청)</div>
							<div class="t4">회원으로 가입하여 서비스를 이용하기를 희망하는 자는 회사가 정한 소정 양식에
								따라 요청하는 개인 인적 사항을 제공하여 이용신청을 합니다.</div>


							<div class="t3">제 8 조 (이용신청의승낙)</div>
							<div class="t4">
								1) 회사는 제 7 조에 따른 이용신청에 대하여 특별한 사정이 없는 한 접수 순서대로 이용 신청을 승낙합니다.<br>
								2) 회사는 다음 각 호에 해당하는 경우 이용신청에 대한 승낙을 제한할 수 있고, 그 사유가 해소될 때까지 승낙을
								유보할 수 있습니다.<br> (1) 기술상 서비스 제공이 불가한 경우<br> (2) 기타 회사가
								정한 이용신청 요건에 만족되지 않았을 경우<br> (3) 본인의 실명으로 신청하지 않은 경우<br>
								(4) 다른 사람의 명의를 사용하여 신청한 경우<br> (5) 이용 신청 시 필요 사항을 허위로 기재하여
								신청한 경우<br> (6) 사회의 안녕과 질서 혹은 미풍양속을 저해할 목적으로 신청한 경우<br>
								(7) 기타 회사가 정한 이용 신청 요건이 미비 된 경우<br> 3) 이용신청의 승낙을 유보하거나 승낙하지
								아니하는 경우, 회사는 이를 이용신청자에게 알려야 합니다. 다만, 회사의 귀책사유 없이 이용신청자에게 통지할 수
								없는 경우는 예외로 합니다.<br> 4) 제 9조 2항, 제13조, 제15조 중 하나의의 사유로 인해 회원
								탈퇴 또는 약관철회 조치를 당한 사람이 제7조의 이용신청을 하는 경우 회사는 이를 승낙하지 않을 수 있습니다.

							</div>


							<div class="t3">제 9 조 (계약해지, 이용제한및재가입제한)</div>
							<div class="t4">
								1) 회원이 이용 계약을 해지(탈퇴) 하고자 하는 경우에는 회원 본인이 사이트나 고객센터 또는 E-MAIL등 기타
								회사가 정하는 방법으로 회원탈퇴 또는 이용약관 철회를 요청할 수 있으며, 회사는 회원의 요청에 따라 조속히 회원
								탈퇴에 필요한 제반 절차를 수행합니다. 단, 회원 탈퇴 시 이벤트 부정 이용 방지 등을 위하여 탈퇴일로부터 30일
								이내에 재가입이 불가하며 회원 탈퇴 시 적립된 포인트 및 보유한 쿠폰 등의 개인 혜택들은 모두 삭제됩니다.<br>
								2) 회사는 회원이 다음 각 호에 해당하는 행위를 하였을 경우 사전통지 없이 이용약관을 해지하거나 또는 기간을
								정하여 서비스 이용을 중지할 수 있습니다.<br> (1) 타인의 개인정보, ID 및 비밀번호를 도용한 경우<br>
								(2) 가입한 이름이 실명이 아닌 경우<br> (3) 타인의 명예를 손상시키거나 불이익을 주는 행위를 한
								경우<br> (4) 회사, 다른 회원 또는 제 3자의 지적재산권을 침해하는 경우<br> (5)
								공공질서 및 미풍양속에 저해되는 내용을 고의로 유포시킨 경우<br> (6) 회원이 국익 또는 사회적 공익을
								저해할 목적으로 서비스 이용을 계획 또는 실행하는 경우<br> (7) 서비스 운영을 고의로 방해한 경우<br>
								(8) 서비스의 안정적 운영을 방해할 목적으로 다량의 정보를 전송하거나 광고성 정보를 전송하는 경우<br>
								(9) 정보통신설비의 오작동이나 정보의 파괴를 유발시키는 컴퓨터 바이러스 프로그램 등을 유포하는 경우<br>
								(10) 정보통신윤리위원회 등 외부기관의 시정요구가 있거나 불법선거운동과 관련하여 선거관리위원회의 유권해석을 받은
								경우<br> (11) 회사의 서비스를 이용하여 얻은 정보를 회사의 사전 승낙 없이 복제 또는 유통시키거나
								상업적으로 이용하는 경우<br> (12) 회원이 자신의 홈페이지와 게시판에 음란물을 게재하거나 음란 사이트
								링크하는 경우<br> (13) 본 약관을 포함하여 기타 회사가 정한 이용 조건에 위반한 경우<br>
								3) 회원이 자발적으로 탈퇴하거나 당사에 요청하여 회원 탈퇴한 때로부터 1개월이 이내에 재가입이 불가하며, 제9조
								2항, 제13조 6항, 제15조에 따라 회원 자격이 상실된 회원의 경우에도 서비스 부정 이용 및 추가적인 피해
								방지를 위하여 회원 자격이 상실된 날로부터 1개월 간 재가입 및 서비스 이용이 불가합니다.

							</div>


							<div class="t3">제 10 조 (회원에대한통지)</div>
							<div class="t4">
								1) 회원에 대한 통지를 하는 경우, 회사는 회원이 등록한 e-mail 주소 또는 SMS 등으로 할 수 있습니다.<br>
								2) 회사는 불특정 다수 회원에 대한 통지의 경우 서비스 게시판 등에 게시함으로써 개별 통지에 갈음할 수 있습니다.

							</div>


							<div class="t3">제 11 조 (회원정보의변경)</div>
							<div class="t4">
								1) 회원은 개인정보처리방침를 통해 언제든지 본인의 개인정보를 열람하고 수정할 수 있습니다.<br>
								2)회원은 이용신청 시 기재한 사항이 변경되었을 경우 온라인으로 직접 수정을 하거나,
								contact@dtryx.com으로 연락하시어 수정 요청을 해야 하며, 회원정보를 변경하지 아니하여 발생되는 문제의
								책임은 회원에게 있습니다.

							</div>






							<div class="t2">제 3 장계약당사자의의무</div>
							<div class="t3">제 12 조 (회사의의무)</div>
							<div class="t4">
								1) 회사는 특별한 사정이 없는 한 회원이 서비스 이용을 신청한 날에 서비스를 이용할 수 있도록 합니다.<br>
								2) 회사는 본 약관에서 정한 바에 따라 계속적이고 안정적인 서비스의 제공을 위하여 지속적으로 노력하며, 설비에
								장애가 생기거나 멸실 된 때에는 지체 없이 이를 수리 복구하여야 합니다. 다만, 천재지변, 비상사태 또는 그 밖에
								부득이한 경우에는 그 서비스를 일시 중단하거나 중지할 수 있습니다.<br> 3) 회사는 서비스 관련하여
								회원으로부터 소정의 절차에 의해 제기되는 의견이나 불만이 정당하다고 인정할 경우에는 적절한 절차를 거처 처리하여야
								합니다. 처리 시 일정 기간이 소요될 경우 회원에게 그 사유와 처리 일정을 알려주어야 합니다.<br> 4)
								회사는 회원의 프라이버시 보호와 관련하여 개인정보처리방침 제 2 조에 제시된 내용을 지킵니다.<br> 5)
								회사는 본 약관의 체결, 계약사항의 변경 및 해지 등 이용고객과의 계약 관련 절차 및 내용 등에 있어 이용고객에게
								편의를 제공하도록 노력합니다.

							</div>
							<div class="t3">제 13 조 (회원의의무)</div>
							<div class="t4">
								1) 회원은 본 약관에서 규정하는 사항과 이용안내 또는 공지사항 등을 통하여 회사가 공지하는 사항을 준수하여야
								하며, 기타 회사의 업무에 방해되는 행위를 하여서는 안됩니다.<br> 2) 회원의 ID와 비밀번호에 관한
								모든 관리책임은 회원에게 있습니다. 회원에게 부여된 ID와 비밀번호의 관리 소홀, 부정 사용에 의하여 발생하는 모든
								결과에 대한 책임은 회원에게 있습니다.<br> 3) 회원은 자신의 ID나 비밀번호가 부정하게 사용되었다는
								사실을 발견한 경우에는 즉시 회사에 신고하여야 하며, 신고를 하지 않아 발생하는 모든 결과에 대한 책임은 회원에게
								있습니다.<br> 4) 회원은 회사의 사전승낙 없이는 서비스를 이용하여 영업활동을 할 수 없으며, 그
								영업활동의 결과와 회원이 약관에 위반한 영업활동을 하여 발생한 결과에 대하여 회사는 책임을 지지 않습니다. 회원은
								이와 같은 영업활동으로 회사가 손해를 입은 경우 회원은 회사에 대하여 손해배상의무를 집니다.<br> 5)
								회원은 회사의 명시적인 동의가 없는 한 서비스의 이용권한, 기타 이용 계약상 지위를 타인에게 양도, 증여할 수
								없으며, 이를 담보로 제공할 수 없습니다.<br> 6) 회원은 서비스 이용과 관련하여 다음 각 호에
								해당되는 행위를 하여서는 안됩니다.<br> (1) 다른 회원의 ID와 비밀번호 등 개인정보를 도용하는 행위<br>
								(2) 본 서비스를 통하여 얻은 정보를 회사의 사전승낙 없이 회원의 이용 이외 목적으로 복제하거나 이를 출판 및
								방송 등에 사용하거나 제3자에게 제공하는 행위<br> (3) 타인의 특허, 상표, 영업비밀, 저작권 기타
								지적재산권을 침해하는 내용을 게시, 전자메일 또는 기타의 방법으로 타인에게 유포하는 행위<br> (4)
								공공질서 및 미풍양속에 위반되는 저속, 음란한 내용의 정보, 문장, 도형 등을 전송, 게시, 전자메일 또는 기타의
								방법으로 타인에게 유포하는 행위<br> (5) 모욕적이거나 위협적이어서 타인의 프라이버시를 침해할 수 있는
								내용을 전송, 게시, 전자메일 또는 기타의 방법으로 타인에게 유포하는 행위<br> (6) 범죄와 결부된다고
								객관적으로 판단되는 행위<br> (7) 회사의 승인을 받지 않고 다른 사용자의 개인정보를 수집 또는
								저장하는 행위<br> (8) 기타 관계법령에 위배되는 행위


							</div>





							<div class="t2">제 4 장서비스이용상세</div>
							<div class="t3">제 14 조 (회원서비스혜택)</div>
							<div class="t4">
								1) 회원은 회사 홈페이지를 이용한 인터넷예매를 실시할 수 있으며, 이메일, 핸드폰 문자 메시지 서비스(SMS),
								모바일 앱 푸쉬(app push)를 통한 영화 및 극장 정보를 제공받습니다.<br> 2) 회사는 가능한 한
								회원에게 회사에서 계획하는 모든 행사에 참여할 수 있는 우선권을 부여토록 합니다

							</div>

							<div class="t3">제 15 조 (회원서비스혜택의제한)</div>
							<div class="t4">
								1) 회원이 다음 각 호에서 정한 방법으로 티켓을 양도하는 경우 회사는 회원탈퇴/약관철회 등의 조치를 취할 수
								있습니다. 이 경우 회사는 회원 서비스 혜택을 제한한 때로부터 1주일 이내에 그 사유를 회원에게 통보하여야 합니다.<br>
								2) 제휴 포인트 적립이나 영리의 목적으로 티켓을 발권한 다음 다른 사람에게 대가를 받고 양도하거나 포인트를
								적립하는 경우<br> 3) 재판매 등의 영업활동(제16조 제1항 제1호)의 행위가 2회 이상 반복되거나
								로그인 제한 등 시정 통보 후 30일 이내에 그 사유가 시정되지 아니하는 경우 재판매 성사여부에 관계없이
								회원탈퇴/약관철회 등의 조치를 취할 수 있습니다.

							</div>


							<div class="t3">제 16 조 (정보의제공)</div>
							<div class="t4">
								1) 회사는 회원이 서비스 이용 중 필요가 있다고 인정되는 다양한 정보를 공지사항이나 이메일 등의 방법으로 회원에게
								제공할 수 있습니다.<br> 2) 회사는 회원에게 보다 나은 서비스 혜택 제공을 위해 다양한 전달
								방법(전화, 안내문, 메일 등)을 통해 서비스 관련 정보를 제공할 수 있습니다. 단, 회사는 회원이 서비스 혜택
								정보 제공을 원치 않는다는 의사를 밝히는 경우 정보 제공 대상에서 해당 회원을 제외하여야 하며, 대상에서 제외되어
								서비스 정보를 제공받지 못해 불이익이 발생하더라도 이에 대해서는 회사가 책임지지 않습니다.

							</div>

							<div class="t3">제 17 조 (회원의게시물)</div>
							<div class="t4">
								1) 회사는 회원이 [홈페이지, 모바일 웹/어플리케이션, SNS 등]에 게시하거나 등록하는 내용물이 다음 각 호에
								해당한다고 판단되는 경우에 사전통지 없이 삭제할 수 있습니다.<br> (1) 다른 회원 또는 제3자를
								비방하거나 중상모략으로 명예를 손상시키는 내용인 경우<br> (2) 공공질서 및 미풍양속에 위반되는 내용인
								경우<br> (3) 범죄적 행위에 결부된다고 인정되는 내용일 경우<br> (4) 회사의 저작권,
								제 3 자의 저작권 등 기타 권리를 침해하는 내용인 경우<br> (5) 회사에서 규정한 게시기간이나 용량을
								초과한 경우<br> (6) 회원이 자신의 홈페이지와 게시판에 음란물을 게재하거나 음란사이트를 링크하는 경우<br>
								(7) 게시판의 성격에 부합하지 않는 게시물의 경우<br> (8) 기타 관계법령에 위반 된다고 판단되는
								경우

							</div>


							<div class="t3">제 18 조 (게시물의저작권)</div>
							<div class="t4">
								1) [홈페이지, 모바일 웹/어플리케이션, SNS 등]에 게재된 자료에 대한 권리는 다음 각 호와 같습니다.<br>
								(1) 게시물에 대한 권리와 책임은 게시자에게 있으며 회사는 게시자의 동의 없이는 이를 [홈페이지, 모바일
								웹/어플리케이션, SNS 등] 게재 이외에 영리적 목적으로 사용할 수 없습니다. 단, 비영리적인 경우에는 그러하지
								아니하며 또한 회사는 [홈페이지, 모바일 웹/어플리케이션, SNS 등] 의 게재권을 보유합니다.<br>
								(2) 회원은 서비스를 이용하여 얻은 정보를 가공, 판매하는 행위 등 [홈페이지, 모바일 웹/어플리케이션, SNS
								등]에 게재된 자료를 상업적으로 사용할 수 없습니다.

							</div>

							<div class="t3">제 19 조 (광고게재및광고주와의거래)</div>
							<div class="t4">
								1) 회사가 회원에게 서비스를 제공할 수 있는 서비스 투자기반의 일부는 광고게재를 통한 수익으로부터 나옵니다.
								서비스를 이용하고자 하는 자는 서비스 이용 시 노출되는 광고게재에 대해 동의하는 것으로 간주됩니다.<br>
								2) 회사는 본 [홈페이지, 모바일 웹/어플리케이션, SNS 등]에 게재되어 있거나 본 서비스를 통한 광고주의
								판촉활동에 회원이 참여하거나 교신 또는 거래의 결과로서 발생하는 모든 손실 또는 손해에 대해 책임을 지지 않습니다.

							</div>


							<div class="t3">제 20 조 (서비스이용시간)</div>
							<div class="t4">
								1) 서비스의 이용은 회사의 업무상 또는 기술상 특별한 지장이 없는 한 연중무휴 1일 24시간 가능함을 원칙으로
								합니다. 다만 정기 점검 등이 필요할 경우, 회사 홈페이지를 통해 사전 공지하여 그 내용을 알립니다.<br>
								2) 회사는 서비스를 일정범위로 분할하여 각 범위별로 이용가능 시간을 별도로 정할 수 있습니다. 이 경우 회사
								홈페이지를 통해 사전 공지하여 그 내용을 알립니다.

							</div>

							<div class="t3">제 21 조 (서비스이용책임)</div>
							<div class="t4">회원은 회사가 정식 인감이 날인된 서면을 통해 명시적으로 동의한 경우를
								제외하고는 서비스를 이용하여 상품을 판매하는 영업활동을 할 수 없으며 특히 해킹, 돈벌이 광고, 음란 사이트 등을
								통한 상업행위, 상용S/W 불법배포 등을 할 수 없습니다. 이를 어기고 발생한 영업활동의 결과 및 손실, 관계기관에
								의한 구속 등 법적 조치 등에 관해서는 회사가 책임을 지지 않습니다.</div>


							<div class="t3">제 22 조 (서비스제공의중지등)</div>
							<div class="t4">
								1) 회사는 다음 각 호에 해당하는 경우 서비스 제공을 중지할 수 있습니다.<br> (1) 서비스용 설비의
								보수 등 공사로 인한 부득이한 경우<br> (2) 전기통신사업법에 규정된 기간통신사업자가 전기통신 서비스를
								중지했을 경우<br> (3) 기타 불가항력적 사유가 있는 경우<br> 2) 회사는 국가비상사태,
								정전, 서비스 설비의 장애 또는 서비스 이용의 폭주 등으로 정상적인 서비스 이용에 지장이 있는 때에는 서비스의 전부
								또는 일부를 제한하거나 중지할 수 있습니다.<br> 3) 회사는 제 1 항 및 2항의 규정에 의하여
								서비스의 이용을 제한하거나 중지한 때에는 그 사유 및 제한기간 등을 지체 없이 회원에게 알려야 합니다.

							</div>




							<div class="t2">제 5 장손해배상및기타</div>
							<div class="t3">제 23 조 (손해배상)</div>
							<div class="t4">회사는 이용 요금이 무료인 서비스 이용과 관련하여 회원에게 발생한 어떠한
								손해에 관하여도 책임을 지지 않습니다. 유료 서비스의 경우는 서비스별 이용약관에 따릅니다.</div>

							<div class="t3">제 24 조 (면책조항)</div>
							<div class="t4">
								1) 회사는 천재지변 또는 이에 준하는 불가항력으로 인하여 서비스를 제공할 수 없는 경우에는 서비스 제공에 관한
								책임이 면제됩니다.<br> 2) 회사는 회원의 귀책사유로 인한 서비스 이용의 장애에 대하여 책임을 지지
								않습니다.<br> 3) 회사는 회원이 서비스를 이용하여 기대하는 수익을 상실한 것이나 서비스를 통하여 얻은
								자료로 인한 손해에 관하여 책임을 지지 않습니다.<br> 4) 회사는 회원이 [홈페이지, 모바일
								웹/어플리케이션, SNS 등]에 게재한 정보, 자료, 사실의 신뢰도, 정확성 등 내용에 관하여는 책임을 지지
								않습니다.<br> 5) 회사는 서비스 이용과 관련하여 회원에게 발생한 손해 가운데 회원의 고의, 과실에
								의한 손해에 대하여 책임을 지지 않습니다.

							</div>

							<div class="t3">제 25 조 (관할법원)</div>
							<div class="t4">
								서비스 이용으로 발생한 분쟁에 대해 소송이 제기될 경우 회사의 본사 소재지를 관할하는 법원을 전속 관할법원으로
								합니다.<br> <br> [부칙] (시행일)<br> 본 약관은 2022년 1월10일부터
								시행합니다.

							</div>



						</div>
					</div>
				</div>

				<div class="flip-box">
					<div class="checkbox-box">
						<label>
							<input type="checkbox" id="chk2" class="checkbox chkAll">
							<span>&nbsp;개인정보 수집 및 이용 동의 (필수) </span>
						</label>
						<button type="button" class="btn-flip"></button>
					</div>
					<div class="privacy">
						<div class="terms">
							<div class="t1">개인정보처리방침</div>
							<div class="t4">
								㈜무빙(이하 ‘회사’ 로 표기)는 개인정보보호법에 따라 이용자의 개인정보 보호 및 권익을 보호하고 개인정보와 관련한
								이용자의 고충을 원활하게 처리할 수 있도록 다음과 같은 처리방침을 두고 있습니다. 회사는 개인정보처리방침을 개정하는
								경우 웹사이트 공지사항(또는 개별공지)을 통하여 공지할 것입니다. <br> ○ 본방침은 2024년
								1월26일부터시행됩니다.
							</div>

							<div class="t3">1. 개인정보의처리목적및수집</div>

							회사는 개인정보를 다음의 목적을 위해 처리합니다. 처리한 개인정보는 다음의 목적이외의 용도로는 사용되지 않으며 이용
							목적이 변경될 시에는 사전동의를 구할 예정입니다. <br> <br> 1) 필수 수집 <br>
							<table class="table2">
								<tbody>
									<tr>
										<td width="328">수집항목</td>
										<td width="328"><p align="center">이용목적</p></td>
									</tr>
									<tr>
										<td width="328"><p align="left">
												성명, 휴대폰번호, 개인식별값(IpinCI),<br> 아이디, 비밀번호, 이메일주소
											</p></td>
										<td width="328"><p align="left">회원 서비스 이용에 따른 본인 식별 및
												이름, 중복 가입 여부 확인 , 결제 및 예매 확인 공지사항 전달/불만 처리 등을 위한 원활한 의사소통
												경로의 확보 고객센터 운영 불량회원 부정이용 방지 및 비인가 사용방지</p></td>
									</tr>
								</tbody>
							</table>

							2) 모바일 서비스 이용시 필수 수집<br>

							<table class="table2">
								<tbody>
									<tr>
										<td width="328">수집항목</td>
										<td width="328"><p align="center">이용목적</p></td>
									</tr>
									<tr>
										<td width="328"><p align="left">
												모바일 단말기기 정보<br> (모델명, OS 종류, OS버전, 단말식별번호)
											</p></td>
										<td width="328"><p align="left">공지사항 전달/불만 처리 등을 위한
												원활한 의사소통 경로의 확보 개인정보 침해 사고에 대한 대비, 분쟁 조정을 위한 기록보존 고객센터 운영
												불량회원 부정이용 방지 및 비인가 사용방지</p></td>
									</tr>
								</tbody>
							</table>

							3) 선택 수집<br>
							<table class="table2">
								<tbody>
									<tr>
										<td width="328">수집항목</td>
										<td width="328"><p align="center">이용목적</p></td>
									</tr>
									<tr>
										<td width="328"><p align="left">
												휴대폰번호, 이메일주소,<br> <br> 간편로그인 계정 연동 정보,<br>
											</p></td>
									</tr>
									<tr>
										<td width="328"><p align="left">위치정보 수신여부</p></td>
										<td width="328"><p align="left">위치정보를 활용한 서비스</p></td>
									</tr>
								</tbody>
							</table>



							4) 서비스 이용 또는 사업처리 과정에서 생성/수집되는 정보<br>

							<table class="table2">
								<tbody>
									<tr>
										<td width="328">수집항목</td>
										<td width="328"><p align="center">이용목적</p></td>
									</tr>
									<tr>
										<td width="328"><p align="left">
												서비스 이용기록, 접속로그,<br> 접속IP정보, 결제기록(신용카드 정보 등)
											</p></td>
										<td width="328"><p align="left">개인정보 침해 사고에 대한 대비, 분쟁
												조정을 위한 기록 보존, 상품구매</p></td>
									</tr>
									<tr>
										<td width="328"><p align="left">쿠키</p></td>
										<td width="328"><p align="left">본 처리 방침 확인</p></td>
									</tr>
								</tbody>
							</table>


							<div class="t3">2. 개인정보의 이용 및 보유 기간</div>
							1) 회사는 개인정보의 수집 및 제공받은 목적이 달성되면 지체없이 개인정보를 파기함을 원칙으로 합니다. 다만, 다음
							각 호의 경우 일정기간 동안 예외적으로 수집한 회원정보의 전부 또는 일부를 보관할 수 있습니다.<br> 2)
							각각의 개인정보 처리 및 보유 기간은 다음과 같습니다.<br> (1) 무분별한 회원탈퇴와 재가입으로 인한
							피해 최소화, 회원탈퇴 후 변심에 의한 복구 요청 등을 처리하기 위하여 회원탈퇴 후 30일간 회원정보 보유 후 지체
							없이 파기<br> (2) 보유 기간을 미리 고지하고 별도의 동의를 받은 경우 해당 보유기간까지 보유<br>
							(3) 장기 미 이용 회원 개인정보 별도 분리 보관<br> 관련 법령 : 정보통신망 이용촉진 및 정보보호
							등에 관한 법률 제29조(2020.8.5 이전),<br> 개인정보법 제39조의 6 (2020. 8. 5
							이후)<br> 휴면 고객 : 서비스를 1년 이상 이용하지 않은 고객<br> - 홈페이지 및
							모바일웹, 앱 로그인 이력이 1년 이상 없는 고객<br> - 분리 보관 30일 전까지 해당 사실, 분리 보관
							예정일자, 분리 보관되는 개인정보항목 등에 대하여, 전자우편, 서면, 모사전송 또는 이와 유사한 방법으로 별도 통지
							예정, 분리 보관 고객이 웹/모바일 로그인을 하거나 서비스의 이용시 재 이용 신청으로 간주하며, 해당 계정은 자동
							복원 됩니다.<br> (4) 상법’ 및 ‘전자상거래 등에서의 소비자보호에 관한 법률 ’등 관련 법령에 따라
							일정기간 보유할 필요가 있는 경우 관련 법령이 정한 기간에 따라 보유<br> - 계약 또는 청약철회 등에
							관한 기록: 5년<br> - 대금결제 및 재화 등의 공급에 관한 기록: 5년<br> - 소비자의
							불만 또는 분쟁 처리에 관한 기록: 3년<br> - 게시판 이용자의 본인확인에 관한 기록: 6개월<br>
							<br> <br>




							<div class="t3">3. 개인정보의 제3자 제공</div>
							1) 회사는 회원의 동의, 법령에 규정된 경우를 제외하고, 어떠한 경우에도 본 개인정보처리방침에서 고지한 범위를 넘어
							회원의 개인정보를 이용하지 않습니다.<br> 2) 회사는 다음과 같이 개인정보를 제3자에게 제공하고
							있습니다. <br> <br>

							<table class="table3">
								<tbody>
									<tr>
										<td width="197">제공받는자</td>
										<td width="459"><p align="center">
												<a href="#" data-toggle="modal" data-target="#modalMv"
													style="color: #ED7D31; font-weight: 600;">영화관리스트 보기</a>
											</p></td>
									</tr>
									<tr>
										<td width="197"><p align="center">이용목적</p></td>
										<td width="459"><p align="center">
												티켓 현장 발권,<br> 예매 확인 및 취소 등 고객안내 필요
											</p></td>
									</tr>
									<tr>
										<td width="197"><p align="center">제공항목</p></td>
										<td width="459"><p align="center">성명, 아이디, 휴대폰번호, 이메일
												주소, 생년월일</p></td>
									</tr>
									<tr>
										<td width="197"><p align="center">보유 및 이용기간</p></td>
										<td width="459"><p align="center">
												개인정보 이용목적 달성 시까지<br> (단, 관계 법령의 규정에 의해 보존의 필요가 있는 경우 및
												사전 동의를 득한 경우 해당 보유기간까지)
											</p></td>
									</tr>
								</tbody>
							</table>


							<div class="t3">4. 개인정보처리 위탁</div>
							1) 회사는 개인정보의 처리와 관련하여 아래와 같이 업무를 위탁하고 있으며, 해당개인 정보가 위법하게 이용되지 않도록
							하고 있습니다.<br> 2) 회사는 원활한 개인정보 업무처리를 위하여 다음과 같이 개인정보 처리업무를
							위탁하고 있습니다.


							<table class="table2">
								<tbody>
									<tr>
										<td width="219">위탁받는자</td>
										<td width="219"><p align="center">위탁내용</p></td>
										<td width="219"><p align="center">위탁항목</p></td>
									</tr>
									<tr>
										<td width="219"><p align="center">KCP</p></td>
										<td width="219"><p align="center">본인인증</p></td>
										<td width="219"><p align="center">본인인증여부만 확인</p></td>
									</tr>
									<tr>
										<td width="219"><p align="center">
												KS-NET, KCP,<br> 프레피스코리아
											</p></td>
										<td width="219"><p align="center">결제대행, 정산대행</p></td>
										<td width="219"><p align="center">카드정보, 결제정보</p></td>
									</tr>
									<tr>
										<td width="219"><p align="center">프레피스코리아</p></td>
										<td width="219"><p align="center">문자발송, 카카오 알림톡</p></td>
										<td width="219"><p align="center">휴대폰번호</p></td>
									</tr>
									<tr>
										<td width="219"><p align="center">㈜코리아서버 호스팅</p></td>
										<td width="219"><p align="center">개인정보의 보관,관리</p></td>
										<td width="219"><p align="center">휴대폰번호, 생년월일, 이름,
												CI값</p></td>
									</tr>
								</tbody>
							</table>
							3) 위탁업무의 내용이나 수탁자가 변경될 경우에는 지체없이 본 개인정보 처리방침을 통하여 공개하도록 하겠습니다.<br>
							<br> <br>

							<div class="t3">5. 개인정보의 열람 정정 및 동의철회(회원탈퇴)</div>

							1) 이용자는 언제든지 등록되어 있는 개인정보를 열람하거나 정정하실 수 있습니다. 개인정보에 대한 열람 또는 정정을
							하고자 할 경우에는 [회원정보수정] 또는 [선택정보수정]을 클릭하여 본인 비밀번호 확인 절차를 거치신 후 직접 열람
							또는 정정하거나, u1h@naver.com 으로 연락하시면 지체 없이 조치하겠습니다. 개인정보의 이용내역, 취급위탁
							및 제3자 제공 내역 등에 대해서는 u1h@naver.com 으로 요청 시 열람 또는 정정 가능합니다. 개인정보의
							이용 중지를 원하실 경우 회원탈퇴/약관철회를 하시거나 u1h@naver.com 으로 요청하실 수 있습니다.<br>
							2) 이용자는 개인정보의 오류에 대한 정정을 요청하신 경우에는 정정을 완료하기 전까지 당해 개인정보를 이용 또는
							제공하지 않습니다. 또한 잘못된 개인정보를 제3자에게 이미 제공한 경우에는 정정 처리결과를 제3자에게 지체 없이
							통지하여 정정이 이루어지도록 조치하겠습니다.<br> 3) 단, 다음의 경우에는 개인정보의 열람 및 정정을
							제한할 수 있습니다.<br> - 본인 또는 제3자의 생명, 신체, 재산 또는 권익을 현저하게 해할 우려가
							있는 경우<br> - 당해 서비스제공자의 업무에 현저한 지장을 미칠 우려가 있는 경우<br> -
							법령에 위반하는 경우 등.<br> 4) 이용자는 회원가입 시 개인정보의 수집•이용 및 제공에 대해 동의하신
							내용을 언제든지 철회하실 수 있습니다. 동의철회(회원탈퇴)는 ‘마이 페이지 &gt; 회원정보 수정 &gt; 본인
							비밀번호 확인절차를 거치신 후 직접 동의철회(회원탈퇴)를 하시거나, u1h@naver.com 으로 연락하시면 지체
							없이 탈퇴 처리를 도와드리도록 하겠습니다. <br> <br> <br>

							<div class="t3">6. 개인정보의 파기</div>
							회사는 원칙적으로 개인정보 처리목적이 달성된 경우에는 지체없이 해당 개인정보를 파기합니다. 파기의 방법은 다음과
							같습니다.<br>
							<table class="table3">
								<tbody>
									<tr>
										<td width="197">전자파일</td>
										<td width="459"><p align="center">기록이 복구 및 재생되지 않도록
												안전하게 삭제</p></td>
									</tr>
									<tr>
										<td width="197"><p align="center">종이에 출력된 개인정보</p></td>
										<td width="459"><p align="center">분쇄나 소각을 통한 파기</p></td>
									</tr>
								</tbody>
							</table>


							<div class="t3">7. 쿠키에 의한 개인정보 수집</div>
							1) 회사는 개별적인 맞춤서비스를 제공하기 위해 이용정보를 저장하고 수시로 불러오는 ‘쿠키(cookie)’를
							사용합니다.<br> 2) 쿠키는 웹사이트를 운영하는데 이용되는 서버(http)가 이용자의 컴퓨터 브라우저에게
							보내는 소량의 정보이며 이용자들의 PC 컴퓨터내의 하드디스크에 저장되기도 합니다.<br> (1) 쿠키의 사용
							목적 : 이용자가 방문한 각 서비스와 웹 사이트들에 대한 방문 및 이용형태, 인기 검색어, 보안접속 여부, 등을
							파악하여 이용자에게 최적화된 정보 제공을 위해 사용됩니다.<br> (2) 쿠키의 설치•운영 및 거부 :
							웹브라우저 상단의 도구&gt;인터넷 옵션&gt;개인정보 메뉴의 옵션설정을 통해 쿠키 저장을 거부 할 수 있습니다.<br>
							(3) 쿠키 저장을 거부할 경우 맞춤형 서비스 이용에 어려움이 발생할 수 있습니다. <br> <br>
							<br>


							<div class="t3">8. 개인정보 보호책임자</div>
							1) 회사는 개인정보 처리에 관한 업무를 총괄해서 책임지고, 개인정보 처리와 관련한 이용자의 불만처리 및 피해구제
							등을 위하여 아래와 같이 개인정보 보호책임자를 지정하고 있습니다.<br> ▶ 개인정보 보호 책임자, IT
							운영팀 유일환, 031-8017-8332, u1h@naver.com<br> ▶ 개인정보 보호 담당부서, IT
							운영팀 개인정보보호파트, 031-8017-8332, contact@dtryx.com<br> 2) 이용자께서는
							회사의 서비스를 이용하시면서 발생한 모든 개인정보 보호 관련 문의, 불만처리, 피해구제 등에 관한 사항을 개인정보
							보호책임자 및 담당부서로 문의하실 수 있습니다. 회사는 이용자의 문의에 대해 지체 없이 답변 및 처리해드릴 것입니다.<br>
							3) 개인정보가 침해되어 이에 대한 신고나 상담이 필요한 경우에는 아래 기관에 문의하셔서 도움을 받으실 수 있습니다.<br>
							▶ 개인정보침해 신고센터, (국번없이) 118, https://privacy.kisa.or.kr<br> ▶
							대검찰청 사이버수사과, (국번없이) 1301, cid@spo.go.kr<br> ▶ 경찰청 사이버 안전국,
							(국번없이) 182, https://cyberbureau.police.go.kr <br> <br>
							<br>


							<div class="t3">9. 개인정보의 안전성 확보 조치</div>
							회사는 이용자의 개인정보가 분실, 도난, 변조, 유출 또는 훼손되지 않도록 다음과 같이 안전성 확보에 필요한
							기술적/관리적 및 물리적 조치를 하고 있습니다.<br> 1) 침입 차단 시스템을 설치, 운영하여 해킹 등
							외부자의 비인가 접근을 통제하고 있으며, 최소한의 인원으로 업무 역할에 따라 필요한 최소한의 접근 권한을 부여하고
							있습니다.<br> 2) 개인정보를 취급하는 PC 및 서버 등에 백신프로그램을 설치하여, 항상 최신의 상태로
							업데이트를 하고 있으며, 고객정보를 안전하게 저장, 전송하기 위하여 암호화를 적용하고 있습니다.<br> 3)
							개인정보 취급 입력에 대해 보안 교육을 시행하고 관련 인력 및 시스템에 대한 점검을 시행하는 등 안전한 취급을 위해
							최선을 다하고 있습니다. <br> <br> <br>
	

							<div class="t3">10. 개인정보 처리방침 변경</div>
							1) 이 개인정보처리방침은 시행일로부터 적용되며, 법령 및 방침에 따른 변경내용의 추가, 삭제 및 정정이 있는
							경우에는 변경사항의 시행 7일 전부터 공지사항을 통하여 고지할 것입니다.<br> 2) 이용자 여러분의 정보를
							소중히 생각하며, 이용자가 더욱 안심하고 서비스를 이용할 수 있도록 최선의 노력을 다할 것을 약속 드립니다.
						</div>
					</div>
				</div>

				<div class="checkbox-box" style="border-top: 1px solid #dcdcdc;">
					<label style="margin-top: 10px;">
						<input type="checkbox" id="chk3" class="checkbox chkAll"><em></em>
						<span>&nbsp;모든 약관에 동의합니다.</span>
					</label>
				</div>
			</div>
				<div class="button-class">
					<input type="button" class="btn btn-danger" value="돌아가기" id="backButton" />
					<input type="submit" class="btn" value="회원가입" />
				</div>
		</fieldset>
	</form>

</div>
</div>
</main>

<%@include file="../../inc/footer.jsp"%>