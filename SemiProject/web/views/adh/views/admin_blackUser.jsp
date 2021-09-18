<%@ page language="java" contentType="text/html;charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta content="text/html;">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/admin_blackUser.css">
</head>
<body>
	<%@ include file="headerPage.jsp" %>
	
	<div id="container">
		<div id="container_Box">
			<div>
				<p>블랙 회원<h3>1명</h3>
				<button id="sarchBoxBtn">검색</button>
				<input type="text" id="searchBox">
			</div>
			<div>
				<table id="table">
					<tr>
						<th>No.</th>
						<th>아이디</th>
						<th>이름</th>
						<th>등급</th>
						<th>휴대폰번호</th>
						<th>주소</th>
						<th>이메일</th>
						<th>설정</th>
					</tr>
					 <tr>
						<td>1</td>
						<td>adh1234</td>
						<td>안동환</td>
						<td>블랙회원</td>
						<td>010-2222-1919</td>
						<td>충남 서산시</td>
						<td>adh1234@naver.com</td>
						<td></td>
					</tr>
					
				</table>
			</div>
			<div id="nextPage">
				<div id="nextPageBox">
					<button><</button>
					<button>o</button>
					<button>></button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>