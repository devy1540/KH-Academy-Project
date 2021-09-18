<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../../css/watchList.css">
<title>LauXion</title>
</head>
<body>
	<%@ include file="../common/header.jsp" %>
	<%@ include file="../common/nav.jsp" %>
	<section>
		<div class="head">
			<span class="title">< 경매 진행중인 가방 상품 ></span> <span class="search">검색</span>
			<span class="content">
				<form action="">
					<select name="keyword" id="keyword">
						<option value="brand">브랜드명</option>
						<option value="content">모델명</option>
					</select> <input type="search" name="content" id="content"
						placeholder="브랜드명"> <input type="submit" value="검색">
				</form>
			</span>
		</div>
		
		<div class="list">
			<table>
				<tr>
					<td>
						<div id="img">
                        	<div class="price">￦2,314,000</div>
                            <img src="../../img/bag1.jpg" alt="" >
                        </div>
                        <span class="content">Cartier Marcello De Cartier handbag Bro…</span>
                        <div class="time">End in 8h 55m</div>
					</td>
					<td>
						<div id="img">
                        	<div class="price">￦2,314,000</div>
                            <img src="../../img/bag1.jpg" alt="" >
                        </div>
                        <span class="content">Cartier Marcello De Cartier handbag Bro…</span>
                        <div class="time">End in 8h 55m</div>
					</td>
					<td>
						<div id="img">
                        	<div class="price">￦2,314,000</div>
                            <img src="../../img/bag1.jpg" alt="" >
                        </div>
                        <span class="content">Cartier Marcello De Cartier handbag Bro…</span>
                        <div class="time">End in 8h 55m</div>
					</td>
					<td>
						<div id="img">
                        	<div class="price">￦2,314,000</div>
                            <img src="../../img/bag1.jpg" alt="" >
                        </div>
                        <span class="content">Cartier Marcello De Cartier handbag Bro…</span>
                        <div class="time">End in 8h 55m</div>
					</td>
					<td>
						<div id="img">
                        	<div class="price">￦2,314,000</div>
                            <img src="../../img/bag1.jpg" alt="" >
                        </div>
                        <span class="content">Cartier Marcello De Cartier handbag Bro…</span>
                        <div class="time">End in 8h 55m</div>
					</td>
				</tr>
				<tr>
					<td>
						<div id="img">
                        	<div class="price">￦2,314,000</div>
                            <img src="../../img/bag1.jpg" alt="" >
                        </div>
                        <span class="content">Cartier Marcello De Cartier handbag Bro…</span>
                        <div class="time">End in 8h 55m</div>
					</td>
					<td>
						<div id="img">
                        	<div class="price">￦2,314,000</div>
                            <img src="../../img/bag1.jpg" alt="" >
                        </div>
                        <span class="content">Cartier Marcello De Cartier handbag Bro…</span>
                        <div class="time">End in 8h 55m</div>
					</td>
					<td>
						<div id="img">
                        	<div class="price">￦2,314,000</div>
                            <img src="../../img/bag1.jpg" alt="" >
                        </div>
                        <span class="content">Cartier Marcello De Cartier handbag Bro…</span>
                        <div class="time">End in 8h 55m</div>
					</td>
					<td>
						<div id="img">
                        	<div class="price">￦2,314,000</div>
                            <img src="../../img/bag1.jpg" alt="" >
                        </div>
                        <span class="content">Cartier Marcello De Cartier handbag Bro…</span>
                        <div class="time">End in 8h 55m</div>
					</td>
					<td>
						<div id="img">
                        	<div class="price">￦2,314,000</div>
                            <img src="../../img/bag1.jpg" alt="" >
                        </div>
                        <span class="content">Cartier Marcello De Cartier handbag Bro…</span>
                        <div class="time">End in 8h 55m</div>
					</td>
				</tr>
			</table>
		</div> <!-- watchList End -->
	</section>
	<%@ include file="../common/footer.jsp" %>
</body>
</html>