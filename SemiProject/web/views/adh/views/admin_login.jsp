<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="https://fonts.googleapis.com/css?family=Nanum+Myeongjo&display=swap" rel="stylesheet">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style> 
	
</style>
<style type="text/css">
	html, body {
		padding: 0;
		margin: 0;
		width: 100%;
		height: 100%;
	}
	#header {
		background: rgb(33, 31, 34);
		width: 100%;
		height: 200px;
		
	}
	#header_bottom {
		width: 100%;
		height: 0px;
		background: rgb(160, 115, 66);
	}
	#img_div {
		width: 1000px;
		height: 160px;
		margin-left: auto;
		margin-right: auto;
		padding-top: 40px;
		background: rgb(33, 31, 34);
	}
	#img_div > div {
		margin-left: auto;
		margin-right: auto;
		width: 329.75px;
		height: 150px;
	}
	
	#img_div > div > img {
		height: 100%;
	}
	#container {
		width: 100%;
		height: 100%;
	}
	#login_div {
		width: 1000px;
		height: 600px;
		margin-left: auto;
		margin-right: auto;
	}
	#header_bottom > div{
		width: 1000px;
		height: 0px;
		background: rgb(160, 115, 66);
	}
	#login_div > table{
		text-align: center;
		margin-left: auto;
		margin-right: auto;
	}
	input[type="text"]{
		width: 250px;
		height: 30px;
		border: solid 1px rgb(160, 115, 66);
		border-radius: 5px;
	}
	input[type="submit"] {
		width: 100px;
		height: 50px;
		background: rgb(33, 31, 34);
		color: #e2ceb8;
		border: none;
		border-radius: 5px; 
	}
	#login_div > p{
	margin-left: 330px;
	margin-top: 150px;
	font-size: 15px;
	height: 30px;
	width: 107px;
	}
	input[type='submit']:hover {
		background: rgb(160, 115, 66);
	}
	</style>
</head>
<body>
	<form action="views/admin_mainPage.jsp" method="post">
		<div id="header">
		<div id="img_div">
			<div>
				<img alt="" src="views/image/loginimg.png" id="login_img" onclick="nextPage">
			</div>
			
		</div>
	</div>
	<div id="header_bottom">
		<div>
		</div>
	</div>
	<div id="container">
		<div id="login_div">
				<p>관리자 로그인
			<table>
				<tr>
					<td>&nbsp;</td>
					<td><input type="text"></td>
					<td rowspan ="2"><input type="submit" value="로그인"></td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td><input type="text"></td>
				</tr>
			</table>
		</div>
	</div>
	</form>
	<script type="text/javascript">
		 function nextPage() {
			loaction.href="";
		}
	/* 	$(document).ready(function(){
			console.log("안뇽");
			$("#header_bottom").animate({height:'70'},1000);
			$("#header_bottom > div").animate({height:'70'},1000);
			$("input[type='text']").delay(2000).animate({width:'250px'},1000);
			$("input[type='submit']").delay(2000).animate({width:'100px'},1000);
			$("#login_div > input").delay(1000).animate({width:'107px'},1000);
		}); */
	</script>
</body>
</html>