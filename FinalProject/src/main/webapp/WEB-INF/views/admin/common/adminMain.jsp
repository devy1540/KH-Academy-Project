<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	.ui.statistic>.label, .ui.statistics .statistic>.label {
	
    	font-size: 0.7em !important;
    }
    .ui.statistic>.value img, .ui.statistics .statistic>.value img {
    	max-height: 4rem !important;
    }
    .ui.statistic>.value, .ui.statistics .statistic>.value {
    	font-size: 5rem !important;
    }
    #research>.value, #research .statistic>.value {
    	font-size: 7rem !important;
    }
    #research>.label, #research .statistic>.label {
    	font-size: 1em !important;
    }
    .ui.statistic>.value~.label, .ui.statistics .statistic>.value~.label {
	    margin-top: 0.5em !important;
	}
</style>
</head>
<body>
	<jsp:include page="adminMenuBar.jsp"/>
	
	<div id="adminBox">
		<div class="ui statistics" style="margin: 20px auto; width: fit-content; margin-top: 150px;">
			<div class="statistic">
				<div class="value">
					<img src="resources/images/panelMember.png" class="ui circular inline image">
					<c:out value="${ panelCount }"/> 
				</div>
				<div class="label">
					Panel Members
				</div>
			</div>
			<div class="statistic">
				<div class="value">
					<img src="resources/images/corporation.png" class="ui circular inline image">
					<c:out value="${ corpCount }"/>
				</div>
				<div class="label">
					Corporation
				</div>
			</div>
		</div>
		
		<div class="ui statistics research" style="margin: 100px auto; width: fit-content;" id="research">
			<div class="statistic">
				<div class="value">
					<c:out value="${ approvalListCount }"/> 
				</div>
				<div class="label">
					승인 대기중 리서치 수
				</div>
			</div>
			<div class="statistic">
				<div class="value">
					<c:out value="${ reconstructionListCount }"/> 
				</div>
				<div class="label">
					재구성 대기중 리서치 수
				</div>
			</div>
			<div class="statistic">
				<div class="value">
					<c:out value="${ mailingWaitingListCount }"/> 
				</div>
				<div class="label">
					메일링 대기중 리서치 수
				</div>
			</div>
			<div class="statistic">
				<div class="value">
					<c:out value="${ allResearchCount }"/> 
				</div>
				<div class="label">
					총 리서치 수
				</div>
			</div>
		</div>
	</div>
</body>
</html>