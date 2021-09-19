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
	header {
		position: relative;
    	width: 100%;
    	height: 96px;
    	vertical-align: middle;
	}
	header #top-header{
    	height: 96px;
    	width: 100%;
		background: #211f22;
		text-align: center;
	}
	header>#th1 {
		width: inherit;
		height: inherit;
		text-align: center;
	}
	
	header .container #left {
		display: inline-block;
		text-align: left;
    	font-size: 13px;
    	font-weight: bold;
    	color: #a07f5c;
	}
	
	header .container #login a {
		display: inline;
    	color: #a07f5c;
    	margin: 10px;
    	padding: 10px;
    	text-decoration: none;
    	
	}
	
	header .container #login a:hover {
		color: #211f22;
   		background-color: #a07f5c;
    	transition: 0.5s;
    	text-decoration: none;
	}
	
	@media(max-width:1920px){
		.container>#th1 #left {
			padding-right: 12%;
		}
		.container>#th1 #logo {
			padding-right: 6%;
			padding-left: 6%;
		}
		.container>#th1 #login {
			padding-left: 12%;
		}
	}
	
	@media(max-width:1200px){
		.container>#th1 #left {
			padding-right: 8%;
		}
		.container>#th1 #logo {
			padding-right: 4%;
			padding-left: 4%;
		}
		.container>#th1 #login {
			padding-left: 8%;
		}
	}
	
	@media(max-width:991px){
		header>#th1 {
			width: inherit;
			height: inherit;
			text-align: center;
		}
		.container>#th1 #left {
			display: none;
		}
		.container>#th1 #logo {
			padding-right: 9%;
			padding-left: 9%;
		}
		.container>#th1 #login {
			padding-left: 18%;
		}
		
	}
	@media(max-width:739px){
		.container>#th1 #logo {
			padding-right: 5%;
			padding-left: 5%;
		}
		.container>#th1 #login {
			padding-left: 10%;
		}
	}
	
	@media(max-width:700px){
		.container>#th1 #logo {
			padding-right: 1.5%;
			padding-left: 1.5%;
		}
		.container>#th1 #login {
			padding-left: 3%;
		}
	}
</style>
</head>
<header>
	<div id="top-header">
		<div class="container">
			<div id="th1">
				<p id="left">
                	Second-hand Luxury Watch & Bag Auction<br />
                	100% Authenticity Guaranteed
            	</p>
				<p id="logo" style="display: inline-block; margin-bottom: 10px;">
					<a href="<%=request.getContextPath() %>"><img src="<%= request.getContextPath() %>/img/LauXion_logo.png" alt="" id="logo"></a>
				</p>
				<p id="login" style="display: inline-block;">
					<a href="<%= request.getContextPath() %>/views/member/login.jsp">로그인</a>
                	<a href="<%= request.getContextPath() %>/views/member/registerAgreement.jsp">회원가입</a>        	
				</p>
			</div>  <!-- th1 end -->
		</div>  <!-- container end -->
	</div>  <!-- top-header end -->
</header>
</html>