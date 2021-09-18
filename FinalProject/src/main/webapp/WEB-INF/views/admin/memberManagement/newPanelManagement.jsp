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
	}
	#searchInput, .ui.action.input {
		width: 200px;
		height: 37px;
		font-size: 11pt;
		position: relative;
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
		font-size: 10pt;
	}
	#pagingArea span:hover {
		margin-left: 5px;
		margin-right: 5px;
		font-size: 10pt;
		cursor: pointer;
	}
	.detail {
		font-size: 9pt;
		background: #EDEBEB;
		width: 80px;
		height: 30px;
	}
  	#sortable { 
  		list-style-type: none; 
  		margin: 0; 
  		padding: 0; 
  		width: 60%;
  		margin: 0 auto; 
  		margin-bottom: 30px;
  	}
  	#sortable li { 
  		margin: 0 5px 12px 5px;
  		padding: 10px; 
  		font-size: 1.2em; 
  		height: fit-content;
  		border-radius: 7px;
  	}
 	html>body #sortable li { 
	  	height: fit-content;
	  	line-height: 1.2em; 
	}
  	.ui-state-highlight { 
  		height: 3.5em; 
  		line-height: 1.2em; 
  	}
  	.ui-sortable-placeholder {
  		background: white !important;
  		border-color: white !important;
  	}
  	#outbreak {
  		margin: 20px auto;
  		width: 70%;
  		height: 10%;
  		border-radius: 7px;
  		border: 1px solid #C5C5C5;
  		background: #F6F6F6;
  		padding: 15px;
  		margin-top: 30px;
  	}
  	#choice, .choice {
  		margin-left:20%; 
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
						신규 패널 관리
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div id="searchInput">
						<form action="newPanelManagement.memberManagement" method="get">
							<div class="ui action input">
				  				<input type="text" name="searchInput" placeholder="패널명을 입력하세요">
								<button class="ui icon button">
									<i class="search icon"></i>
								</button>
							</div>
						</form>
					</div>
				</td>
			</tr>
		</table>
		<table id="listTable">
			<tr id="tableTitle">
				<th style="width: 10%;">회원 번호</th>
				<th style="width: 40%;">패널명</th>
				<th style="width: 40%;">가입일</th>
				<th style="width: 10%;">상세보기</th>
			</tr>
			<c:forEach var="m" items="${ newPanelList }">
				<tr class="tableContext">
					<td>${ m.mno }</td>
					<td>${ m.userName }</td>
					<td>${ m.entDate }</td>
					<td><button class="detail">상세 보기</button></td>
				</tr>
			</c:forEach>
		</table>
		<div id="pagingArea" align="center">
			<c:url var="newPanelFirst" value="newPanelManagement.memberManagement">
				<c:param name="currentPage" value="${ 1 }"/>
				<c:if test="${ !empty param.searchInput }">
					<c:param name="searchInput" value="${ param.searchInput }"/>
				</c:if>
			</c:url>
			<a href="${ newPanelFirst }"><span>[처음]</span></a>&nbsp;
			
			<c:if test="${ pi.currentPage <= 1 }">
				<span>[이전]</span> &nbsp;
			</c:if>
			<c:if test="${ pi.currentPage > 1 }">
				<c:url var="newPanelBack" value="newPanelManagement.memberManagement">
					<c:param name="currentPage" value="${ pi.currentPage - 1 }"/>
					<c:if test="${ !empty param.searchInput }">
						<c:param name="searchInput" value="${ param.searchInput }"/>
					</c:if>
				</c:url>
				<a href="${ newPanelBack }"><span>[이전]</span></a>&nbsp;
			</c:if>
			
			<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
				<c:if test="${ p eq pi.currentPage }">
					<span style="color: #4169E1; font-weight: bold; font-size: 15pt;">${ p }</span>
				</c:if>
				<c:if test="${p ne pi.currentPage }">
					<c:url var="newPanelEachPage" value="newPanelManagement.memberManagement">
						<c:param name="currentPage" value="${ p }"/>
						<c:if test="${ !empty param.searchInput }">
							<c:param name="searchInput" value="${ param.searchInput }"/>
						</c:if>
					</c:url>
					<a href="${ newPanelEachPage }"><span>${ p }</span></a>
				</c:if>
			
			</c:forEach>
			
			<c:if test="${ pi.currentPage < pi.maxPage }">
				<c:url var="newPanelNext" value="newPanelManagement.memberManagement">
					<c:param name="currentPage" value="${ pi.currentPage + 1 }"/>
					<c:if test="${ !empty param.searchInput }">
						<c:param name="searchInput" value="${ param.searchInput }"/>
					</c:if>
				</c:url>
				&nbsp;<a href="${ newPanelNext }"><span>[다음]</span></a>
			</c:if>
			<c:if test="${ pi.currentPage >= pi.maxPage }">
				&nbsp; <span>[다음]</span>
			</c:if>
			
			<c:url var="newPanelEnd" value="newPanelManagement.memberManagement">
				<c:param name="currentPage" value="${ pi.maxPage }"/>
				<c:if test="${ !empty param.searchInput }">
					<c:param name="searchInput" value="${ param.searchInput }"/>
				</c:if>
			</c:url>
			<a href="${ newPanelEnd }"><span>[마지막]</span></a>&nbsp;
		</div>
	</div>
	
	<div class="ui modal" id="panel">
		<div class="header">패널 회원</div>
		<div class="scrolling content">
			<div>
				<table id="panelTable">
					<tr>
						<th>회원번호</th>
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
				</table>
			</div>
			
		</div>
		<div class="actions">
			<div class="ui approve button" id="nextBtn">Next</div>
		    <div class="ui cancel button">Cancel</div>
  		</div>
	</div>
	
	<div class="ui modal" id="research">
		<div class="header">Thanks Survey</div>
		<div class="scrolling content">
			<div>
				<ul id="sortable">
					
			  		
				</ul>
				<hr>
			</div>
		</div>
		<div class="actions">
		    <div class="ui approve button" id="approvalBtn">Approve</div>
		    <div class="ui approve button" id="referBtn">Refer</div>
		    <div class="ui cancel button">Cancel</div>
  		</div>
	</div>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.2/rollups/aes.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.2/rollups/sha256.js"></script>
	<script>
		$("#nextBtn").on("click", function(){
			
			var mno = $(document).find("#mno").val();
			$.ajax({
				url:"selectPanelTs.memberManagement",
				type:"post",
				data:{
					mno:mno
				},success:function(data){
					$('#research').modal('show');
					for(var i=0; i<data.list.length; i++){
					
						var Q = data.list[i].rquestionContext;
						console.log(Q);
						var $question = $('<li class="ui-state-default">Q' + data.list[i].researchOrder + '. ' + Q + '</li>');
						//var $choice = $('<div class="choice">' + data.list[i].rquestionContext + '</div>');
						var choiceList = data.list[i].choiceList
						if(choiceList.length != 0){
							for(var j = 0; j < choiceList.length; j++){
								var choice = choiceList[j];
								if(data.list[i].rquestionResponse == choice.choiceOrder){
									var $choiceArea = ('<div class="choice"><input checked disabled type="checkbox" id="choice' + data.list[i].researchOrder + '_' + choice.choiceOrder + '"> ' + choice.choiceContext + '</div>');
								}else {
									var $choiceArea = ('<div class="choice"><input disabled type="checkbox" id="choice' + data.list[i].researchOrder + '_' + choice.choiceOrder + '"> ' + choice.choiceContext + '</div>');
								}
								$question.append($choiceArea);
							}
						}else {
							var $choiceArea = ('<div class="choice"> <div class="ui input"><input type="text" readonly value="' + data.list[i].rquestionResponse + '"></div></div>');
							$question.append($choiceArea);
						}
						$("#sortable").append($question);
					}
				},error:function(){
					console.log("실패");
				}
			});
			
			
		
		});
		$(".detail").on("click", function(){
			mno = $(this).parent().siblings().eq(0).text();
			
			$.ajax({
				url:"selectNewPanel.memberManagement",
				type:"post",
				data:{mno:mno},
				success:function(data){
					
					var encodedAddress = data.newPanel.userAddress;
					var passphrase = "1234";
			        var decrypted1 = CryptoJS.AES.decrypt(encodedAddress, passphrase);
			        var decodedAddress = decrypted1.toString(CryptoJS.enc.Utf8);
					var mno = data.mno;
					var $mnoInput = $('<input type="text" id="mno" value="' + mno + '" style="display:none;">');
                    $("#adminBox").append($mnoInput);
			        
			        var encodedPhone = data.newPanel.userPhone;
			        var decrypted1 = CryptoJS.AES.decrypt(encodedPhone, passphrase);
			        var decodedPhone = decrypted1.toString(CryptoJS.enc.Utf8);
			        
			        $("#panel td").eq(0).text(data.newPanel.mno);
					$("#panel td").eq(1).text(data.newPanel.userName);
					$("#panel td").eq(2).text(data.newPanel.userId);
					$("#panel td").eq(3).text(data.newPanel.panelBirthday);
					$("#panel td").eq(4).text((data.newPanel.panelGender == 'M')? "남성" : "여성");
					$("#panel td").eq(5).text(decodedPhone);
					$("#panel td").eq(6).text(data.newPanel.userEmail);
					$("#panel td").eq(7).html(decodedAddress.split("/")[0] + "   " + decodedAddress.split("/")[1] + "<br><br>" + decodedAddress.split("/")[2]);
					$('#panel').modal('show');
					
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
				$.ajax({
					url:"newPanelMailing.memberManagement",
					type:"post",
					data:{
						mno:mno
					},
					success:function(data){
						
						if(data.result){
							Swal.fire(
								      '승인!',
								      '이 패널은 승인되었습니다.',
								      'success'
								      )
						}
						setTimeout(function(){
						    location.reload();
						},1500)
					},
					error:function(){
						console.log("실패");
					}
				});
			    
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
						  
						  $.ajax({
							  url:"newPanelReferMailing.memberManagement",
							  type:"post",
							  data:{
								  mno:mno,
								  text:text
							  },
							  success:function(data){
								  
								  Swal.fire(
								      		'반려!',
								      		'이 패널은 반려되었습니다.',
								      		'success'
								    		) 
								   setTimeout(function(){
						    	   	location.reload();
								   },1500)
							  },
							  error:function(){
								  console.log("에러");
							  }
							  
						  });
						    
					  }else {
						  $('#research').modal('show');
					  }
					})
				}
			}
			start();
		});
		
		$(".topMenu:nth-child(1)").addClass("active");
		$(".topMenu:nth-child(1)").find(".innerMenu:nth-child(2)").addClass("on");
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