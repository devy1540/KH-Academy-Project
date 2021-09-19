<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/watchList.css">
<title>LauXion</title>
</head>
<body>
	<section class="container">
		<div class="head">
			<span class="title">< 경매 진행중인 시계 상품 ></span> <span class="search">검색</span>
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
                        	<div class="price">￦720,000</div>
                        	<img src="<%= request.getContextPath() %>/img/watch1.jpg" alt="" >
                        </div>
                        <span class="content">Omega Speedmaster Black Dial</span>
                        <div class="time">3 days 13 : 42</div>
					</td>
					<td>
						<div id="img">
                        	<div class="price">￦720,000</div>
                        	<img src="<%= request.getContextPath() %>/img/watch1.jpg" alt="" >
                        </div>
                        <span class="content">Omega Speedmaster Black Dial</span>
                        <div class="time">3 days 13 : 42</div>
					</td>
					<td>
						<div id="img">
                        	<div class="price">￦720,000</div>
                        	<img src="<%= request.getContextPath() %>/img/watch1.jpg" alt="" >
                        </div>
                        <span class="content">Omega Speedmaster Black Dial</span>
                        <div class="time">3 days 13 : 42</div>
					</td>
					<td>
						<div id="img">
                        	<div class="price">￦720,000</div>
                        	<img src="<%= request.getContextPath() %>/img/watch1.jpg" alt="" >
                        </div>
                        <span class="content">Omega Speedmaster Black Dial</span>
                        <div class="time">3 days 13 : 42</div>
					</td>
					<td>
						<div id="img">
                        	<div class="price">￦720,000</div>
                        	<img src="<%= request.getContextPath() %>/img/watch1.jpg" alt="" >
                        </div>
                        <span class="content">Omega Speedmaster Black Dial</span>
                        <div class="time">3 days 13 : 42</div>
					</td>
				</tr>
				<tr>
					<td>
						<div id="img">
                        	<div class="price">￦720,000</div>
                        	<img src="<%= request.getContextPath() %>/img/watch1.jpg" alt="" >
                        </div>
                        <span class="content">Omega Speedmaster Black Dial</span>
                        <div class="time">3 days 13 : 42</div>
					</td>
					<td>
						<div id="img">
                        	<div class="price">￦720,000</div>
                        	<img src="<%= request.getContextPath() %>/img/watch1.jpg" alt="" >
                        </div>
                        <span class="content">Omega Speedmaster Black Dial</span>
                        <div class="time">3 days 13 : 42</div>
					</td>
					<td>
						<div id="img">
                        	<div class="price">￦720,000</div>
                        	<img src="<%= request.getContextPath() %>/img/watch1.jpg" alt="" >
                        </div>
                        <span class="content">Omega Speedmaster Black Dial</span>
                        <div class="time">3 days 13 : 42</div>
					</td>
					<td>
						<div id="img">
                        	<div class="price">￦720,000</div>
                        	<img src="<%= request.getContextPath() %>/img/watch1.jpg" alt="" >
                        </div>
                        <span class="content">Omega Speedmaster Black Dial</span>
                        <div class="time">3 days 13 : 42</div>
					</td>
					<td>
						<div id="img">
                        	<div class="price">￦720,000</div>
                            <img src="<%= request.getContextPath() %>/img/watch1.jpg" alt="" >
                        </div>
                        <span class="content">Omega Speedmaster Black Dial</span>
                        <div class="time">3 days 13 : 42</div>
					</td>
				</tr>
			</table>
		</div> <!-- watchList End -->
	</section>
</body>
</html>