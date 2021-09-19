<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	body {
		font-family: Lato,'Helvetica Neue',Arial,Helvetica,sans-serif;
	}
	#subMenu{
		width: 100%;
		height: 75px;
		background-image: url("resources/images/corpMenu2.png");
		background-repeat: no-repeat;
		background-size: cover;
		margin-top: 10px;
		padding-top: 20px;
	}
	#researchMenuArea {
		margin: 0 auto;
		width: 70%;
	}
	#researchMenu {
		width: 100%;
	}
	#researchMenu td {
		width: 33%;
		margin: 0 auto;
		color: #C4C4C4;
		font-size: 22px;
		text-align: center;
	}
	#researchMenu td div{
		height: 35px;
		margin: auto;
		width: 60%;
		text-align: center;
		border: 2px solid rgba(0, 0, 0, 0);
	}
	#researchMenu td div:hover {
		cursor: pointer;
		color: white;
		/* text-decoration: underline;
		text-underline-position: under; */
		border-bottom: 2px solid #C4C4C4; 
	}
	.on {
		cursor: pointer !important;
		color: white !important;
		border-bottom: 2px solid #C4C4C4 !important; 
	}
</style>
</head>
<body>
	<div id="subMenu">
		<div id="researchMenuArea">
			<table id="researchMenu">
				<tr>
					<td><div onclick="location.href='sampleResearchMain.corp'">Survway 리서치 체험</div></td>
					<td><div onclick="location.href='newResearchMain.corp'">새 리서치 신청</div></td>
					<td><div onclick="location.href='previousResearchMain.corpResearch'">리서치 의뢰 이력</div></td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>