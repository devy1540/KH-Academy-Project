<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${ contextPath }/resources/css/accordion.min.css" rel="stylesheet">
<script src="${ contextPath }/resources/js/accordion.min.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<style>
	#corpMainArea {
		width: 100%;
		height:inherit;
		min-height: 700px;
		margin-top: 30px;
		display:table;
	}
	#sidebar {
		border-right: 1.5px solid #B7B7B7;
		width: 20%;
		float: left;
		height: inherit;
	}
	#sidebarText {
		width: fit-content;
		float: right;
		text-align: right;
		color: #737373;
		margin-top: 10px;
		font-size: 14pt;
		line-height: 50px;
		margin-right: 15px;
	}
	.on {
		color: black;
		font-weight: bold;
	}
	#mainBox {
		width: 54%;
		height: 530px;
		float:left;
		margin-left: 50px;
		display:table-row;
	}
	#corpSignTable {
		width: 75%;
		margin: 50px auto;
		border-spacing: 0;
		border-collapse: collapse;
	}
	#corpSignTable td {
		font-size: 12px;
		width: 55%;
		font-weight: normal;
		border-bottom: 1px solid #F0F0F0;
		height: 70px;
	}
	#corpSignTable th {
		height: 70px;
		width: 40%;
    	text-align: left;
    	border-bottom: 1px solid #F0F0F0;
    	padding-left: 30px;
	}
	.ui.selection.dropdown {
		min-width: 80px !important;
	}
	div[name=menu] {
	    color: #616161;
	    font-size: 18px;
	    height: fit-content !important;
	    line-height: 40px;
	}
	.ui.blue.button {
	background-color:#00679A !important;
	}
	.ui.blue.button:hover {
		background-color: #217BA7 !important;
	}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/corporation/common/corpMenuBar.jsp"/>
	<img src="resources/images/emptyNav.png" style="width: 100%">
	<div id="corpMainArea">
		<div id="sidebar">
			<div id="sidebarText">
				<div>이용약관</div>
				<div class="on">기업 정보 입력</div>
				<div>인증 메일 발송</div>
				<div>회원 가입 완료</div>
			</div>
		</div>
		<div id="mainBox">
			<form action="corpSignup.me" method="post" id="corpSignUp" onsubmit="return validate();" enctype="multipart/form-data">
				<table id="corpSignTable">
					<tr>
						<th style="border: 0;">아이디</th>
						<td colspan="2" style="border: 0;">
							<div class="ui input">
								<input type="text" name="userId" id="userId">
							</div>
							<button class="ui blue button" onclick="return duplicationIdCheck();" style="margin-left: 20px;">중복확인</button>
						</td>
					</tr>
					<tr>
						<th colspan="1" style="height: 10px;"></th>
						<td colspan="2" style="height: 10px;"><span id="idCheckText" style="font-size: 7pt;"></span></td>
					</tr>
					<tr>
						<th style="border: 0;">비밀번호</th>
						<td colspan="2" style="border: 0;">
							<div class="ui input">
								<input type="password" name="userPwd" id="password">
							</div>
						</td>
					</tr>
					<tr>
						<th colspan="1" style="height: 10px;"></th>
						<td colspan="2" align="left" style="height: 10px; font-size: 7pt;"><span id="pass1Check"></span></td>
					</tr>
					<tr>
						<th style="border: 0;">비밀번호 확인</th>
						<td colspan="2" style="border: 0;">
							<div class="ui input">
								<input type="password" name="passCheck" id="passCheck">
							</div>
						</td>
					</tr>
					<tr>
						<th colspan="1" style="height: 10px;"></th>
						<td colspan="2" align="left" style="height: 10px; font-size: 7pt;"><span id="pass2Check"></span></td>
					</tr>
					<tr>
						<th>마케팅부 담당자 명</th>
						<td colspan="2">
							<div class="ui input">
								<input type="text" name="userName" id="userName">
							</div>
						</td>
					</tr>
					<tr>
						<th style="border: 0">기업 명</th>
						<td colspan="2" style="border: 0">
							<div class="ui input">
								<input type="text" name="companyName" id=companyName style="width: 200px;"readonly>
							</div>
						</td>
					</tr>
					<tr>
						<th style="border: 0;">사업자 등록 번호</th>
						<td colspan="2" style="border: 0;">
							<div class="ui input" style="width: 70px;margin-right: 10px;">
								<input type="text" name="corpNum1" id="corpNum1" readonly>
							</div>
							-
							<div class="ui input" style="width: 40px; margin-left: 10px; margin-right: 10px;">
								<input type="text" name="corpNum2" id="corpNum2" readonly>
							</div>
							-
							<div class="ui input" style=" margin-left: 10px; width: 150px;">
								<input type="text" name="corpNum3" id="corpNum3" readonly>
							</div>
							<input type="button" class="ui blue button" id="uploadCorpPicture" style="margin-left: 10px;" value="사진 업로드">
							<input type="hidden" name="cRegistrationNumber" id="cRegistrationNumber">
							<input type="file" id="corpPicture" name="corpPicture" style="display: none;">
						</td>
					</tr>
					<tr>
						<th colspan="1" style="height: 10px;"></th>
						<td colspan="2" style="height: 10px;"><span style="font-size: 7pt; color: gray;">*사진 업로드 버튼을 클릭하여 사업자 등록증을 등록해주세요</span></td>
					</tr>
					<tr>
						<th colspan="1" style="border: 0;"><h4>담당자 전화</h4></th>
						<td colspan="2" style="border: 0;">
							<div class="ui selection dropdown" style="margin-right: 10px;">
								<input type="hidden" name="phone1" id="tel1">
								<i class="dropdown icon"></i>
								<div class="default text">선택</div>
								<div class="menu" name="menu">
									<div class="item" data-value="010">010</div>
									<div class="item" data-value="011">011</div>
									<div class="item" data-value="016">016</div>
									<div class="item" data-value="017">017</div>
									<div class="item" data-value="019">019</div>
								</div>
							</div>
							 - 
							<div class="ui input">
								<input type="text" name="phone2" id="tel2" style="width:80px; margin-left: 10px; margin-right: 10px;">
							</div>
							 - 
							<div class="ui input">
								<input type="text" name="phone3" id="tel3" style="width:80px; margin-left: 10px;">
							</div>
							<input type="hidden" id="userPhone" name="userPhone">
							<input type="button" class="ui blue button" id="phoneCertification" value="인증하기" style="margin-left: 20px;">
						</td>
					</tr>
					<tr>
						<th colspan="1" style="height: 10px;"></th>
						<td colspan="2" style="height: 10px;">
							<div class="ui input">
								<input type="hidden" name="phoneCode" id="phoneCode">
							</div>
							<input type="hidden" class="ui blue button" value="인증 확인" id="phoneCodeCertification">
							<div style="font-size: 7pt; color: forestgreen; display: none; margin-left: 20px;" id="phoneOk">인증 완료</div>
							<div style="font-size: 7pt; color: red; display: none; margin-left: 20px;" id="phoneNo">다시 입력해주세요</div>
						</td>
					</tr>
					<tr>
						<th style="border: 0;"><h4>소재지</h4></th>
						<td style="border: 0;">
							<div class="ui input">
								<input type="text" name="post" id="post" size="7px;" readonly>
							</div>
							<div class="ui input">
								<input type="text" name="address" id="address" size="30px;" style="margin-left: 10px;" readonly>
							</div>
							<input type="hidden" name="userAddress" id="userAddress" style="margin-left: 15px;" readonly>
							<input type="button" class="ui blue button" id="findAddress" style="margin-left: 5px;" value="찾기">
						</td>
						<td style="border: 0;"></td>
					</tr>
					<tr>
						<th></th>
						<td colspan="2">
							<div class="ui input">
								<input type="text" name="detailAddress" id="detailAddress" placeholder="상세주소를 입력해주세요." size="35px;"> 
							</div>
						</td>
					</tr>
					<tr>
						<th style="border: 0;"><h4>담당자 이메일</h4></th>
						<td colspan="2" style="border: 0;">
							<div class="ui input">
								<input type="email" name="userEmail" id="userEmail">
							</div>
							<button class="ui blue button" onclick="return duplicationEmailCheck();" style="margin-left: 20px;">중복확인</button>
						</td>
					</tr>
					<tr>
						<th colspan="1" style="height: 10px;"></th>
						<td colspan="2" style="height: 10px;"><span id="emailCheckText" style="font-size: 7pt;"></span></td>
					</tr>
				</table>
				<div style="width: fit-content; margin: 30px auto;">
					<input type="button" id="signUp" class="ui blue button" value="회원가입">
				</div>
				
			</form>
		</div>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.2/rollups/aes.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.2/rollups/sha256.js"></script>
		<script>
			$(document).on("click", "#signUp", function(){
				var corpSignUp = $("#corpSignUp");
				corpSignUp.submit();
			})
			
			$('.ui.dropdown').dropdown();
			$("#uploadCorpPicture").on("click", function(){
				$("#corpPicture").click();
			});
			
			$("#corpPicture").on("change", function(){
			 	var formData = new FormData();
	            formData.append('file',$("#corpPicture")[0].files[0]);
		         
               	$.ajax({
					url: 'https://ocr.api.friday24.com/business-license',
					enctype: 'multipart/form-data',
					processData: false,
					contentType: false,
					data: formData,
					type: 'post',
					beforeSend : function(xhr){
					    xhr.setRequestHeader("Authorization", "Bearer 7HztRogcOLqkHUYC3a5F");
					  /*   xhr.setRequestHeader("Content-Type", "multipart/form-data"); */
					},
					success:function(data){
						$("#companyName").val(data.license.corpName);
						var bizNum = data.license.bizNum;
						var corpNum1 = bizNum.substr(0, 3);
						var corpNum2 = bizNum.substr(3, 2);
						var corpNum3 = bizNum.substr(5, 5);
						
						$("#cRegistrationNumber").val(bizNum);
						$("#corpNum1").val(corpNum1);
						$("#corpNum2").val(corpNum2);
						$("#corpNum3").val(corpNum3);
					},
					error:function(status){
						//console.log(status); 
					}
				});
			});
			
			$("#findAddress").on("click", function(){
				daum.postcode.load(function(){
			        new daum.Postcode({
			            oncomplete: function(data) {
			            	console.log(data.zonecode);
			            	console.log(data);
			               $("#post").val(data.zonecode);
			               $("#address").val(data.address);
			            }
			        }).open();
			    });
			});
			
			var inval_Arr = new Array(11).fill(false);
			
			function duplicationIdCheck(){
				var userId = $("#userId").val();
				if(userId == ""){
					$("#idCheckText").css("color", "red");
					$("#idCheckText").text("아이디를 입력해주세요.");
					inval_Arr[0] = false;
				}else{
					$.ajax({
						url:"duplicationIdCheck.me",
						type:"post",
						data:{userId:userId},
						success:function(data){
							console.log(data);
							if(data.isDuplicated == true){
								$("#idCheckText").css("color", "red");
								$("#idCheckText").text("사용중인 아이디입니다.");
								inval_Arr[0] = false;
							}else {
								$("#idCheckText").css("color", "forestgreen");
								$("#idCheckText").text("사용가능한 아이디입니다.");
								inval_Arr[0] = true;
							}
						},
						error:function(status){
							console.log(status);
						}
					});
				}
				
				//폼전송이 안되도록!
				return false;
			}
			
			function duplicationEmailCheck(){
				var userEmail = $("#userEmail").val();
				if(userEmail == ""){
					$("#emailCheckText").css("color", "red");
					$("#emailCheckText").text("이메일을 입력해주세요.");
					inval_Arr[9] = false;
				}else{
					$.ajax({
						url:"duplicationEmailCheck.me",
						type:"post",
						data:{userEmail:userEmail},
						success:function(data){
							console.log(data);
							if(data.isDuplicated == true){
								$("#emailCheckText").css("color", "red");
								$("#emailCheckText").text("사용중인 이메일입니다.");
								inval_Arr[9] = false;
							}else {
								$("#emailCheckText").css("color", "forestgreen");
								$("#emailCheckText").text("사용가능한 이메일입니다.");
								inval_Arr[9] = true;
							}
						},
						error:function(status){
							console.log(status); 
						}
					});
				}
				
				//폼전송이 안되도록!
				return false;
			}
			
			// 비밀번호 정규식
			var pattern1 = /[0-9]/; // 숫자  
			var pattern2 = /[a-zA-Z]/; // 문자 
			var pattern3 = /[~!@#$%^&*()_+|<>?:{}]/; // 특수문자
			
			// 전화번호 정규식
			var tel2J = /^[0-9]{3,4}$/;
			var tel3J = /^[0-9]{4}$/;
			
			$("#password").keyup(function(){
				if (!pattern1.test($('#password').val()) || !pattern2.test($('#password').val()) || !pattern3.test($('#password').val()) || $("#password").val().length <= 8) {
					$("#pass1Check").css({"color":"tomato"});
					$("#pass1Check").html("비밀번호는 8자리 이상 문자, 숫자, 특수문자로 구성하여야 합니다.");	
					inval_Arr[1] = false;
				} else {
					$("#pass1Check").css({"color":"green"});
					$("#pass1Check").html("사용가능한 비밀번호 입니다.");	
					inval_Arr[1] = true;
				} 
			});
			$("#passCheck").keyup(function(){
				if ($('#password').val() == $('#passCheck').val()) {
					$("#pass2Check").css({"color":"green"});
					$("#pass2Check").html("비밀번호가 일치합니다.");	
					inval_Arr[2] = true;
				} else {
					$("#pass2Check").css({"color":"tomato"});
					$("#pass2Check").html("비밀번호가 일치하지 않습니다.");	
					inval_Arr[2] = false;
				}
			});
			
			function validate() {
				var msg = "입력한 정보들을 다시 한번 확인해주세요";
				
				if(inval_Arr[10] == false){
					msg = "휴대폰 인증번호를 확인해 주세요!";
				}
				if(inval_Arr[9] == false){
					msg = "이메일을 정확히 입력해주세요!";
				}
				if($("#detailAddress").val() != ""){
					inval_Arr[8] = true;
				}else {
					inval_Arr[8] = false;
					msg = "상세주소를 입력해주세요!";
				}
				
				if($("#address").val() != ""){
					inval_Arr[7] = true;
				}else {
					inval_Arr[7] = false;
					msg = "소재지를 입력해주세요!";
				}
				
				if(tel2J.test($("#tel2").val()) && tel3J.test($("#tel3").val())){
					inval_Arr[6] = true;
				}else {
					inval_Arr[6] = false;
					msg = "올바른 전화번호를 입력해주세요!";
				}
				
				if($("#corpNum1").val() != "" && $("#corpNum2").val() != "" && $("#corpNum3").val() != ""){
					inval_Arr[5] = true;
				}else {
					inval_Arr[5] = false;
					msg = "사업자 등록증 이미지를 등록해주세요!";
				}
				
				if($("#companyName").val() != ""){
					inval_Arr[4] = true;
				}else {
					inval_Arr[4] = false;
					msg = "사업자 등록증 이미지를 등록해주세요!";
				}
				
				if($("#userName").val() != ""){
					inval_Arr[3] = true;
				}else {
					inval_Arr[3] = false;
					msg = "담당자 명을 입력해주세요!";
				}
				
				if(inval_Arr[2] == false){
					msg = "비밀번호가 일치하지 않습니다!";
				}
				if(inval_Arr[1] == false){
					msg = "올바른 비밀번호를 입력해주세요!";
				}
				if(inval_Arr[0] == false){
					msg = "아이디를 다시 입력해주세요!";
				}

				var validAll = true;
				for(var i = 0; i < inval_Arr.length; i++){
					if(inval_Arr[i] == false){
						validAll = false;
					}
				}
				
				var address = $("#post").val() + "/" + $("#address").val() + "/" +  $("#detailAddress").val(); 
			    var passphrase = "1234";
			    var encrypt1 = CryptoJS.AES.encrypt(address, passphrase);
			    var decrypted1 = CryptoJS.AES.decrypt(encrypt1, passphrase);
			 
			    // 암호화 이전의 문자열은 toString 함수를 사용하여 추출할 수 있다.
			    var address1 = decrypted1.toString(CryptoJS.enc.Utf8);
			    
			    $("#userAddress").val(encrypt1);
			    
			    var tel = $("#tel1").val() + "-" + $("#tel2").val() + "-" + $("#tel3").val(); 
			    var encrypt2 = CryptoJS.AES.encrypt(tel, passphrase);
			    var decrypted2 = CryptoJS.AES.decrypt(encrypt2, passphrase );
			 
			    // 암호화 이전의 문자열은 toString 함수를 사용하여 추출할 수 있다.
			    var tel21 = decrypted2.toString(CryptoJS.enc.Utf8);
			    
			   	$("#userPhone").val(encrypt2);
			    
				if(validAll){ // 유효성 모두 통과
					return true;
				} else{
					
					Swal.fire({
					  icon: 'error',
					  text: msg,
					})
						
					return false;
				}
				console.log(inval_Arr);
				return false;
			}
		</script>
	</div>
	<div style="margin-top: 80px;">
		<jsp:include page="/WEB-INF/views/panel/common/footer.jsp"/>
	</div>
	<script>
		$("#phoneCertification").on("click", function(){
			$("#phoneCode").prop("type", "text");
			sendSms();
		});
		$("#phoneCodeCertification").on("click", function(){
			$("#phoneCode").prop("type", "text");
			phoneCheck();
		});
		
		function sendSms() { 
			var tel = $("#tel1").val() + $("#tel2").val() + $("#tel3").val();
			$.ajax({ 
				url: "sendSms.me", 
				data: { receiver: tel }, 
				type: "post", 
				success: function(result) { 
					if (result == "true") { 
						Swal.fire(
							'인증번호 전송 완료!',
							'입력하신 번호로 인증번호를 전송하였습니다!',
							'success'
						) 
						$("#phoneCodeCertification").prop("type", "button");
					} else { 
						Swal.fire(
							'인증번호 전송 실패!',
							'인증번호 전송을 실패하였습니다..',
							'warning'
						)  
					} 
				} 
			}); 
		} 
		
		function phoneCheck() { 
			$.ajax({ 
				url: "smsCheck.me", 
				type: "post", 
				data: { code: $("#phoneCode").val() }, 
				success: function(result) { 
					if (result == "ok") { 
						$("#phoneCode").prop("disabled", true);
						$("#phoneCodeCertification").prop("type", "hidden");
						$("#phoneOk").css("display", "inline-block");
						$("#phoneNo").css("display", "none");
						inval_Arr[10] = true;
					} else { 
						$("#phoneCode").prop("disabled", false);
						$("#phoneOk").css("display", "none");
						$("#phoneNo").css("display", "inline-block");
						inval_Arr[10] = false;
					} 
				} 
			}); 
		}
		
	</script>
</body>
</html>