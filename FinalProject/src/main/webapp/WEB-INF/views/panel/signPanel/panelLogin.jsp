<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
   <jsp:include page="/WEB-INF/views/panel/common/head.jsp"/>
</head>
<style>

#contentDiv {
   height:350px;
}

.ui.placeholder {
   background-image:none;
}

.ui.placeholder.segment {
   background:white;
   -webkit-box-shadow:none;
   box-shadow:none;
}
.leftTable {
   padding-left:30px;
}

#panelCorp {
   margin-bottom:300px;
   width:77%;
}

.inputs {
   height: 50px;
}
.first {
   width: 130px;
   text-align:left;
   font-size:13pt;
   font-weight:bold;
}
.second {
   width: 250px;
}
.third {
   width:100px;
   padding-left:8px;
}
td.leftTable.second {
   padding:0px;
}
.ui.grid>.row {
   padding-top:0px;
}
.rightTable {
   padding-left:50px;
}
.ui.buttons .or:before {
    position: absolute;
    text-align: center;
    border-radius: 500rem;
    content: 'or';
    top: 55%;
    left: 50%;
    background-color: #fff;
    text-shadow: none;
    margin-top: -.89285714em;
    margin-left: -.89285714em;
    width: 20px;
    height: 20px;
    line-height: 17px;
    color: rgba(0,0,0,.4);
    font-style: normal;
    font-weight: 700;
    -webkit-box-shadow: 0 0 0 1px transparent inset;
    box-shadow: 0 0 0 1px transparent inset;
}
@media screen and (max-width: 1000px) { 
   .second {
       width: 45%;
   }
   #login {
      width: 50px !inmportant;
   }
}
</style>
<body>
   <div class="wrap">
      <jsp:include page="/WEB-INF/views/panel/common/header.jsp"/>
      <section class="container">
      <br />
         <table id="titleTable" height="10px;" width="99%;">
            <tr>
               <td id="menuTitle">로그인</td>
            </tr>
         </table>
         
         <div class="hr">
            <hr>
         </div>


         <div class="ui placeholder segment" id="contentDiv" style="border:none;">
            <div class="ui two column stackable center aligned grid">
               <div class="ui vertical divider">Or</div>
               <div class="middle aligned row">
                  <div class="column">
                     <form action="login.me" method="post">
                        <table style="width:95%; height:90px;">
                           <tr>
                              <td colspan="3" class="leftTable" style="text-align:left; padding-bottom:30px;">
                                 <div class="ui large buttons">
                                    <input type="button" class="ui button" id="panelCheckBtn" value="패널 회원" style="font-size: 10pt; width: 100px; height:30px;">
                                    <div class="or" style="font-size: 8pt;"></div>
                                    <input type="button" class="ui button" id="corpCheckBtn" value="기업 회원" style="font-size: 10pt; width: 100px; height:30px;">
                                 </div>
                                 <input type="radio" id="panelCheck" name="loginMemberType" value="panelMember" style="display: none;" checked="checked"/>
                                 <input type="radio" id="corpCheck" name="loginMemberType" value="corpMember" style="display: none; margin-left: 10%;" />
                              </td>
                           </tr>
                           <tr class="leftTable inputs">
                              <td class="leftTable first">아이디</td>
                              <td class="leftTable second">
                                 <div class="ui input" style="display: block; width:80%;">
                                    <input type="text" name="userId" placeholder="아이디" autofocus>
                                 </div>
                              </td>
                              <td class="leftTable third" rowspan="2" style="width:fit-content;" >
                                 <button type="submit" class="ui button" style="padding:0px; float: left; width:80px; height:80px; border-radius:2px;" id="login">로그인</button>
                              </td>
                           </tr>
                           <tr class="leftTable inputs">
                              <td class="leftTable first">비밀번호</td>
                              <td class="leftTable second">
                                 <div class="ui input" style="display: block; width:80%;">
                                    <input type="password" name="userPwd" placeholder="비밀번호">
                                 </div>
                              </td>
                           </tr>
                        </table>
                     </form>
                  </div>
                  <div class="column">
                     <table style="width:95%; height:90px;">
                           <tr class="rightTable inputs" >
                              <td class="rightTable first" style="width:300px;">아직 회원이 아니신가요?</td>
                              <td class="rightTable third" >
                                 <button type="submit" class="ui button" style="padding:0px; float: left; width:180px; height:40px; border-radius:2px;" onclick="location.href='panelSignup.panel'">회원가입하기</button>
                              </td>
                           </tr>
                           <br>
                           <tr class="rightTable inputs">
                              <td class="rightTable first" style="width:280px;">회원 정보를 잊으셨나요?</td>
                              <td class="rightTable third" >
                                 <button type="submit" class="ui button" style="padding:0px; float: left; width:180px; height:40px; border-radius:2px;">아이디/비밀번호 찾기</button>
                              </td>
                           </tr>
                        </table>
                  </div>
               </div>
            </div>
         </div>
         
         <div class="hr bottomHr">
            <hr>
         </div>         
         
         
         <button class="ui button" style="float:right; margin-top:10px; width:180px; height:40px; border-radius:2px;" onclick="location.href='panelMain.panel'">메인으로 돌아가기</button>
         
         <br />
      </section>  <!-- container end -->
      <c:if test="${ !empty param.message }">
         <script>
            Swal.fire(
                  '로그인 실패',
                  '${ param.message }',
                  'warning'
            );
         </script>
      </c:if>
      <jsp:include page="/WEB-INF/views/panel/common/footer.jsp"/>
   </div>  <!-- wrap end -->
   
   <script>
      $("#panelCheckBtn").on("click", function(){
         $("#panelCheck").prop("checked", true);
         isChecked();
      });
      $("#corpCheckBtn").on("click", function(){
         $("#corpCheck").prop("checked", true);
         isChecked();
      });
      $(function(){
         isChecked();
      });
      function isChecked(){
         $("input[type=radio]").each(function(){
            if($("#panelCheck").prop("checked")){
               $("#panelCheckBtn").css({"background":"#00679A", "color":"white"});
               $("#corpCheckBtn").css({"background":"#E7E7E7", "color":"#aaa"});
            }else if($("#corpCheck").prop("checked")) {
               $("#panelCheckBtn").css({"background":"#E7E7E7", "color":"#aaa"});
               $("#corpCheckBtn").css({"background":"#00679A", "color":"white"});
            }
         });
      }
//      새로고침 시 쿼리스트링 제거
      window.onkeydown = function() { 
         var kcode = event.keyCode; 
         if(kcode == 116) { 
            history.replaceState({}, null, location.pathname); 
         } 
      }
   </script>
</body>
</html>
