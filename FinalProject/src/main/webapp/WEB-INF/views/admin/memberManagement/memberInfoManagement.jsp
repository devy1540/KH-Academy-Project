<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	#approvalBtnArea {
		position: relative;
		right: 10px;
		height: 30px;
		float: right;
		margin-bottom: 10px;
	}
	#approvalBtnArea button {
		width: 130px;
		height: 30px;
		background: #EDEBEB;
		font-size: 10pt;
	}
	#searchInput {
		margin-top: 10px;
		margin-left: 10px;
	}
	#searchInput, .ui.action.input {
		width: 240px;
		height: 37px;
		font-size: 11pt;
		right: 10px;
		float: right;
	}
	#adminBoxTable {
		width: 100%;
	}
	#listTable {
		width: 100%;
		border-spacing: 0;
		border-collapse: collapse;
		margin-top: 10px;
		
		/* 드래그 방지용 소스*/
		-ms-user-select: none; 
		-moz-user-select: -moz-none; 
		-webkit-user-select: none; 
		-khtml-user-select: none; 
		user-select:none;
		/* 드래그 방지용 소스*/
	}
	#listTable th {
		font-size: 11pt;
		height: 40px;
	}
	#listTable td {
		font-size: 11pt;
		height: 50px;
	}
	#tableTitle {
		background: #DBDBDB;
		border-top: 1px solid #454545;
	}
	.tableContext {
		border-top: 1px solid #AEAEAE;
		border-bottom: 1px solid #AEAEAE;
		text-align: center;
	}
	#pagingArea {
		margin-top: 40px;
		
		/* 드래그 방지용 소스*/
		-ms-user-select: none; 
		-moz-user-select: -moz-none; 
		-webkit-user-select: none; 
		-khtml-user-select: none; 
		user-select:none;
		/* 드래그 방지용 소스*/
	}
	#pagingArea span {
		margin-left: 5px;
		margin-right: 5px;
		color: black;
		font-size: 10pt;
	}
	#pagingArea span:hover {
		margin-left: 5px;
		margin-right: 5px;
		font-size: 10pt;
		color: dodgerblue;
		cursor: pointer;
	}
	.detail {
		font-size: 9pt;
		background: #EDEBEB;
		width: 80px;
		height: 30px;
	}
  	#choice, .choice {
  		margin: 0 auto;
  		margin-top: 20px;
  		width: fit-content;
  	}
  	#corpTable {
  		width: 70%;
  		margin: 0 auto;
  		border-spacing: 0;
		border-collapse: collapse;
  	}
  	#corpTable th {
  		width: 30%;
  		height: 50px;
  		border-bottom: 1px solid #C5C5C5;
  	}
  	#corpTable td {
  		width: 40%;
  		border-bottom: 1px solid #C5C5C5;
  	}
  	#panelTable {
  		width: 70%;
  		margin: 0 auto;
  		border-spacing: 0;
		border-collapse: collapse;
  	}
  	#panelTable th {
  		width: 30%;
  		height: 50px;
  		border-bottom: 1px solid #C5C5C5;
  	}
  	#panelTable td {
  		width: 40%;
  		border-bottom: 1px solid #C5C5C5;
  	}
  	#userType, #panelLevel, .ui.dropdown {
  		float: right !important;
  		margin-right: 15px;
  		margin-top: 10px;
  		width: 100px;
  		min-width: 100px !important;
  		padding-right: 10px !important;
  	}
</style>
</head>
<body>
	<jsp:include page="../common/adminMenuBar.jsp"/>
	
	<div id="adminBox">
		<table id="adminBoxTable">
			<tr>
				<td>
					<div id="approvalBtnArea">
					
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div id="adminTitle">
						회원 정보 관리
					</div>
				</td>
			</tr>
			<tr>
				<td style="height: fit-content;">
					<form action="memberInfoManagement.memberManagement" method="get">
						<div id="searchInput">
							<div class="ui action input">
				  				<input type="text" name="searchInput" placeholder="패널/기업 명을 입력하세요">
								<button class="ui icon button">
									<i class="search icon"></i>
								</button>
							</div>
						</div>
						
						<select class="ui dropdown" name="panelLevel" id="panelLevel">
							<option value="">패널 등급</option>
							<option value="신규">신규</option>
							<option value="비활성">비활성</option>
							<option value="준활성">준활성</option>
							<option value="활성">활성</option>
							<option value="휴면">휴면</option>
							<option value="블랙">블랙</option>
						</select>
						
						<select class="ui dropdown" name="userType" id="userType">
							<option value="">회원 분류</option>
							<option value="패널">패널</option>
							<option value="기업">기업</option>
						</select>
					</form>
				</td>
			</tr>
		</table>
		<table id="listTable">
			<tr id="tableTitle">
				<th style="width: 10%;">회원 번호</th>
				<th style="width: 15%;">회원 분류</th>
				<th style="width: 30%;">패널명 / 기업명</th>
				<th style="width: 25%;">패널 등급</th><!-- 기업회원 시 기업 회원이라고 명시 -->
				<th style="width: 10%;">가입일</th>
				<th style="width: 10%;">상세보기</th>
			</tr>
			<c:forEach var="m" items="${memberList}">
				<tr class="tableContext">
					<td>${ m.mno }</td>
					<td>${ m.userType }</td>
					<td>
						<c:if test="${ m.userType eq '기업' }">
							${ m.companyName }
						</c:if>
						<c:if test="${ m.userType ne '기업' }">
							${ m.userName }
						</c:if>
					</td>
					<td>
						<c:if test="${ m.userType eq '기업' }">
							기업 회원
						</c:if>
						<c:if test="${ m.userType ne '기업' }">
							${ m.panelLevel }
						</c:if>
					</td>
					<td>${ m.entDate }</td>
					<td><button class="detail">상세 보기</button></td>
				</tr>
			</c:forEach>
		</table>
		<div id="pagingArea" align="center">
			<c:url var="blistFirst" value="memberInfoManagement.memberManagement">
				<c:param name="currentPage" value="${1}"/>
				<c:if test="${ !empty param.searchInput }">
					<c:param name="searchInput" value="${param.searchInput}"/>
				</c:if>
				<c:if test="${ !empty param.panelLevel }">
					<c:param name="panelLevel" value="${param.panelLevel}"/>
				</c:if>
				<c:if test="${ !empty param.userType }">
					<c:param name="userType" value="${param.userType}"/>
				</c:if>
			</c:url>
			<a href="${blistFirst}"><span>[처음]</span></a>&nbsp;
			
			<c:if test="${pi.currentPage <= 1}">
				<span>[이전]</span> &nbsp;
			</c:if>
			<c:if test="${pi.currentPage > 1}">
				<c:url var="blistBack" value="memberInfoManagement.memberManagement">
					<c:param name="currentPage" value="${pi.currentPage - 1}"/>
					<c:if test="${ !empty param.searchInput }">
						<c:param name="searchInput" value="${param.searchInput}"/>
					</c:if>
					<c:if test="${ !empty param.panelLevel }">
						<c:param name="panelLevel" value="${param.panelLevel}"/>
					</c:if>
					<c:if test="${ !empty param.userType }">
						<c:param name="userType" value="${param.userType}"/>
					</c:if>
				</c:url>
				<a href="${blistBack}"><span>[이전]</span></a>&nbsp;
			</c:if>
			
			<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
				<c:if test="${p eq pi.currentPage }">
					<span style="color: #4169E1; font-weight: bold; font-size: 15pt;">${ p }</span>
				</c:if>
				<c:if test="${p ne pi.currentPage }">
					<c:url var="blistCheck" value="memberInfoManagement.memberManagement">
						<c:param name="currentPage" value="${ p }"/>
						<c:if test="${ !empty param.searchInput }">
							<c:param name="searchInput" value="${param.searchInput}"/>
						</c:if>
						<c:if test="${ !empty param.panelLevel }">
							<c:param name="panelLevel" value="${param.panelLevel}"/>
						</c:if>
						<c:if test="${ !empty param.userType }">
							<c:param name="userType" value="${param.userType}"/>
						</c:if>
					</c:url>
					<a href="${ blistCheck }"><span>${ p }</span></a>
				</c:if>
				
			</c:forEach>
			
			<c:if test="${pi.currentPage < pi.maxPage}">
				<c:url var="blistNext" value="memberInfoManagement.memberManagement">
					<c:param name="currentPage" value="${pi.currentPage + 1}"/>
					<c:if test="${ !empty param.searchInput }">
						<c:param name="searchInput" value="${param.searchInput}"/>
					</c:if>
					<c:if test="${ !empty param.panelLevel }">
						<c:param name="panelLevel" value="${param.panelLevel}"/>
					</c:if>
					<c:if test="${ !empty param.userType }">
						<c:param name="userType" value="${param.userType}"/>
					</c:if>
				</c:url>
				&nbsp;<a href="${blistNext}"><span>[다음]</span></a>
			</c:if>
			<c:if test="${pi.currentPage >= pi.maxPage}">
				&nbsp; <span>[다음]</span>
			</c:if>
			
			<c:url var="blistEnd" value="memberInfoManagement.memberManagement">
				<c:param name="currentPage" value="${pi.maxPage}"/>
				<c:if test="${ !empty param.searchInput }">
					<c:param name="searchInput" value="${param.searchInput}"/>
				</c:if>
				<c:if test="${ !empty param.panelLevel }">
					<c:param name="panelLevel" value="${param.panelLevel}"/>
				</c:if>
				<c:if test="${ !empty param.userType }">
					<c:param name="userType" value="${param.userType}"/>
				</c:if>
			</c:url>
			<a href="${blistEnd}"><span>[마지막]</span></a>&nbsp;
		</div>
	</div>
	
	<div class="ui modal" id="panel">
		<div class="header">패널 회원</div>
		<div class="scrolling content">
			<div>
				<table id="panelTable">
					<tr>
						<th>패널 번호</th>
						<td colspan="3">77092</td>
					</tr>
					<tr>
						<th>회원명</th>
						<td colspan="3">윤재영</td>
					</tr>
					<tr>
						<th>아이디</th>
						<td colspan="3">yychani</td>
					</tr>
					<tr>
						<th>패널 등급</th>
						<td colspan="3">활성 회원</td>
					</tr>
					<tr>
						<th style="width: 10%">생년월일</th>
						<td style="width: 40%">1994-11-12</td>
						<th style="width: 10%">성별</th>
						<td style="width: 40%">남성</td>
					</tr>
					<tr>
						<th>휴대폰 번호</th>
						<td colspan="3">010-5534-8519</td>
					</tr>
					<tr>
						<th>이메일</th>
						<td colspan="3">yychani94@gmail.com</td>
					</tr>
					<tr>
						<th>주소</th>
						<td colspan="3">06269/서울 강남구 남부순환로363길 12-37/B102호</td>
					</tr>
					<tr>
						<th>최근 리서치 참여일</th>
						<td colspan="3">2020-01-16</td>
					</tr>
					<tr>
						<th>회원정보 수정일</th>
						<td colspan="3">2020-01-13</td>
					</tr>
					<tr>
						<th>보유 리워드 량</th>
						<td colspan="3">375 p</td>
					</tr>
					<tr>
						<th>캐시아웃 량</th>
						<td colspan="3">20000원</td>
					</tr>
					<tr>
						<th>3진 아웃 경고 횟수</th>
						<td colspan="3">0 회</td>
					</tr>
					<tr>
						<th>캐시아웃 계좌 번호</th>
						<td colspan="3">043-110409-01-026(기업)</td>
					</tr>
				</table>
			</div>
		</div>
		<div class="actions">
		    <div class="ui cancel button">Cancel</div>
  		</div>
	</div>
	
	<div class="ui modal" id="corp">
		<div class="header">기업 회원</div>
		<div class="scrolling content">
			<div>
				<table id="corpTable">
					<tr>
						<th>기업 번호</th>
						<td colspan="2">3723</td>
					</tr>
					<tr>
						<th>기업명</th>
						<td colspan="2">(주) 오렌지레드 컴퍼니</td>
					</tr>
					<tr>
						<th>아이디</th>
						<td colspan="2">orangeRed</td>
					</tr>
					<tr>
						<th>사업자 등록 번호</th>
						<td>214-88-49333</td>
						<td><button id="companyPictureBtn" style="height: 28px; font-size: 9pt; background: #EDEBEB;">사업자 등록증 보기</button></td>
					</tr>
					<tr>
						<th>소재지</th>
						<td colspan="2">06234/서울 강남구 테헤란로14길 6/2층 C클래스</td>
					</tr>
					<tr>
						<th>마케팅부 담당자 명</th>
						<td colspan="2">김진호</td>
					</tr>
					<tr>
						<th>담당자 휴대폰 번호</th>
						<td colspan="2">010-7660-7771</td>
					</tr>
					<tr>
						<th>담당자 이메일</th>
						<td colspan="2">programmer7771@gmail.com</td>
					</tr>
				</table>
			</div>
		</div>
		<div class="actions">
		    <div class="ui cancel button">Cancel</div>
  		</div>
	</div>
	
	<div class="ui tiny modal" id="companyPicture">
		<div class="header">기업 회원</div>
		<div class="scrolling content">
			<div>
				<img src="/survway/resources/images/noImage.png" id="corpImage" style="width: 100%;">
			</div>
		</div>
		<div class="actions">
			<div class="ui button" id="download">Download</div>
		    <div class="ui cancel button" id="companyPictureClose">Cancel</div>
  		</div>
	</div>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.2/rollups/aes.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.2/rollups/sha256.js"></script>
	<script>
		$(document).on("click", "#download", function(){
			$.ajax({
				url:"fileDown.memberManagement",
				type:"post",
				data:{
					file:$("#corpImage").prop("src")
				},
				success:function(data){
					console.log(data);
				}
			})
		});
		$("#companyPictureBtn").on("click", function(){
			$("#companyPicture").modal("show");
		});
		$("#companyPictureClose").on("click",function(){
			$('#corp').modal('show');
		});
		$("#nextBtn").on("click", function(){
			$('#research').modal('show');
		});
		$(".detail").on("click", function(){
			var mno = $(this).parent().siblings().eq(0).text();
			var type = $(this).parent().siblings().eq(1).text();
			
			$.ajax({
				url:"selectMember.memberManagement",
				type:"post",
				data:{mno:mno},
				success:function(data){
					console.log(data);
					var address = data.member.userAddress;
					var passphrase = "1234";
			        var decrypted1 = CryptoJS.AES.decrypt(address, passphrase);
			        var address1 = decrypted1.toString(CryptoJS.enc.Utf8);
			        
			        var phone = data.member.userPhone;
					var passphrase = "1234";
			        var decrypted1 = CryptoJS.AES.decrypt(phone, passphrase);
			        var phone1 = decrypted1.toString(CryptoJS.enc.Utf8);
			        
					if(type == '기업'){
						$("#corp td").eq(0).text(data.member.mno);
						$("#corp td").eq(1).text(data.member.companyName);
						$("#corp td").eq(2).text(data.member.userId);
						$("#corp td").eq(3).text(data.member.cRegistrationNumber);
						$("#corp td").eq(5).text(address1);
						$("#corp td").eq(6).text(data.member.userName);
						$("#corp td").eq(7).text(phone1);
						$("#corp td").eq(8).text(data.member.userEmail);
						if(data.member.changeName != "" && data.member.changeName != null){
							console.log("changeName없다.")
							$("#corpImage").prop("src", "/survway/resources/uploadFiles/" +data.member.changeName );
						}else {
							$("#corpImage").prop("src", "/survway/resources/images/noImage.png");
						}
						$('#corp').modal('show');
					}else{
						$("#panel td").eq(0).text(data.member.mno);
						$("#panel td").eq(1).text(data.member.userName);
						$("#panel td").eq(2).text(data.member.userId);
						$("#panel td").eq(3).text(data.member.panelLevel);
						$("#panel td").eq(4).text(data.member.panelBirthday);
						$("#panel td").eq(5).text((data.member.panelGender == 'M')? "남성" : "여성");
						$("#panel td").eq(6).text(phone1);
						$("#panel td").eq(7).text(data.member.userEmail);
						$("#panel td").eq(8).html(address1.split("/")[0] + "   " + address1.split("/")[1] + "<br><br>" + address1.split("/")[2]);
						$("#panel td").eq(9).text(data.member.researchResponseDate);
						$("#panel td").eq(10).text(data.member.modifyDate);
						$("#panel td").eq(11).text(data.member.panelRewordPoint + " p");
						$("#panel td").eq(12).text(data.member.cashoutAmount + "원");
						$("#panel td").eq(13).text(data.member.ternaryCount + "회");
						$("#panel td").eq(14).text(data.member.withdrawAccount);
						$('#panel').modal('show');
					}
				},
				error:function(status){
					console.log(status);
				}
			});
		});
		$("#approvalBtn").on("click", function(){
			Swal.fire({
			  title: '정말 승인하시겠습니까?',
			  text: "이 결정은 되돌릴 수 없습니다!",
			  icon: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: 'Yes'
			}).then((result) => {
			  if (result.value) {
			    Swal.fire(
			      '승인!',
			      '이 리서치는 승인되었습니다.',
			      'success'
			    )
			  }else {
				  $('#research').modal('show');
			  }
			})
		});
		$("#referBtn").on("click", function(){
			const start = async function() {
				const { value: text } = await Swal.fire({
					  input: 'textarea',
					  inputPlaceholder: '반려 사유를 적어주세요..',
					  inputAttributes: {
					    'aria-label': 'Type your message here'
					  },
					  showCancelButton: true,
					  inputValidator: (value) => {
					    if (!value) {
					      return '반려 사유를 꼭 적어주세요!'
					    }
					  }
				});
	
				if (text) {
					Swal.fire({
					  title: '정말 반려하시겠습니까?',
					  text: "이 결정은 되돌릴 수 없습니다!",
					  icon: 'warning',
					  showCancelButton: true,
					  confirmButtonColor: '#3085d6',
					  cancelButtonColor: '#d33',
					  confirmButtonText: 'Yes'
					}).then((result) => {
					  if (result.value) {
						  Swal.fire(
				      		'반려!',
				      		'이 리서치는 반려되었습니다.',
				      		'success'
				    		)
					  }else {
						  $('#research').modal('show');
					  }
					})
				}
			}
			start();
		});
		$(".ui.dropdown").dropdown();
		$(".topMenu:nth-child(1)").addClass("active");
		$(".topMenu:nth-child(1)").find(".innerMenu:nth-child(1)").addClass("on");
	</script>
  	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  	<script>
  		/* $(function() {
		 	$( "#sortable" ).sortable({
		 		placeholder: "ui-state-highlight"
		 	});
		 	$( "#sortable" ).disableSelection();
		 }); */
  	</script>
</body>
</html>