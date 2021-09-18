<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<jsp:include page="/WEB-INF/views/panel/common/head.jsp"/>
</head>
<style>
.ui.button {
	background: #00679A !important;
	margin: 0;
}
.ui.selection.dropdown {
	min-width: 80px;
}
	#joinform { 
  		width: 60% !important;
  		margin: 0 auto;
  		border-spacing: 0;
		border-collapse: collapse;
  	}
  	#joinform th {
  		width: 35%;
  		height: 70px;
  		border-bottom: 1px solid #C5C5C5;
  		text-align: left;
  		padding-left: 6%;
  	}
  	#joinform td {
  		width: 65%;
  		border-bottom: 1px solid #C5C5C5;
  		padding-left: 5% !important;
  	}
  	#accountTable { 
  		width: 60% !important;
  		margin: 0 auto;
  		border-spacing: 0;
		border-collapse: collapse;
  	}
  	#accountTable th {
  		width: 25%;
  		height: 70px;
  		border-bottom: 1px solid #C5C5C5;
  		text-align: left;
  		padding-left: 6%;
  	}
  	#accountTable td {
  		width: 75%;
  		border-bottom: 1px solid #C5C5C5;
  		padding-left: 5% !important;
  	}
  	.ui.dropdown.selection {
  		min-width: 150px;
  	}
  	#bankCode {
  		cursor: pointer;
	    word-wrap: break-word;
	    line-height: 1em;
	    white-space: normal;
	    outline: 0;
	    -webkit-transform: rotateZ(0);
	    transform: rotateZ(0);
	    min-width: 14em;
	    min-height: 2.71428571em;
	    background: #fff;
	    display: inline-block;
	    padding: .78571429em 3.2em .78571429em 1em;
	    color: rgba(0,0,0,.87);
	    -webkit-box-shadow: none;
	    box-shadow: none;
	    border: 1px solid rgba(34,36,38,.15);
	    border-radius: .28571429rem;
	    -webkit-transition: width .1s ease,-webkit-box-shadow .1s ease;
	    transition: width .1s ease,-webkit-box-shadow .1s ease;
	    transition: box-shadow .1s ease,width .1s ease;
	    transition: box-shadow .1s ease,width .1s ease,-webkit-box-shadow .1s ease;
  	}
</style>
<body>
	<c:if test="${ loginUser != null }">
		<div class="wrap">
			<jsp:include page="/WEB-INF/views/panel/common/header.jsp"/>
			<section class="container">
				<br />
				<table id="titleTable" height="10px;" width="99%;">
					<tr>
						<td id="menuTitle">내 정보 관리</td>
						<td id="pagePath">
							<div class="ui breadcrumb">
								<a class="section" id="depth1" href="panelMain.panel">Home</a>
								<i class="right angle icon divider"></i>
								<a class="section" id="depth2" href="myInfo.panel">마이페이지</a>
								<i class="right angle icon divider"></i>
								<div class="active section" id="depth3">내 정보 관리</div>
							</div>  <!-- .ui .breadcrumb end -->
						</td>
					</tr>
				</table>  <!-- #titleTable end -->
				
				<div class="sectionLine">
					<hr>
				</div>  <!-- .sectionLine end -->
				
				<div class="infoConfirm" style="width: 100%;">
					<form id="updateForm" action="updateMemberInfo.me" method="post" style="width: inherit;">
						<table align="center" id="joinform" style="width: inherit;">
							<tr>
								<th class="tdLabelArea">
									아이디
								</th>
								<td colspan="3" class="inputArea">
									<div class="ui">
										<h4>${ loginUser.userId }</h4>
									</div>
								</td>
							</tr>
							
							<tr>
								<th class="tdLabelArea">
									<h4>비밀번호</h4>
								</th>
								<td colspan="3" class="inputArea">
									<div class="ui input">
										<button class="ui blue button" type="button" id="changePwdBtn">비밀번호 변경</button>
									</div>
								</td>
							</tr>
							
							
							<tr>
								<th class="tdLabelArea">
									<h4>이름</h4>
								</th>
								<td colspan="3" class="inputArea">
									<div class="ui">
										<h4>${ loginUser.userName }</h4>
									</div>
								</td>
							</tr>
							
							<tr>
								<th class="tdLabelArea">
									<h4>생년월일</h4>
								</th>
								<td colspan="3" class="inputArea">
									<div class="ui">
										<h4>${ loginUser.panelBirthday }</h4>
									</div>
								</td>
							</tr>
							
							<tr>
								<th class="tdLabelArea">
									<h4>성별</h4>
								</th>
								<td colspan="3" class="inputArea">
									<h4 id="gender"></h4>
								</td>
							</tr>
							<tr>
								<th class="tdLabelArea"><h4>휴대전화</h4></th>
								<td colspan="3" class="inputArea">
									<h4 id="phone"></h4>
								</td>
							</tr>
							
							<tr>
								<th class="tdLabelArea"><h4>주소</h4></th>
								<td colspan="3" class="inputArea">
									<div class="ui input" >
										<input type="hidden" id="userAddress" name="userAddress" readonly/>
										<input type="text" name="post" id="post" size="7px;" readonly>
									</div>
									<div class="ui input" style="margin-left: 15px; margin-right: 15px;" >
										<input type="text" name="address" id="address" size="25px;" readonly>
									</div>
									<button id="findAddress" class="ui blue button" type="button">찾기</button>
								</td>
							</tr>
							
							<tr>
								<th></th>
								<td colspan="3" class="inputArea">
									<div class="ui input">
										<input type="text" name="detailAddress" id="detailAddress" size="35px;">
									</div>
								</td>
							</tr>
							
							<tr>
								<th class="tdLabelArea">
									<h4>이메일</h4>
								</th>
								<td colspan="2" class="inputArea">
									<div class="ui input">
										<h4>${ loginUser.userEmail }</h4>
									</div>
								</td>
								<td></td>
							</tr>
							
							<tr>
								<th class="tdLabelArea">
									<h4>추천인 코드</h4>
								</th>
								<td colspan="3" class="inputArea">
									${ loginUser.referPanelCode }
								</td>
							</tr>
						</table>  <!-- #joinForm end -->
						
						<div style="margin: 20px auto; width: fit-content">
							<button type="button" class="ui blue button" id="updateBtn">정보수정</button>
							<button type="reset" style="margin-left: 10px;" class="ui blue button" onclick="location.href='panelMain.panel'">메인으로</button>
						</div>
					</form>
				</div>  <!-- infoConfirm end -->
				
				<br />
				
				<h4 class="ui horizontal divider header" style="font-size: 13pt;">
					<i class="won sign icon"></i>
					<span style="font-size: 18pt;">계좌 정보</span> <span style="color: #BEBEBE; font-weight: normal; font-size: 9pt;">※ 현금이체를 신청하실 경우에만 등록하세요</span>
				</h4>
				
				<table id="accountTable">
					<tr>
						<th>은행 명</th>
						<td colspan="2">
							<select id="bankCode">
								<option value=""> 은행 명 </option>
								<option value="002">KDB산업은행</option>
								<option value="003">IBK기업은행</option>
								<option value="004">KB국민은행</option>
								<option value="007">수협중앙회</option>
								<option value="011">NH농협은행</option>
								<option value="020">우리은행</option>
								<option value="023">SC제일은행</option>
								<option value="027">한국씨티은행</option>
								<option value="031">대구은행</option>
								<option value="032">부산은행</option>
								<option value="034">광주은행</option>
								<option value="035">제주은행</option>
								<option value="037">전북은행</option>
								<option value="039">경남은행</option>
								<option value="045">새마을금고</option>
								<option value="050">상호저축은행</option>
								<option value="081">KEB하나은행</option>
								<option value="088">신한은행</option>
								<option value="089">케이뱅크</option>
								<option value="090">카카오은행</option>
							</select>
						</td>
						<td></td>
					</tr>
					<tr>
						<th>예금주</th>
						<td>${ loginUser.userName }</td>
					</tr>
					<tr>
						<th>계좌번호</th>
						<td style="padding-top: 15px; padding-bottom: 15px;">
							<div class="ui input" style="width: 300px;">
								<input type="text" id="bankAccount" placeholder="숫자만 기입해 주세요">
							</div>
							<p style="font-size: 11px; color: #3e729a; margin-top: 20px;">
								※계좌번호 입력 실수, 계좌주 오류 등으로 인한 사고는 Survway가 책임지지 않습니다.<br>
								※보통예금계좌만 등록해주세요. (CMA, 가상계좌, 적금 등은 이체 불가)<br>
								※농협의 경우 단위농협과 농협중앙회를 확인하시고 입력해주세요. (농협고객센터 1588-2100)<br>
							</p>						
						</td>
					</tr>
				</table>
				<div style="margin: 20px auto; width: fit-content">
					<button type="button" class="ui blue button" id="updateAccount">계좌 저장</button>
				</div>
				
				
				<c:if test="${ !empty param.message }">
					<c:if test="${ param.message eq 'success' }">
						<script>
							Swal.fire('수정완료', '개인정보수정이 완료되었습니다', 'success');
						</script>
					</c:if>
					<c:if test="${ param.message eq 'fail' }">
						<script>
							Swal.fire('수정완료', '개인정보 수정을 실패했습니다.', 'warning');
						</script>
					</c:if>
				</c:if>
			</section>  <!-- container end -->
			<jsp:include page="/WEB-INF/views/panel/common/footer.jsp"/>
		</div>  <!-- wrap end -->
		
		<div class="ui basic modal" id="changePwdModal">
			<div class="ui icon header">
				<h2>비밀번호 변경</h2>
			</div>
			<div class="content" align="center">
				<form id="changePwdModalForm" action="updatePassword.me" method="post">
					<table style="width: 450px; height: 200px;">
						<tr>
							<td align="right" style="width: 32%;">
								<div style="width: 100%; text-align: left;">
									현재 비밀번호
								</div>
							</td>
							<td style="width: 68%;"align="center">
								<div class="ui input">
									<input type="hidden" name="mno" value="${ loginUser.mno }" />
									<input type="password" name="userPwd" id="userPwd"/>
								</div>
							</td>
						</tr>
						<tr>
							<td style="height: 30px;"></td>
							<td></td>
						</tr>
						<tr>
							<td align="right">
								<div style="width: 100%; text-align: left;">
									새 비밀번호
								</div>
							</td>
							<td align="center">
								<div class="ui input">
									<input type="password" name="changePwd" id="changePwd"/>
								</div>
							</td>
						</tr>
						<tr>
							<td></td>
							<td align="center" style="font-size: 7pt; font-weight: bold; height: 26px;"><span id="pass1Check"></span></td>
						</tr>
						<tr>
							<td align="right">
								<div style="width: 100%; text-align: left;">
									새 비밀번호 확인
								</div>
							</td>
							<td align="center">
								<div class="ui input">
									<input type="password" name="changePwd2" id="changePwd2"/>
								</div>
							</td>
						</tr>
						<tr>
							<td></td>
							<td align="center" style="font-size: 7pt; font-weight: bold; height: 26px;"><span id="pass2Check"></span></td>
						</tr>
					</table>
				</form>  <!-- #changePwdModalForm end -->
			</div>  <!-- .contents end -->
			<div class="actions">
				<div class="ui green ok inverted button" id="okModalBtn">
					<i class="checkmark icon"></i> 변경하기
				</div>  <!-- #okModalBtn end -->
				<div class="ui red basic cancel inverted button" id="cancelModalBtn">
					<i class="remove icon"></i> 취소하기
				</div>  <!-- cancelModalBtn end -->
			</div>  <!-- .actions end -->
		</div>  <!-- #changePwdModal end -->
	</c:if>
	<c:if test="${ loginUser == null }">
		<script>
			location.href="panelResult.panel?message=notLoginAccess";
		</script>
	</c:if>


	<script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.2/rollups/aes.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.2/rollups/sha256.js"></script>
	<script>
		$(function(){
			var bankAccount = "${ loginUser.withdrawAccount }";
			
			var bankCode = bankAccount.split("/")[0];
			var account = bankAccount.split("/")[1];
			
			console.log(bankCode);
			$("#bankCode").val(bankCode).prop("selected", "selected");
			$("#bankAccount").val(account)
		});
		
// 		드롭다운
		$('.ui.dropdown').dropdown();
		
// 		성별
		if ("${ loginUser.panelGender }" == "M") {
			$("#gender").text("남");
		} else {
			$("#gender").text("여");
		}
		
// 		성별, 주소 복호화
		var passphrase = "1234";
		var decryptedPhone = CryptoJS.AES.decrypt("${ loginUser.userPhone }", passphrase).toString(CryptoJS.enc.Utf8);
		var decryptedAddress = CryptoJS.AES.decrypt("${ loginUser.userAddress }", passphrase).toString(CryptoJS.enc.Utf8);
		var resultAddress = decryptedAddress.split("/"); //0 : post, 1 : address, 2 : detailAddress
		
		$("#phone").text(decryptedPhone);
		$("#post").val(resultAddress[0]);
		$("#address").val(resultAddress[1]);
		$("#detailAddress").val(resultAddress[2]);
		
// 		주소찾기
		$("#findAddress").on("click", function(){
			daum.postcode.load(function(){
		        new daum.Postcode({
		            oncomplete: function(data) {
		               $("#post").val(data.zonecode);
		               $("#address").val(data.address);
		               $("#detailAddress").val("").focus();
		            }
		        }).open();
		    });
		});
		
		
// 		정보수정버튼
		$("#updateBtn").click(function(){
			if($("#detailAddress").val() == "") {
				Swal.fire('경고', '상세주소를 입력해주세요', 'warning');
			} else {
				encryptAddress();
				$("#updateForm").submit();
			}
		});
		
// 		주소 암호화
		function encryptAddress() {
			var userAddress = $("#post").val() + "/" + $("#address").val() + "/" + $("#detailAddress").val();
			var encryptAddress = CryptoJS.AES.encrypt(userAddress, passphrase);
			$("#userAddress").val(encryptAddress);
		}
		
// 		비밀번호정규식 및 배열
		var inval_Arr = new Array(false, false);
		var pattern1 = /[0-9]/; // 숫자 
		var pattern2 = /[a-zA-Z]/; // 문자 
		var pattern3 = /[~!@#$%^&*()_+|<>?:{}]/; // 특수문자
		
// 		userPwd : 입력한 현재 pwd, changePwd : 변경할 비밀번호, changePwd2 : 변경할 비밀번호2
		$("#changePwd").keyup(function(){
			if (!pattern1.test($('#changePwd').val()) || !pattern2.test($('#changePwd').val()) || !pattern3.test($('#changePwd').val()) || $("#changePwd").val().length <= 8) {
				$("#pass1Check").css({"color":"orangered"});
				$("#pass1Check").html("비밀번호는 8자리 이상 문자, 숫자, 특수문자로 구성하여야 합니다.");	
				console.log("pass1Check 테스트 - no");
				inval_Arr[0] = false;
			} else {
				$("#pass1Check").css({"color":"lime"});
				$("#pass1Check").html("사용가능한 비밀번호 입니다.");	
				console.log("pass1Check 테스트 - yes");
				inval_Arr[0] = true;
			} 
		});
		$("#changePwd2").keyup(function(){
			if ($('#changePwd').val() == $('#changePwd2').val()) {
				$("#pass2Check").css({"color":"lime"});
				$("#pass2Check").html("비밀번호가 일치합니다.");
				inval_Arr[1] = true;
			} else {
				$("#pass2Check").css({"color":"orangered"});
				$("#pass2Check").html("비밀번호가 일치하지 않습니다.");	
				inval_Arr[1] = false;
			}
		});
		
// 		모달창 오픈
		$("#changePwdBtn").click(function() {
			$("#changePwdModal").modal("show");
			$("#userPwd").val("");
			$("#changePwd").val("");
			$("#changePwd2").val("");
			$("#pass1Check").text("");
			$("#pass2Check").text("");
			
		});
		
// 		모달확인버튼
		$("#okModalBtn").click(function(){
			var ajaxPwd = $("#userPwd").val();
			if(ajaxPwd == "" || $("#changePwd").val() == "" || $("#changePwd2").val() == "") {
				Swal.fire('경고', '올바르게 입력 후 다시 시도해주세요', 'warning');
			} else {
				if(inval_Arr[0] == false || inval_Arr[1] == false) {
					Swal.fire('경고', '올바르게 입력 후 다시 시도해주세요', 'warning');
				} else {
					$.ajax({
						url: "checkPasswordAjax.me",
						type: "post",
						data : {
							userId: "${ loginUser.userId }",
							ajaxPwd: ajaxPwd
						},
						success: function(data) {
							if(data.isEqual == true) {
								console.log(data.isEqual);
								$("#changePwdModalForm").submit();
							} else {
								Swal.fire('경고', '현재 비밀번호가 일치하지 않습니다', 'warning');
								return false;
							}
						},
						error: function(data) {
							console.log("실패");
						}
					});
				}
			}
		});
		
		// 계좌번호 저장
		$(document).on("click", "#updateAccount",function(){
			var bankCode = $("#bankCode").val();
			var bankAccount = $("#bankAccount").val();
			var mno = "${ loginUser.mno }";
				Swal.fire({
					title: '계좌번호를 저장하시겠습니까?',
					text: "신중하세요! 캐시아웃시 입금될 계좌입니다.",
					icon: 'warning',
					showCancelButton: true,
					confirmButtonColor: '#3085d6',
					cancelButtonColor: '#d33',
					confirmButtonText: 'Yes'
				}).then((result) => {
				  	if (result.value) {
				  		$.ajax({
							url:"updateAccount.me",
							type:"post",
							data: {
								bankCode:bankCode,
								bankAccount:bankAccount,
								mno:mno
							},
							success:function(data){
								console.log(data);
								Swal.fire(
									'저장 완료!',
									'계좌번호가 저장되었습니다.',
									'success'
							    )
							    setTimeout(function(){
							        location.href = "panelResult.panel?message=updateAccount"
							    },1500)
							},
							error:function(data){
								
							}
						});
				  	}
				})
			
		});
	</script>
</body>
</html>












