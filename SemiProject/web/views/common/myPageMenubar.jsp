<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title></title>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>
	.container {
		margin: 0 auto;
		padding-bottom: 10px;
	}
	.container>#myPageMenu{
		width: 210px;
		height: 1080px;
		border-right: 2px solid black;
		display: inline-block;
		float: left;
	}
	.container>#myPageMenu>dl>dt {
		font-size: 1.5em;
		font-family: 'Nanum Myeongjo', serif;
		margin-top: 50px;
		margin-bottom: 10px;
	}
	.container>#myPageMenu>dl>dd {
		font-size: 15px;
		margin-left: 20px;
		margin-top: 7px;
		margin-bottom: 7px;
	}
	#h3{
		font-family: 'Nanum Myeongjo', serif;
		background-color: #211f22;
		padding-top: 7px;
		padding-bottom: 7px;
		color: #a07342;
		margin-top: 0px;
	}
	
	.container>#myPageMenu>dl>dd>a{
		color: darkgray;
		text-decoration: none;
	}
	.container>#myPageMenu>dl>dd>#selectMenu{
		font-size: 1em;
		font-weight: bold;
		color: black;
		text-decoration: underline;
	}
	.container>#myPageMenu>dl>dd>a:hover{
		font-size: 1em;
		font-weight: bold;
		color: black;
		text-decoration: underline;
	}
	.container>.menuStatus{
		width: 920px;
		height: 110px;
		display: inline-block;
		margin-left: 10px;
	}
	.container>.menuStatus>.status1>h3{
		margin-top:10px;
	}
	.container>.menuStatus>.status2{
		width: 920px;
		height: 54px;
		background-color: lightgray;
		vertical-align: middle;

	}
	.container>.menuStatus>.status2>p{
		padding-top: 16px;
		padding-left: 30px;
		font-size: 17px;
	}
	.container>.contentArea{
		width: 920px;
		height: 970px;
		border: 1px solid black;
		display: inline-block;
		margin-left: 10px;
		
	}
	
</style>
</head>
<body>
	<div class="container">
		<div id="myPageMenu">
			<h3 id="h3" align="center">마이페이지</h3>
			<dl>
				<dt>§  구매정보</dt>
				<dd><a href="" id=selectMenu>▶   위시리스트</a></dd>
				<dd><a href="">▶   입찰리스트</a></dd>
				<dd><a href="">▶   낙찰리스트</a></dd>
				
				<dt>§  판매정보</dt>
				<dd><a href="">▶  상품감정 신청</a></dd>
				<dd><a href="">▶  등록상품 관리</a></dd>
				<dd><a href="">▶  경매 진행 상품 관리</a></dd>
				<dd><a href="">▶  경매 마감 상품 관리</a></dd>
				
				<dt>§  결제/배송조회</dt>
				<dd><a href="">▶  결제 내역</a></dd>
				<dd><a href="">▶  감정 상품 배송 조회</a></dd>
				<dd><a href="">▶  구매 상품 배송 조회</a></dd>
				
				<dt>§  메세지</dt>
				<dd><a href="">▶  전체 메세지</a></dd>
				<dd><a href="">▶  받은 메세지</a></dd>
				<dd><a href="">▶  보낸 메세지</a></dd>
				
				<dt>§  문의 및 신고</dt>
				<dd><a href="">▶  문의 내역</a></dd>
				<dd><a href="">▶  신고 내역</a></dd>
				
				<dt>§  회원정보</dt>
				<dd><a href="">▶  회원정보 변경</a></dd>
				<dd><a href="">▶  회원 탈퇴</a></dd>
				
			</dl>
		</div>  <!-- myPageMenu end -->
		<div class="menuStatus">
			<div class="status1">
				<h3>&nbsp;&nbsp;<&nbsp;위시리스트 &nbsp;>&nbsp;</h3>
			</div>  <!-- status1 end -->
			<div class="status2">
				<p>회원님께서 찜하신 상품 리스트를 볼 수 있는 공간입니다.</p>
			</div>  <!-- status2 end -->
		</div>  <!-- menuStatus end -->
		<div class="contentArea">
		
		</div>  <!-- contentArea end -->
	</div>  <!-- container end -->
</body>
</html>