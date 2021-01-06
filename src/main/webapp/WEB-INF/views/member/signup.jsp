<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>webook 온라인서점</title>

<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link href="${pageContext.request.contextPath}/resources/css/signup&in/signup&in.css" rel="stylesheet"> 
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

</head>
<body id="LoginForm">

<div class="container">
<div class="login-form">
<div class="main-div">
   <div class="panel">
   	<h1><a href="/webook" class="webook-main">webook</a></h1>
   </div>
   <br>
    <form action="/member/signup" method="post" id="signForm" role="form" onsubmit="return checks()">
    
       <label>아이디</label>
       <div class="form-group">
         <input type="text" class="form-control" name="userId" id="userId">
         <div class="check_font" id="userIdCheck"></div>
       </div>

	   <label>비밀번호</label>
       <div class="form-group">
         <input type="password" class="form-control" name="userPass" id="userPass" onkeyup="userPassVal()">
         <div class="check_font" id="userPassCheck"></div>
       </div>
       
       <label>비밀번호 재확인</label>
       <div class="form-group">
         <input type="password" class="form-control" name="userPassRe" id="userPassRe" onkeyup="userPassReVal()">
         <div class="check_font" id="userPassReCheck"></div>
       </div>
       
       <label>이름</label>
       <div class="form-group">
         <input type="text" class="form-control" name="userName" id="userName">
         <div class="check_font" id="userNameCheck"></div>
       </div>
       
       <label>생년월일</label>
       <div class="form-group">
         <input type="text" class="form-control" name="userBirth" id="userBirth" placeholder="ex) 19920101">
         <div class="check_font" id="userBirthCheck"></div>
       </div>
       
       <label>이메일</label>
       <div class="form-group">
         <input type="email" class="form-control" name="userEmail" id="userEmail">
         <div class="check_font" id="userEmailCheck"></div>
       </div>
       
       <label>전화번호</label>
       <div class="form-group">
         <input type="text" class="form-control" id="userPhon" name="userPhon" id="userPhon" placeholder="'-' 없이 번호만 입력하세요.">
         <div class="check_font" id="userPhonCheck"></div>
       </div>
     
       <label>주소</label>
       <div class="form-group">
         <input type="text" class="form-control" id="sample4_postcode" name="postcode" placeholder="우편번호" style="width: 204px; important; display: inline; margin-bottom: 5px;">
         <input type="button" class="btn btn-primary" id = "postcode" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" style="width: 150px; important; display: inline; margin-bottom: 5px;"><br>
         <input type="text" class="form-control" name="userAddr1" id="sample4_roadAddress" placeholder="도로명주소" style="margin-bottom: 5px; important;" >
         <input type="text" class="form-control" id="sample4_jibunAddress" placeholder="지번주소" style="margin-bottom: 5px; important;" >
         <span id="guide" style="color:#999;display:none"></span>
         <input type="text" class="form-control" name="userAddr2" id="sample4_detailAddress" placeholder="상세주소" style="width: 176px; important; display: inline; margin-bottom: 5px;">
         <input type="text" class="form-control" id="sample4_extraAddress" placeholder="참고항목" style="width: 176px; important; display: inline; margin-left: 1px;">
         <div class="check_font" id="userAddrCheck"></div>
       </div>
       <br>
       <input type="submit" value="가입하기" id="signUp" class="btn btn-primary">
    </form>
    </div>
	</div>
	</div>

<!-- 카카오 주소 API -->	
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">


// 아이디 중복 체크 (1 = 중복 / 0 != 중복) 
$("#userId").blur(function(){

	var userId = $('#userId').val();
	var idJ = /^[a-z0-9]{4,12}$/;
	
	$.ajax({
		url : '${pageContext.request.contextPath}/member/idCheck?userId=' + userId,
		type : 'get',
		success : function(data){
			console.log("1 = 중복o / 0 = 중복x : " + data);

			if(data == 1){
				// 1 : 아이디가 중복되는 문구 
				$("#userIdCheck").text("이미 사용중인 아이디입니다.").css("color", "red");
				$("#signUp").attr("disabled", true);
			} else {

				if(idJ.test(userId)){
					$("#userIdCheck").text("사용 가능한 아이디 입니다.").css("color", "blue");
					$("#signUp").attr("disabled", false);

				} else if(userId.length == 0){

					$("#userIdCheck").text("필수 정보입니다.").css("color", "red");
					$("#signUp").attr("disabled", true);

				} else {

					$("#userIdCheck").text("4~12자 영소문자와 숫자를 사용하세요.").css("color", "red");
					$("#signUp").attr("disabled", true);
				}
			}
		}, error : function(){
				console.log("실패");
		}
	});
});

// 비밀번호 체크
function userPassVal(){
	var pass1 = $('#userPass').val();
	var pwJ = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/;

	// 비밀번호 유효성 체크
	if(pass1.length < 8 || pass1.length > 16 ){
		$("#userPassCheck").text("8~16자 영문, 숫자, 특수문자를 사용하세요.").css("color", "red");
		$("#signUp").attr("disabled", true);
	} else if(pwJ.test(pass1) == false){
		$("#userPassCheck").text("8~16자 영문, 숫자, 특수문자를 사용하세요.").css("color", "red");
		$("#signUp").attr("disabled", true);
	} else if(pass1.length == 0) {
		$("#userPassCheck").text("필수 정보입니다.").css("color", "red");
		$("#signUp").attr("disabled", true);
	} else {
		$("#userPassCheck").text("");
		$("#signUp").attr("disabled", false);
	}
}

// 비밀번호 재확인 체크
function userPassReVal(){
	var pass1 = $('#userPass').val();
	var pass2 = $('#userPassRe').val();
	var pwJ = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/;

	// 비밀번호 재확인 일치 체크
	if(pass1 == pass2){
		$("#userPassReCheck").text("비밀번호가 일치합니다.").css("color", "blue");
		$("#signUp").attr("disabled", false);
	} else if(pass2.length == 0) {
		$("#userPassReCheck").text("필수 정보입니다.").css("color", "red");
		$("#signUp").attr("disabled", true);
	} else {
		$("#userPassReCheck").text("비밀번호가 일치하지 않습니다.").css("color", "red");
		$("#signUp").attr("disabled", true);
	}
}

// 나머지 회원가입 유효성 체크(정규식)
	// 모든 공백 체크 정규식 
	var empJ = /\s/g;
	// 이름 정규식
	var nameJ = /^[가-힣]{2,6}$/;
	// 이메일 검사 정규식
	var mailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	// 전화번호 정규식
	var phoneJ = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/;
	
	// 이름 정규식
	$("#userName").blur(function(){
		if(nameJ.test($(this).val())) {
			console.log(nameJ.test($(this).val()));
			$("#userNameCheck").text('');
			$("#signUp").attr("disabled", false);
		} else {
			$("#userNameCheck").text('이름을 정확하게 입력하세요.').css('color','red');
			$("#signUp").attr("disabled", true);
		}
	});

	// 전화번호 정규식
	$("#userPhon").blur(function(){
		if(phoneJ.test($(this).val())) {
			console.log(phoneJ.test($(this).val()));
			$("#userPhonCheck").text('');
			$("#signUp").attr("disabled", false);
		} else {
			$("#userPhonCheck").text("전화번호를 정확하게 입력하세요.").css('color','red');
			$("#signUp").attr("disabled", true);
		}

	});

	// 생년월일 정규식 
	var birthJ = false;

	$("#userBirth").blur(function(){
		var dateStr = $(this).val();
		var year = Number(dateStr.substr(0,4)); // 입력한 값의 연도
		var month = Number(dateStr.substr(4,2)); // 입력한 값의 월
		var day = Number(dateStr.substr(6,2)); // 입력한 값의 일
		var today = new Date(); // 날짜 변수 선언
		var yearNow = today.getFullYear(); // 올해 연도

		if(dateStr.length <= 8) {

			// 연도가 1900보다 작거나 올해연도보다 크다면 false를 반환한다.
			if(1900 > year || year > yearNow){
				$("#userBirthCheck").text("생년월일을 정확하게 입력하세요.").css('color','red');
			} else if(month < 1 || month > 12) {
				$("#userBirthCheck").text("생년월일을 정확하게 입력하세요.").css('color','red');
			} else if(day < 1 || day > 31) {
				$("#userBirthCheck").text("생년월일을 정확하게 입력하세요.").css('color','red');
			} else if((month == 4 || month == 6 || month == 9 || month == 11) && day == 31) {
				$("#userBirthCheck").text("생년월일을 정확하게 입력하세요.").css('color','red');
			} else if(month == 2) {
				var isleap = (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0));

				if(day > 29 || (day == 29 && !isleap)) {
					$("#userBirthCheck").text("생년월일을 정확하게 입력하세요.").css('color','red');
				} else {
					$("#userBirthCheck").text('');
					birthJ = true;
				} //end of if (day>29 || (day==29 && !isleap))
			} else {
				$("#userBirthCheck").text('');
				birthJ = true;
			} //end of if
		} else {
			// 입력된 값이 8자를 초과할 때
			$("#userBirthCheck").text("생년월일을 정확하게 입력하세요.").css('color','red');
		}
	});

	// 이메일 정규식 
	$("#userEmail").blur(function(){
		if(mailJ.test($(this).val())) {
			console.log(mailJ.test($(this).val()));
			$("#userEmailCheck").text('');
			$("#signUp").attr("disabled", false);
		} else {
			$("#userEmailCheck").text("이메일을 정확하게 입력하세요.").css('color','red');
			$("#signUp").attr("disabled", true);
		}
	});

	
// 공백 유효성 체크
function checks(){
	
if($("#userId").val() == ""){ 
	$("#userIdCheck").text("필수 정보입니다.").css("color", "red");
	$("#userId").focus(); 
	return false; 
}

if($("#userPass").val() == ""){ 
	$("#userPassCheck").text("필수 정보입니다.").css("color", "red");
	$("#userPass").focus(); 
	return false; 
}

if($("#userPassRe").val() == ""){ 
	$("#userPassReCheck").text("필수 정보입니다.").css("color", "red");
	$("#userPassRe").focus(); 
	return false; 
}


if($("#userName").val() == ""){ 
	$("#userNameCheck").text("필수 정보입니다.").css("color", "red");
	$("#userName").focus(); 
	return false; 
}

if($("#userBirth").val() == ""){ 
	$("#userBirthCheck").text("필수 정보입니다.").css("color", "red");
	$("#userBirth").focus(); 
	return false; 
}

if($("#userEmail").val() == ""){ 
	$("#userEmailCheck").text("필수 정보입니다.").css("color", "red");
	$("#userEmail").focus(); 
	return false; 
}

if($("#userPhon").val() == ""){ 
	$("#userPhonCheck").text("필수 정보입니다.").css("color", "red");
	$("#userPhon").focus(); 
	return false; 
}

/* if($("#sample4_postcode").val() == ""){ 
	$("#userAddrCheck").text("필수 정보입니다.").css("color", "red");
	$("#sample4_postcode").focus(); 
	return false; 
}else {
	$("#userAddrCheck").text("");
}  */ 

var isPostCodeBtn = false;
if(isPostCodeBtn == false){
	$("#userAddrCheck").text("필수 정보입니다.").css("color", "red");
	//$("#sample4_postcode").focus(); 
	return false; 
}

}
	
// 카카오 주소 API
function sample4_execDaumPostcode() {
    new daum.Postcode({
         oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
</script>
	

</body>
</html>