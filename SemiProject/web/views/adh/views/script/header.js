$(function(){
			$(document).mouseover(function(e){
				//		console.log(e.target.innerText);
				if( e.target.innerText == "회원 정보"){
					if(e.target.innerText == "매출 관리"){
						
						$("#usermit > li").hide(0);
						$("#revenueManagement > li").show(0);
					} else if(e.target.innerText == "회원 정보") {
						$("#usermit > li").show(0);
						$("#revenueManagement > li").hide(0);
					}
					$("#bottom").animate({height:'70'},300);
					$("#bottom_div").animate({height:'70'},300);
				} else if(e.target.localName == "body"){
					$("#bottom").animate({height:'5'},300);
					$("#bottom_div").animate({height:'5'},300);
					$("#revenueManagement >li").delay(200).hide(0);
					$("#usermit >li").delay(200).hide(0);
				}
			});
		});