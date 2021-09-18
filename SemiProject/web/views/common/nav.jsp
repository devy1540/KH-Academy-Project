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
	#menubar{
    	background-color: #a07342;
    	text-align: center;
    	height: 51px;
	}

	#menubar li{
   		display: inline-block;
    	vertical-align: top;
    	text-align: center;
    	margin-right: -7px;
	}

	#menubar li a{
   		display: inline-block;
    	padding-left: 35px;
    	padding-right: 35px;
    	width: 230px;
    	height: 45px;
    	color:#211f22;
    	border-left: 1px solid #e2ceb8;
    	border-right: 1px solid #e2ceb8;
	}

	#menubar li a:hover {
    	background-color: #dba060;
    	transition: 0.5s;
	}

	#menubar>li>a>div{
    	padding-top: 4px;
	}

	#menubar>li:nth-of-type(n+3)>a>div{
    	padding: 15px;
	}
	@media(max-width:1150px){
		#menubar li a{
    		display: inline-block;
    		padding-left: 20px;
    		padding-right: 20px;
    		width: 100px;
    		height: 45px;
    		color:#211f22;
    		border-left: 1px solid #e2ceb8;
    		border-right: 1px solid #e2ceb8;
		}
	
		#menubar>li:nth-of-type(n+3)>a>div{
    		padding-top: 15px;
    		padding-left: 0px;
		}
	}
</style>
</head>
<body>
	<nav>
        <ul id="menubar" style="padding-left: 0px;">
            <li>
                <a href=""><div>about<br>LAUXION</div></a>
            </li>
            <li>
                <a href=""><div>user<br>GUIDE</div></a>
            </li>
            <li>
                <a href=""><div>WATCH</div></a>
            </li>
            <li>
                <a href=""><div>BAG</div></a>
            </li>
            <li>
                <a href=""><div>BOARD</div></a>
            </li>
        </ul>	
	</nav>
</body>
</html>