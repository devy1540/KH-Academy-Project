package com.opera.survway.panel.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PanelForwardController {
	
	// 안내 메뉴 페이지들
	//1. 혜택 안내
	@GetMapping("benefitInfo.panel")
	public String showBenefitInfo() {
		return "info/benefitInfo";
	}
	//2. 조사 참여 안내
	@GetMapping("surveyGuide.panel")
	public String showSurveyGuide() {
		return "info/surveyGuide";
	}
	
	
	
	// 마이페이지 메뉴 페이지들
	//1. 내 정보 관리
	@GetMapping("myInfo.panel")
	public String showMyInfo() {
		return "myPage/myInfo";
	}
	//2-1. 내 1:1문의 상세보기
	@GetMapping("myInquiryDetail.panel")
	public String showMyInquiryDetail() {
		return "myPage/myInquiryDetail";
	}
	//2-2. 1:1 문의하기
	@GetMapping("myNewInquiry.panel")
	public String showNewInquiry() {
		return "myPage/myNewInquiry";
	}
	//3. 내 리워드 관리
//	@GetMapping("myRewardMain.panel")
//	public String showMyRewardMain() {
//		return "myPage/myRewardMain";
//	}
	//3-1. 내 리워드 적립내역
//	@GetMapping("myRewardDetail_saved.panel")
//	public String showMyRewardDetail_saved() {
//		return "myPage/myRewardDetail_saved";
//	}
	//3-2. 내 리워드 사용내역
//	@GetMapping("myRewardDetail_used.panel")
//	public String showMyRewardDetail_used() {
//		return "myPage/myRewardDetail_used";
//	}
	//3-3. 리워드 캐시아웃
//	@GetMapping("myRewardCashOut.panel")
//	public String showMyRewardCashOut() {
//		return "myPage/myRewardCashOut";
//	}
	//4. 패널 탈퇴
	@GetMapping("panelDrop.panel")
	public String showPanelDrop() {
		return "myPage/panelDrop";
	}
	
	@RequestMapping("panelResult.panel")
	public String showPanelResult() {
		return "myPage/panelResult";
	}
	
	
	// 로그인, 회원가입 페이지들
	//1. 로그인
	@GetMapping("panelLogin.panel")
	public String showPanelLogin() {
		return "signPanel/panelLogin";
	}
	//2. 회원가입(패널 또는 기업)
	@GetMapping("panelSignup.panel")
	public String showPanelSignup() {
		return "signPanel/panelSignup";
	}
	//2. 회원가입(이용약관)
	@GetMapping("panelSignup1.panel")
	public String showPanelSignup1() {
		return "signPanel/panelSignup1";
	}
	//3. 회원가입(정보입력)
	@GetMapping("panelSignup2.panel")
	public String showPanelSignup2() {
		return "signPanel/panelSignup2";
	}
	//3. 회원가입(가입완료)
	@GetMapping("panelSignup3.panel")
	public String showPanelSignup3() {
		return "signPanel/panelSignup3";
	}
	
	@GetMapping("panelSignup2_old.panel")
	public String showPanelSignup2_old() {
		return "signPanel/panelSignup2_old";
	}
	@GetMapping("panelSignup3_old.panel")
	public String showPanelSignup3_old() {
		return "signPanel/panelSignup3_old";
	}
	
	// 서베이 메뉴 페이지들
	//1. 진행중인 설문조사 전체 목록
	@GetMapping("surveyList.panel")
	public String showSruveyList() {
		return "survey/surveyList";
	}
	//2. 참여한 설문조사 목록 - 참여 완료 조사
//	@GetMapping("mySurveyList_complete.panel")
//	public String showMySurveyList_complete() {
//		return "survey/mySurveyList_complete";
//	}
	//2-2. 참여한 설문조사 목록 - 참여 시도 조사
	@GetMapping("mySurveyList_retry.panel")
	public String showMySurveyList_retry() {
		return "survey/mySurveyList_retry";
	}

//	@GetMapping("mySurveyList_retry.panel")
//	public String showMySurveyList_retry() {
//		return "survey/mySurveyList_retry";
//	}
	//3. 패널서베이목록
	@GetMapping("panelSurveyList.panel")
	public String showPanelSurveyList() {
		return "survey/panelSurveyList";
	}
  
	//4. 내 투표목록
	@GetMapping("myPanelSurvey.panel")
	public String showMyPanelSurvey() {
		return "survey/myPanelSurvey";
	}
	
	
}































