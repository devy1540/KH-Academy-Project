<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="chrome">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://fonts.googleapis.com/css?family=Nanum+Myeongjo&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title></title>
<style>
	footer {
   		position: relative;
    	width: 100%;
    	height: 138px;
    	vertical-align: middle;
	}

	footer #bottom-navbar {
    	height: 31px;
    	width: 100%;
    	background-color: #a07342;
    	text-align: center;
	}

	footer #bottom-footer{
    	left: 0px;
    	right: 0px;
    	top: 30px;
   		height: 107px;
    	width: 100%;
    	background-color: #211f22;
	}

	footer > .container {
		width: 1080px;
		margin: 0 auto;
		paading: 6px 0px 0;
	}

	footer .container a, a:hover{
		font-size: 15px;
    	font-family: 'Nanum Myeongjo', serif;
    	color: #211f22;
    	text-decoration: none;
	}
	footer .container p {
		font-size: 10px;
    	font-family: 'Nanum Myeongjo', serif;
    	color: #a07342;
    	text-decoration: none; 
	}

	.container>#bn1{
		width: inherit;
		height: inherit;
		padding: 4px 0 0 0;
	}

	.container>#bf1{
		width: inherit;
		height: inherit;
		padding: 7px 0 0 0;
		text-align: center;
	}

	.container>#bf1 p {
		display: inline-block;
		text-align: left;
	}

	@media(max-width:1920px){
		.container>#bn1 #a1{
			padding-right: 24%;
		}
		.container>#bn1 #a2{
			padding-right: 12%;
			padding-left: 12%;
		}
		.container>#bn1 #a3{
			padding-left: 24%;
		}
	
	
		.container>#bf1 #pbf1{
			padding-right : 7.7%;
		}
		.container>#bf1 #pbf2{
			padding-right: 7.7%;
			padding-left: 7.7%;
		}
		.container>#bf1 #pbf3{
			padding-right: 7.7%;
			padding-left: 7.7%;
		}
		.container>#bf1 #pbf4{
			padding-left: 7.7%;
		}
	}

	@media(max-width:1200px){
		.container>#bn1 #a1{
			padding-right: 22%;
		}
		.container>#bn1 #a2{
			padding-right: 11%;
			padding-left: 11%;
		}
		.container>#bn1 #a3{
			padding-left: 22%;
		}
	
		.container>#bf1 #pbf1{
			padding-right : 5.9%;
		}
		.container>#bf1 #pbf2{
			padding-right: 5.9%;
			padding-left: 5.9%;
		}
		.container>#bf1 #pbf3{
			padding-right: 5.9%;
			padding-left: 5.9%;
		}
		.container>#bf1 #pbf4{
			padding-left: 5.9%;
		}
	}

	@media(max-width:992px){
		.container>#bn1 #a1{
			padding-right: 18%;
		}
		.container>#bn1 #a2{
			padding-right: 9%;
			padding-left: 9%;
		}
		.container>#bn1 #a3{
			padding-left: 18%;
		}
	
		.container>#bf1 #pbf1{
			padding-right : 2.5%;
		}
		.container>#bf1 #pbf2{
			padding-right: 2.5%;
			padding-left: 2.5%;
		}
		.container>#bf1 #pbf3{
			padding-right: 2.5%;
			padding-left: 2.5%;
		}
		.container>#bf1 #pbf4{
			padding-left: 2.5%;
		}
	}

	@media(max-width:758px){
		.container>#bf1 #pbf1{
			padding-right : 1.3%;
		}
		.container>#bf1 #pbf2{
			padding-right: 1.3%;
			padding-left: 1.3%;
		}
		.container>#bf1 #pbf3{
			padding-right: 1.3%;
			padding-left: 1.3%;
		}	
		.container>#bf1 #pbf4{
			padding-left: 1.3%;
		}
	}

	@media(max-width:730px){
		.container>#bn1 #a1{
			padding-right: 14%;
		}
		.container>#bn1 #a2{
			padding-right: 7%;
			padding-left: 7%;
		}
		.container>#bn1 #a3{
			padding-left: 14%;
		}
	}
	@media(max-width:705px){
		footer{
			height: 200px;
		}
		footer #bottom-footer{
    		left: 0px;
    		right: 0px;
    		top: 30px;
   			height: 169px;
    		width: 100%;
    		background-color: #211f22;
		}
	}
	
	@media(max-width:582px){
		.container>#bn1 #a1{
			padding-right: 10%;
		}
		.container>#bn1 #a2{
			padding-right: 5%;
			padding-left: 5%;
		}
		.container>#bn1 #a3{
			padding-left: 10%;
		}
		footer{
			height: 220px;
		}
		footer #bottom-footer{
    		left: 0px;
    		right: 0px;
    		top: 30px;
   			height: 189px;
    		width: 100%;
    		background-color: #211f22;
		}
	}
</style>
</head>
<body>
	<footer>
		<div id="bottom-navbar">
			<div class="container">
				<div id="bn1">
					<a href="#" id="a1">개인정보취급방침</a>
					<a href="#" id="a2">이용약관</a>
					<a href="#" id="a3">전자금융거래이용약관</a>
				</div> <!-- bn1 end -->
			</div>  <!-- container end -->
		</div>  <!-- bottom-navbar end -->
	
		<div id="bottom-footer">
			<div class="container">
				<div id="bf1">
					<p id="pbf1">
						<img src="<%= request.getContextPath() %>/img/LXN_logo.png" alt="" style="margin-bottom: 20px;"/>
					</p>
				
					<p id="pbf2" style="margin-top: 10px;">
						사이트명 : 중고명품 경매 럭션 | 상호명 : ㈜ 럭션<br />
						소재지 : 서울시 강남구 테헤란로 14길 6 남도빌딩2층<br>
						대표이사 : 윤혁준<br>
						사업자등록번호 : 123-45-67890 | FAX : 02-999-4989<br>			
					</p>
				
					<p id="pbf3">
						통신판매업신고 : 제 강남-9999호<br>
						개인정보 보호책임자 : 오수민<br>
						개인정보 보호기간 : 회원탈퇴시까지<br>
						email : lauxion@lxn.co.kr<br>					
					</p>
				
					<p id="pbf4">
						고객센터 : 1544-9999 <br> (월~금 09:00 ~ 18:00)<br><br>
					</p>				
				</div>  <!-- bf1 end -->
			</div>  <!-- container end -->
		</div>  <!-- bottom footer end -->
	</footer>
</body>
</html>