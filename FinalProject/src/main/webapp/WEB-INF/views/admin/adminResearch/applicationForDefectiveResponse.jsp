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
		float: right;
		height: 30px;
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
	#corpTable {
  		width: 70%;
  		margin: 0 auto;
  		border-spacing: 0;
		border-collapse: collapse;
  	}
  	#corpTable th {
  		width: 10%;
  		height: 70px;
  		border-bottom: 1px solid #C5C5C5;
  		text-align: center;
  	}
  	#corpTable td {
  		width: 90%;
  		border-bottom: 1px solid #C5C5C5;
  	}
  	textarea:focus {
  		outline: none;
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
						<button onclick="location.href='applicationForDefectiveResponse.admin'" id="clickBtn">이의신청 목록</button>
						<button onclick="location.href='poorResponseComplete.admin'">처리완료 목록</button>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div id="adminTitle">
						불량응답 이의 신청 목록
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div id="searchInput">
						<div class="ui action input">
			  				<input type="text" placeholder="Search...">
							<button class="ui icon button">
								<i class="search icon"></i>
							</button>
						</div>
					</div>
				</td>
			</tr>
		</table>
		<table id="listTable">
			<tr id="tableTitle">
				<th style="width: 10%;">패널번호</th>
				<th style="width: 20%;">참여리서치번호</th> <!-- 아이디아님 -->
				<th style="width: 40%;">이의신청 제목</th>
				<th style="width: 15%;">이의신청 일</th>
				<th style="width: 15%;">상세보기</th>
			</tr>
			<c:forEach var="i" begin="0" end="9">
				<tr class="tableContext">
					<td>패널번호</td>
					<td>참여리서치번호</td>
					<td>이의신청 제목</td>
					<td>이의신청 일</td>
					<td><button class="detail">상세보기</button></td>
				</tr>
			</c:forEach>
		</table>
		<div id="pagingArea" align="center">
			<span>[처음]</span>
			<span>[이전]</span>
			<c:forEach var="i" begin="1" end="10">
				<span><c:out value="${ i }"/></span>
			</c:forEach>
			<span>[다음]</span>
			<span>[마지막]</span>
		</div>
	</div>
	<div class="ui modal" id="corp">
		<div class="header">이의신청 내용</div>
		<div class="scrolling content">
			<div>
				<table id="corpTable">
					<tr>
						<th style="width: 10%">패널 번호</th>
						<td style="width: 20%">23789</td>
						<th style="width: 15%">리서치 번호</th>
						<td style="width: 20%">7723</td>
						<th style="width: 15%">이의신청 일</th>
						<td style="width: 20%">2020-01-11</td>
					</tr>
					<tr>
						
					</tr>
					<tr>
						<th>불량응답 내용</th>
						<td colspan="5">
							<table style="width: 70%; margin: 0 auto; margin-bottom: 20px; border-spacing: 0; border-collapse: collapse;">
								<tr>
									<th style="width: 20%">SQ2</th>
									<td colspan="2">귀하의 성별은 무엇입니까?</td>
								</tr>
								<tr>
									<td colspan="3" style="text-align: center; height: 50px;">
										<input type="radio" name="gender" id="male"><label for="male" style="margin-right: 30px;">남</label>
										<input type="radio" name="gender" id="female" checked="checked"><label for="female">여</label>
									</td>
									<td></td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<th>이의신청 제목</th>
						<td colspan="5">제가 성별을 바꾸어서 여자로 체크했어요..</td>
					</tr>
					<tr>
						<th>이의신청 내용</th>
						<td colspan="5">
							<div style="width: 100%">
								<textarea id="appealContext" style="width: 80%; border: 0; height: 200px; resize: none;" readonly></textarea>
							</div>
						</td>
					</tr>
				</table>
			</div>
		</div>
		<div class="actions">
		    <div class="ui approve button" id="approvalBtn">Approve</div>
		    <div class="ui approve button" id="referBtn">Refer</div>
		    <div class="ui cancel button">Cancel</div>
  		</div>
	</div>
	<script>
		$(".detail").on("click", function(){
			var num = $(this).parent().siblings().eq(0).text();
			$('#corp').modal('show');
			//console.log(num);
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
			      '이의신청이 승인되었습니다.',
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
				      		'이의신청이 반려되었습니다.',
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
		$(".topMenu:nth-child(2)").addClass("active");
		$(".topMenu:nth-child(2)").find(".innerMenu:nth-child(6)").addClass("on");
	</script>
</body>
</html>