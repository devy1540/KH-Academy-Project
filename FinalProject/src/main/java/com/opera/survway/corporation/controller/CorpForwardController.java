package com.opera.survway.corporation.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CorpForwardController {
	@RequestMapping("corpMain.corp")
	public String forwardCorpMain() {
		return "main/corpMain";
	}
	
	// 기업 회원가입1
	@RequestMapping("corpSignup1.corp")
	public String forwardCorpSignup1() {
		return "signCorp/corpSignup1";
	}
	
	// 기업 회원가입2
	@RequestMapping("corpSignup2.corp")
	public String forwardCorpSignup2() {
		return "signCorp/corpSignup2";
	}
	
	// 기업 회원가입3
	@RequestMapping("corpSignup3.corp")
	public String forwardCorpSignup3() {
		return "signCorp/corpSignup3";
	}

	
	// 샘플 리서치 메인
	@RequestMapping("sampleResearchMain.corp")
	public String forwardSampleResearchMain() {
		return "corpResearch/sampleResearchMain";
	}
	
	// 리서치 메인
	@RequestMapping("newResearchMain.corp")
	public String forwardNewResearchMain() {
		return "corpResearch/newResearchMain";
	}
	
	// 리서치 신청하기
	@RequestMapping("requestResearch.corp")
	public String forwardRequestResearch() {
		return "corpResearch/requestResearch";
	}
	
	//회사 및 사업 소개 - survway 소개
	@RequestMapping("survwayIntroduction.corp")
	public String forwardSurvwayIntroduction() {
		return "infoPages/introduction/survwayIntroduction";
	}
	
	//회사 및 사업 소개 - survway 사업
	@RequestMapping("survwayBusiness.corp")
	public String forwardSurvwayBusiness() {
		return "infoPages/introduction/survwayBusiness";
	}
	
	//신뢰성 확보 방법 - 패널 관리
	@RequestMapping("panelManagementStrategy.corp")
	public String forwardPanelManagementStrategy() {
		return "infoPages/reliabilityStrategy/panelManagementStrategy";
	}
	
	//신뢰성 확보 방법 - 설문지 작성 단계
	@RequestMapping("surveyFormatStrategy.corp")
	public String forwardSurveyFormatStrategy() {
		return "infoPages/reliabilityStrategy/surveyFormatStrategy";
	}
	
	//신뢰성 확보 방법 - 메일 발송 단계
	@RequestMapping("mailingStrategy.corp")
	public String forwardPanelMailingStrategy() {
		return "infoPages/reliabilityStrategy/mailingStrategy";
	}
	
	//신뢰성 확보 방법 - 온라인 실사 단계
	@RequestMapping("onlineStrategy.corp")
	public String forwardOnlineStrategy() {
		return "infoPages/reliabilityStrategy/onlineStrategy";
	}
	
	//신뢰성 확보 방법 - 데이터 검증 단계
	@RequestMapping("dataCheckStrategy.corp")
	public String forwardDataCheckStrategy() {
		return "infoPages/reliabilityStrategy/dataCheckStrategy";
	}
	
	//리서치 관련 안내 - 리서치 신청 프로세스
	@RequestMapping("researchRequestProcess.corp")
	public String forwardResearchRequestProcess() {
		return "infoPages/researchGuide/researchRequestProcess";
	}
	
	//리서치 관련 안내 - 설문 결과 분석 예시
	@RequestMapping("sampleResearchResult.corp")
	public String forwardSampleResearchResult() {
		return "infoPages/researchGuide/sampleResearchResult";
	}
	
	//SURVWAY 빅데이터 - 패널 빅데이터
	@RequestMapping("panelBigData.corp")
	public String forwardPanelBigData() {
		return "infoPages/survwayBigData/panelBigData";
	}
	
	//SURVWAY 빅데이터 - 리서치 빅데이터
	@RequestMapping("researchBigData.corp")
	public String forwardResearchBigData() {
		return "infoPages/survwayBigData/researchBigData";
	}
	
	
	@RequestMapping("corpModal.corp")
	public String forwardCorpModal() {
		return "common/corpModal";
	}
}