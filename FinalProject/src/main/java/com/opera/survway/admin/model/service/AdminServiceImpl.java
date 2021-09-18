package com.opera.survway.admin.model.service;

import com.opera.survway.admin.model.dao.AdminDao;
import com.opera.survway.admin.model.exception.ResearchException;
import com.opera.survway.admin.model.vo.*;
import com.opera.survway.common.model.vo.AllMember;
import com.opera.survway.common.model.vo.PageInfo;
import com.opera.survway.common.model.vo.ResearchState;
import com.opera.survway.common.model.vo.UploadFile;
import com.opera.survway.corporation.model.vo.Research;
import com.opera.survway.corporation.model.vo.ResearchChoice;
import com.opera.survway.corporation.model.vo.ResearchQuestion;
import com.opera.survway.exception.SelectException;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import javax.mail.internet.MimeMessage;
import java.io.File;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service
public class AdminServiceImpl implements AdminService{
  
	@Autowired 
	private AdminDao ad;
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private JavaMailSender mailSender; // Mail Sender
	
	/**
	 * @throws SelectException 
	 * @Author      : Ungken
	 * @CreateDate  : 2020. 1. 23.
	 * @ModifyDate  : 2020. 1. 23.
	 * @Description : 회원 조회시 회원 수
	 */
	@Override
	public int getListCountPanel(SearchMember searchMember) throws SelectException {
		
		int listCount = ad.getListCountPanel(sqlSession, searchMember);
		
		if(listCount < 0) {
			throw new SelectException("회원 수 조회 실패");
		}
		return listCount;
	}
	
	/**
	 * @throws SelectException 
	 * @Author      : Ungken
	 * @CreateDate  : 2020. 1. 23.
	 * @ModifyDate  : 2020. 1. 23.
	 * @Description : 회원 전체 조회
	 */
	@Override
	public List<AllMember> memberInfoManagement(SearchMember searchMember) throws SelectException {
		
		List<AllMember> memberList = ad.memberInfoManagement(sqlSession, searchMember);
		
		if(memberList == null) {
			throw new SelectException("회원 조회 실패");
		}
		return memberList;
	}

	/**
	 * @throws SelectException 
	 * @Author      : Ungken
	 * @CreateDate  : 2020. 1. 23.
	 * @ModifyDate  : 2020. 1. 23.
	 * @Description : 회원 상세 조회
	 */
	@Override
	public AllMember selectMember(int mno) throws SelectException {
		AllMember member = ad.selectMember(sqlSession, mno);
		
		if(member == null) {
			throw new SelectException("회원 상세 조회 실패");
		}
		return member;
	}
	
	/**
	 * @Author      : Ungken
	 * @CreateDate  : 2020. 1. 24.
	 * @ModifyDate  : 2020. 1. 24.
	 * @Description : 패널 캐시아웃 신청 이력 수
	 */
	@Override
	public int getListCountPanelCashoutApplicant() throws SelectException {
		
		int listCount = ad.getListCountPanelCashoutApplicant(sqlSession);
		
		if(listCount < 0) {
			throw new SelectException("캐시아웃 신청 이력 수 조회 실패");
		}
		return listCount;
	}

	/**
	 * @throws SelectException 
	 * @Author      : Ungken
	 * @CreateDate  : 2020. 1. 24.
	 * @ModifyDate  : 2020. 1. 24.
	 * @Description : 패널 캐시아웃 신청 이력
	 */
	@Override
	public List<PanelRewardHistory> panelCashoutApplication(PageInfo pi) throws SelectException {
		List<PanelRewardHistory> panelRewardHistoryList = ad.panelCashoutApplication(sqlSession, pi);
		
		if(panelRewardHistoryList == null) {
			throw new SelectException("캐시아웃 신청 이력 조회 실패");
		}
		return panelRewardHistoryList;
	}

	/**
	 * @Author      : Ungken
	 * @CreateDate  : 2020. 1. 25.
	 * @ModifyDate  : 2020. 1. 25.
	 * @Description : 회원 1인, 다수 캐시아웃 확인완료 ajax
	 */
	@Override
	public boolean cashoutPeople(List<String> cnoArr) {
		
		int result = ad.cashoutPeople(sqlSession, cnoArr);
		
		if(result > 0) {
			return true;
		}else {
			return false;
		}
	}

	/**
	 * @throws SelectException 
	 * @Author      : Ungken
	 * @CreateDate  : 2020. 1. 25.
	 * @ModifyDate  : 2020. 1. 25.
	 * @Description : 패널 캐시아웃 완료 이력 수
	 */
	@Override
	public int getListCountManageCashoutComplete() throws SelectException {
		int listCount = ad.getListCountManageCashoutComplete(sqlSession);
		
		if(listCount < 0) {
			throw new SelectException("캐시아웃 완료 이력 수 조회 실패");
		}
		return listCount;
	}

	/**
	 * @Author      : Ungken
	 * @CreateDate  : 2020. 1. 29.
	 * @ModifyDate  : 2020. 1. 29.
	 * @Description : 캐시아웃 완료 이력 조회
	 */
	@Override
	public List<PanelRewardHistory> manageCashoutComplete(PageInfo pi) throws SelectException {
		List<PanelRewardHistory> rewardCompleteHistoryList = ad.manageCashoutComplete(sqlSession, pi);
		
		if(rewardCompleteHistoryList == null) {
			throw new SelectException("캐시아웃 완료 이력 조회 실패");
		}
		return rewardCompleteHistoryList;
	}

	/**
	 * @throws SelectException 
	 * @Author      : Sooo
	 * @CreateDate  : 2020. 1. 28.
	 * @ModifyDate  : 2020. 1. 28.
	 * @Description : 신규회원관리페이지 페이징을 위해 전체 신규회원리스트 갯수 가져오기
	 */
	@Override
	public int getListCountNewPanel(SearchMember searchMember) throws SelectException {
		int listCount = ad.getListCountNewPanel(sqlSession, searchMember);

		if(listCount < 0) {
			throw new SelectException("신규회원 수 조회 실패");
		}
		
		return listCount;
	}

	/**
	 * @throws SelectException 
	 * @Author      : Sooo
	 * @CreateDate  : 2020. 1. 28.
	 * @ModifyDate  : 2020. 1. 28.
	 * @Description : 신규회원관리페이지 회원정보목록 조회해서 가져오기
	 */
	@Override
	public List<AllMember> getListNewPanel(SearchMember searchMember) throws SelectException {

		List<AllMember> memberList = ad.getListNewPanel(sqlSession, searchMember);

		if(memberList == null) {
			throw new SelectException("신규회원 조회 실패");
		}
		return memberList;
	}

	/**
	 * @throws SelectException 
	 * @Author      : Sooo
	 * @CreateDate  : 2020. 1. 28.
	 * @ModifyDate  : 2020. 1. 28.
	 * @Description : 신규회원관리페이지 신규회원정보 상세보기 모달창에 띄울 정보 조회해서 가져오기
	 */
	@Override
	public AllMember selectNewPanelDetail(int mno) throws SelectException {
		AllMember newPanelDetail = ad.getNewPanelDetail(sqlSession, mno);
		if(newPanelDetail == null) {
			throw new SelectException("신규회원 상세보기 조회 실패");
		}
		return newPanelDetail;
	}

	/**
	 * @throws SelectException 
	 * @Author      : Ungken
	 * @CreateDate  : 2020. 1. 31.
	 * @ModifyDate  : 2020. 1. 31.
	 * @Description : 리서치 신청 수 
	 */
	@Override
	public int getListCountArrovalList() throws SelectException {
		int listCount = ad.getListCountArrovalList(sqlSession);
		if(listCount < 0) {
			throw new SelectException("리서치 신청 수 조회 실패");
		}
		return listCount;
	}
	
	/**
	 * @throws SelectException 
	 * @Author      : Ungken
	 * @CreateDate  : 2020. 1. 31.
	 * @ModifyDate  : 2020. 1. 31.
	 * @Description : 리서치 신청 리스트
	 */
	@Override
	public List<Map<String, String>> researchApprovalWaitList(PageInfo pi) throws SelectException {
		List<Map<String, String>> researchApprovalWaitList = ad.researchApprovalWaitList(sqlSession, pi);
		if(researchApprovalWaitList == null) {
			throw new SelectException("리서치 신청 리스트 조회 실패");
		}
		return researchApprovalWaitList;
	}

	/**
	 * @Author      : Ungken
	 * @CreateDate  : 2020. 1. 31.
	 * @ModifyDate  : 2020. 1. 31.
	 * @Description : 리서치 신청 상세 보기
	 */
	@Override
	public List<Map<String, Object>> researchApprovalDetail(int researchNo) {
		List<Map<String, Object>> researchApprovalDetail = ad.researchApprovalDetail(sqlSession, researchNo);
		ArrayList<ResearchQuestion> questionList = ((ArrayList<ResearchQuestion>)researchApprovalDetail.get(0).get("questionList"));
		for(int i = 0; i < questionList.size(); i++) {
			UploadFile questionImage = ad.questionImage(sqlSession, questionList.get(i).getQuestionNo());
			
			((ArrayList<ResearchQuestion>)researchApprovalDetail.get(0).get("questionList")).get(i).setImage(questionImage);
			
			ArrayList<ResearchChoice> choiceList = questionList.get(i).getRequestChoiceList();
			for(int j = 0; j < choiceList.size(); j++) {
				UploadFile choiceImage = ad.choiceImage(sqlSession, choiceList.get(j).getChoiceNo());
				
				((ArrayList<ResearchQuestion>)researchApprovalDetail.get(0).get("questionList")).get(i).getRequestChoiceList().get(j).setChoiceImage(choiceImage);
			}
		}
		return researchApprovalDetail;
	}

	/**
	 * @Author      : Ungken
	 * @CreateDate  : 2020. 2. 1.
	 * @ModifyDate  : 2020. 2. 2.
	 * @Description : 리서치 신청 승인 & 가격 협상 승인
	 */
	@Override
	public boolean researchApproved(ResearchState researchState) {
		boolean isApproved = false;
		int result1 = ad.researchApproved(sqlSession, researchState);
		
		int result2 = ad.insertConferenceHistory(sqlSession, researchState);
		
		int result3 = ad.updateResearchPrice(sqlSession, researchState);
		if(result1 > 0 && result2 > 0 && result3 > 0) {
			isApproved = true;
		}
		return isApproved;
	}

	/**
	 * @Author      : Ungken
	 * @CreateDate  : 2020. 2. 1.
	 * @ModifyDate  : 2020. 2. 1.
	 * @Description : 리서치 반려
	 */
	@Override
	public boolean researchRefer(ResearchState researchState) {
		boolean isRefer = false;
		int result = ad.researchRefer(sqlSession, researchState);
		if(result > 0) {
			isRefer = true;
		}
		return isRefer;
	}

	/**
	 * @throws SelectException 
	 * @Author      : Ungken
	 * @CreateDate  : 2020. 2. 1.
	 * @ModifyDate  : 2020. 2. 1.
	 * @Description : 리서치 반려 목록 수
	 */
	@Override
	public int getListCountReferList() throws SelectException {
		int listCount = ad.getListCountReferList(sqlSession);
		if(listCount < 0) {
			throw new SelectException("리서치 반려 수 조회 실패");
		}
		return listCount;
	}

	/**
	 * @throws SelectException 
	 * @Author      : Ungken
	 * @CreateDate  : 2020. 2. 1.
	 * @ModifyDate  : 2020. 2. 1.
	 * @Description : 리서치 반려 목록 조회
	 */
	@Override
	public List<Map<String, String>> researchReferList(PageInfo pi) throws SelectException {
		List<Map<String, String>> researchReferList = ad.researchReferList(sqlSession, pi);
		if(researchReferList == null) {
			throw new SelectException("리서치 신청 리스트 조회 실패");
		}
		return researchReferList;
	}

	/**
	 * @Author      : Ungken
	 * @CreateDate  : 2020. 2. 1.
	 * @ModifyDate  : 2020. 2. 1.
	 * @Description : 리서치 반려 상세 조회 
	 */
	@Override
	public List<Map<String, Object>> researchReferDetail(int researchNo) {
		return ad.researchReferDetail(sqlSession, researchNo);
	}

	/**
	 * @throws SelectException 
	 * @Author      : Ungken
	 * @CreateDate  : 2020. 2. 2.
	 * @ModifyDate  : 2020. 2. 2.
	 * @Description : 리서치 납부 대기 및 가격 협상 리스트 수
	 */
	@Override
	public int getListResearchWaitingPayment() throws SelectException {
		int listCount = ad.getListResearchWaitingPayment(sqlSession);
		if(listCount < 0) {
			throw new SelectException("리서치 납부 대기 및 가격 협상 리스트 수 조회 실패");
		}
		return listCount;
	}

	/**
	 * @throws SelectException 
	 * @Author      : Ungken
	 * @CreateDate  : 2020. 2. 2.
	 * @ModifyDate  : 2020. 2. 2.
	 * @Description : 리서치 납부 대기 및 가격 협상 리스트
	 */
	@Override
	public List<Map<String, String>> researchWaitingPayment(PageInfo pi) throws SelectException {
		List<Map<String, String>> researchWaitingPayment = ad.researchWaitingPayment(sqlSession, pi);
		if(researchWaitingPayment == null) {
			throw new SelectException("리서치 납부 대기 및 가격 협상 리스트 조회 실패");
		}
		return researchWaitingPayment;
	}

	/**
	 * @Author      : Ungken
	 * @CreateDate  : 2020. 2. 2.
	 * @ModifyDate  : 2020. 2. 2.
	 * @Description : 리서치 납부 대기 및 가격 협상 상세 보기
	 */
	@Override
	public List<Map<String, Object>> researchWaitPaymentDetail(int researchNo) {
		return ad.researchWaitPaymentDetail(sqlSession, researchNo);
	}

	/**
	 * @Author      : Ungken
	 * @CreateDate  : 2020. 2. 2.
	 * @ModifyDate  : 2020. 2. 2.
	 * @Description : 리서치 가격 협상 반려
	 */
	@Override
	public boolean researchPaymentRefer(ResearchState researchState) {
		boolean isRefer = false;
		int result1 = ad.researchApproved(sqlSession, researchState);
		
		int result2 = ad.insertReferConferenceHistory(sqlSession, researchState);
		
		if(result1 > 0 && result2 > 0) {
			isRefer = true;
		}
		return isRefer;
	}

	/**
	 * @Author      : Ungken
	 * @CreateDate  : 2020. 2. 3.
	 * @ModifyDate  : 2020. 2. 3.
	 * @Description : 결제 이력 수 조회
	 */
	@Override
	public int getListCountPaymentCompletedList() throws SelectException {
		int listCount = ad.getListCountPaymentCompletedList(sqlSession);
		if(listCount < 0) {
			throw new SelectException("결제 이력 수 조회 실패");
		}
		return listCount;
	}

	/**
	 * @throws SelectException 
	 * @Author      : Ungken
	 * @CreateDate  : 2020. 2. 3.
	 * @ModifyDate  : 2020. 2. 3.
	 * @Description : 결제 이력 조회
	 */
	@Override
	public List<Map<String, String>> paymentCompletedList(PageInfo pi) throws SelectException {
		List<Map<String, String>> paymentList = ad.paymentCompletedList(sqlSession, pi);
		if(paymentList == null) {
			throw new SelectException("결제 이력 조회 실패");
		}
		return paymentList;
	}

	/**
	 * @Author      : Ungken
	 * @CreateDate  : 2020. 2. 3.
	 * @ModifyDate  : 2020. 2. 3.
	 * @Description : 결제 이력 상세보기
	 */
	@Override
	public List<Map<String, String>> billsDetail(int billingHistoryNo) {
		return ad.billsDetail(sqlSession, billingHistoryNo);
	}

	/**
	 * @throws SelectException 
	 * @Author      : Ungken
	 * @CreateDate  : 2020. 2. 3.
	 * @ModifyDate  : 2020. 2. 3.
	 * @Description : 리서치 재구성 대기 목록 수
	 */
	@Override
	public int getListCountSurveyReconstructionList() throws SelectException {
		int listCount = ad.getListCountSurveyReconstructionList(sqlSession);
		if(listCount < 0) {
			throw new SelectException("리서치 재구성 대기 목록 수 조회 실패");
		}
		return listCount;
	}

	/**
	 * @throws SelectException 
	 * @Author      : Ungken
	 * @CreateDate  : 2020. 2. 3.
	 * @ModifyDate  : 2020. 2. 3.
	 * @Description : 리서치 재구성 대기 목록
	 */
	@Override
	public List<Map<String, String>> surveyReconstructionList(PageInfo pi) throws SelectException {
		List<Map<String, String>> paymentList = ad.surveyReconstructionList(sqlSession, pi);
		if(paymentList == null) {
			throw new SelectException("리서치 재구성 대기 목록 조회 실패");
		}
		return paymentList;
	}

	/**
	 * @Author      : Ungken
	 * @CreateDate  : 2020. 2. 4.
	 * @ModifyDate  : 2020. 2. 4.
	 * @Description : 리서치 재구성
	 */
	@Override
	public boolean reconstruction(Research research, ArrayList<ResearchQuestion> questionList) {
		boolean isReconstruction = false;
		
		int result1 = ad.deleteDiscriminationChoice(sqlSession, research);
		int result2 = ad.deleteDiscriminationQuestion(sqlSession, research);
		ArrayList<ResearchQuestion> discriminationQuestionList = research.getQuestionList();
		
		int result3 = 0;
		for(int i = 0; i < questionList.size(); i++) {
			result3 += ad.reconstruction(sqlSession, questionList.get(i));
		}
		
		int result4 = 0;
		for(int i = 0; i < discriminationQuestionList.size(); i++) {
			result4 += ad.insertDiscriminationQuestion(sqlSession, discriminationQuestionList.get(i));
		}
		
		if(result4 == discriminationQuestionList.size()) {
			for(int i = 0; i < discriminationQuestionList.size(); i++) {
				for(int j = 0; j < discriminationQuestionList.get(i).getRequestChoiceList().size(); j++) {
					discriminationQuestionList.get(i).getRequestChoiceList().get(j).setRquestionNo(discriminationQuestionList.get(i).getQuestionNo());
				}
			}
			ArrayList<ResearchChoice> choiceList = new ArrayList<>();
			for(int i = 0; i < discriminationQuestionList.size(); i++) {
				for(int j = 0; j < discriminationQuestionList.get(i).getRequestChoiceList().size(); j++) {
					choiceList.add(discriminationQuestionList.get(i).getRequestChoiceList().get(j));
				}
			}
			int result5 = 0;
			for(int i = 0; i < choiceList.size(); i++) {
				result5 += ad.insertDiscriminationChoice(sqlSession, choiceList.get(i));
			}
			
			if(result5 == choiceList.size()) {
				ResearchState researchState = new ResearchState();
				researchState.setResearchNo(research.getResearchNo());
				int result6 = ad.researchReconstruction(sqlSession, researchState);
				int result7 = ad.updateResearchNamePanel(sqlSession, research);
			}
		}
		return isReconstruction;
	}

	/**
	 * @Author      : Ungken
	 * @CreateDate  : 2020. 2. 4.
	 * @ModifyDate  : 2020. 2. 4.
	 * @Description : 조사 대상자 판별퀴즈 불러오기
	 */
	@Override
	public List<Map<String, Object>> discriminationDetail(int researchNo) {
		return ad.discriminationDetail(sqlSession, researchNo);
	}

	@Override
	public boolean reconstructureRefer(ResearchState researchState) {
		boolean isRefer = false;
		int result1 = ad.reconstructureRefer(sqlSession, researchState);
		
		int result2 = ad.reconstructureReferConferenceHistory(sqlSession, researchState);
		if(result1 > 0 && result2 > 0) {
			isRefer = true;
		}
		return isRefer;
	}

	/**
	 * @throws ResearchException 
	 * @Author      : yhj
	 * @CreateDate  : 2020. 2. 5.
	 * @ModifyDate  : 2020. 2. 6.
	 * @Description : 리서치타겟정보 가져오기
	 */
	@Override
	public boolean researchTargetMailing(int researchNo) throws ResearchException {
		InetAddress inet;
		String svrIp = "";
		try {
			inet = InetAddress.getLocalHost();
			svrIp = inet.getHostAddress();
		} catch (UnknownHostException e1) {
			e1.printStackTrace();
		}
		
		ResearchTarget target = ad.researchTargetMailing(sqlSession, researchNo);
		if(!target.getTargetAgeRange().equals("all")) {
			String[] targetAgeRange = target.getTargetAgeRange().split("-");
			target.setMinAge(Integer.parseInt(targetAgeRange[0]));
			target.setMaxAge(Integer.parseInt(targetAgeRange[1]));
		} else {
			target.setMinAge(0);
			target.setMaxAge(100);
		}
		System.out.println("=====");
		System.out.println(target);
		System.out.println("=====");
		
//		metropolitan이면 1, 2, 8
//		city면 1, 2, 3, 4, 5, 6, 7
//		occupationNo가 13이면 all
//		먼저 나이가 all인지 아닌지 확인하고 -> location이 어딘지 확인하고 -> occupation을 확인하면 되는듯
//		ex) 나이대가 20~30이고 location이 metropolitan이고 occupation이 13일 경우
		int researchEngagementGoals = ad.selectResearchEngagementGoals(sqlSession, target.getResearchNo());
		System.out.println(researchEngagementGoals);
		List<TargetMember> targetList = ad.getTargetList(sqlSession, target, researchEngagementGoals);
		System.out.println("=================================");
		System.out.println(targetList);
		System.out.println("=================================");
		ResearchOne research = ad.selectResearchOne(sqlSession, researchNo);   
		    //메일링 히스토리
			if(target.getResearchStateNo() == 5) {
				int insertMailingHistory = ad.insertMailingHistory(sqlSession, target.getResearchNo());
				if(insertMailingHistory == 0) {
					throw new ResearchException("메일링 히스토리 insert 실패");
				} else {
					int insertRStatusHistory = ad.insertRStatusHistory(sqlSession, target.getResearchNo());
					if(insertRStatusHistory == 0) {
						throw new ResearchException("리서치상태이력 insert 실패");
					} else {
						int mailingHistoryNo = ad.selectMailingHistoryNo(sqlSession, target.getResearchNo());
						for(int i = 0; i < targetList.size(); i++) {
							MailingReceiver mr = new MailingReceiver();
							mr.setMailingHistoryNo(mailingHistoryNo);
							mr.setMno(targetList.get(i).getMno());
							int insesrtMailingReceiver = ad.insertMailingReceiver(sqlSession, mr);
							if(insesrtMailingReceiver == 0) {
								throw new ResearchException("메일링 리시버 insert 실패");
							} else {
								//메일 전송 부분 시작
								String setfrom = "yychani94@gmail.com";         
							    String tomail  = targetList.get(i).getTargetEmail();     // 받는 사람 이메일
							    String title   = "리서치 안내메일입니다.";      // 제목
//							    String content = "test이메일입니다. 리서치 하세요";
							    String content = "<form action='http://" + svrIp + ":8001/survway/panelLogin.panel' method='GET'> "
				    					+ "<p> 안녕하세요, 서브웨이입니다. <br> 회원님께서 참여 가능하신 설문조사가 등록되었으니 참여하시고 리워드 받아가세요! </p> "
//				    					+ "<input type='hidden' name='userId' value='" + pm.getUserId() + "'>"
				    					+ "<button type='submit' style='width: 370px; cursor: pointer; height: 70px; border: 0;  background: #00679A; color: white; font-size: 20pt; margin-top: 10px;'>리서치 참여하기</button>"
				    				+ " </form>";    // 내용
							   
							    try {
									MimeMessage message = mailSender.createMimeMessage();
									MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
									 
									messageHelper.setFrom(setfrom);  // 보내는사람 생략하거나 하면 정상작동을 안함
									messageHelper.setTo(tomail);     // 받는사람 이메일
									messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
									messageHelper.setText(content);  // 메일 내용
					 
									String contents = "<img src=\"cid:logo\" style='width: 420px;'>" + content; 
									messageHelper.setText(contents, true); 
									
									FileSystemResource file = new FileSystemResource(new File("C:\\images\\survwayLogo.png")); 
									messageHelper.addInline("logo", file);

									mailSender.send(message);
							    } catch(Exception e){
							      System.out.println(e);
							    }
								//메일 전송 부분 끝
							}
					}
				}
			}
		} else {
			/* 리서치상태가 6번일때 작성 */
			int insertMailingHistoryRe = ad.insertMailingHistoryRe(sqlSession, target.getResearchNo());
			if(insertMailingHistoryRe == 0) {
				throw new ResearchException("메일링 히스토리 insert 실패");
			} else {
				int mailingHistoryNo = ad.selectMailingHistoryNo(sqlSession, target.getResearchNo());
//				int mailingHistoryOrder = ad.selectMailingHistoryOrder(sqlSession, target.getResearchNo());
				for(int i = 0; i < targetList.size(); i++) {
					MailingReceiver mr = new MailingReceiver();
					mr.setMailingHistoryNo(mailingHistoryNo);
					mr.setMno(targetList.get(i).getMno());
					int insesrtMailingReceiver = ad.insertMailingReceiver(sqlSession, mr);
					if(insesrtMailingReceiver == 0) {
						throw new ResearchException("메일링 리시버 insert 실패");
					} else {
						//메일 전송 부분 시작
						String setfrom = "yychani94@gmail.com";         
					    String tomail  = targetList.get(i).getTargetEmail();     // 받는 사람 이메일
					    String title   = "서브웨이 설문조사 알림입니다.";      // 제목
//					    String content = "test이메일입니다. 리서치 하세요";
					    String content = "<form action='http://" + svrIp + ":8001/survway/panelLogin.panel' method='GET'> "
					    					+ "<p> 안녕하세요, 서브웨이입니다. <br> 회원님께서 참여 가능하신 설문조사가 등록되었으니 참여하시고 리워드 받아가세요! </p> "
//					    					+ "<input type='hidden' name='userId' value='" + pm.getUserId() + "'>"
					    					+ "<button type='submit' style='width: 370px; cursor: pointer; height: 70px; border: 0;  background: #00679A; color: white; font-size: 20pt; margin-top: 10px;'>리서치 참여하기</button>"
					    				+ " </form>";    // 내용
						   
					   
					    try {
							MimeMessage message = mailSender.createMimeMessage();
							MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
							 
							messageHelper.setFrom(setfrom);  // 보내는사람 생략하거나 하면 정상작동을 안함
							messageHelper.setTo(tomail);     // 받는사람 이메일
							messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
							messageHelper.setText(content);  // 메일 내용
			 
							String contents = "<img src=\"cid:logo\" style='width: 420px;'>" + content; 
							messageHelper.setText(contents, true); 
							
							FileSystemResource file = new FileSystemResource(new File("C:\\images\\survwayLogo.png")); 
							messageHelper.addInline("logo", file);

							mailSender.send(message);
					    } catch(Exception e){
					      System.out.println(e);
					    }
						//메일 전송 부분 끝
					}
				}
			}
		}
		return true;
	}
  /**
	 * @Author      : hjheo
	 * @CreateDate  : 2020. 2. 5.
	 * @ModifyDate  : 2020. 2. 5.
	 * @Description : ts리서치 불러오기
	 */
	@Override
	public List<Object> tsQaManagement() {
		List<Object> r = ad.tsQaManagement(sqlSession);
		return r;
	}

	/**
	 * @Author      : hjheo
	 * @CreateDate  : 2020. 2. 6.
	 * @ModifyDate  : 2020. 2. 6.
	 * @Description : ts리서치 업데이트 딜리트후에 다시넣어야함
	 */
	@Override
	public int tsQaManagementUpdate(ArrayList<ResearchQuestion> questionList) {
		System.out.println("service");
		int result = 0;
		ad.tsDeleteChoice(sqlSession);
		System.out.println("deleteChoice함");
		//ad.tsDeleteQuestion(sqlSession);
		int result1 = 0;
		for(int i = 0; i < questionList.size(); i++) {
			ResearchQuestion question = questionList.get(i);
			result1 += ad.insertQuestion(sqlSession, questionList.get(i));
			
			int result2 = 0;
			if(question.getQuestionFormNo() == 1) {
				for(int j = 0; j < question.getRequestChoiceList().size(); j++) {
					int questionNo = questionList.get(i).getQuestionNo();
					questionList.get(i).getRequestChoiceList().get(j).setRquestionNo(questionNo);
				}
				
				for(int j = 0; j < question.getRequestChoiceList().size(); j++) {
					result2 += ad.insertChoice(sqlSession, questionList.get(i).getRequestChoiceList().get(j));
				}
			}
			
		}
		return result;
	}

	/**
	 * @Author	:hansol
	 * @CreateDate	:2020. 2. 9.
	 * @ModifyDate	:2020. 2. 9.
	 * @Description	:패널의 thanksSurvey정보 가지고오기
	 */
	@Override
	public List<PanelThanksSurvey> selectPanelTs(PanelThanksSurvey ps) {
		
		List<PanelThanksSurvey> list = ad.selectPanelTs(sqlSession, ps);
		return list;
	}
	
	/**
	 * @Author      : yhj
	 * @CreateDate  : 2020. 2. 10.
	 * @ModifyDate  : 2020. 2. 10.
	 * @Description : 메일링 카운트
	 */
	@Override
	public int getListCountMailingList(MailingList list) {
		return ad.getListCountMailingList(sqlSession, list);
	}
	
	/**
	 * @Author      : yhj
	 * @CreateDate  : 2020. 2. 10.
	 * @ModifyDate  : 2020. 2. 10.
	 * @Description : 메일링 리스트 불러오기
	 */
	@Override
	public List<MailingList> selectMailingList(MailingList list) {
		List<MailingList> mailingList = ad.selectMailingList(sqlSession, list);
		System.out.println("=========serviceImpl=========");
		System.out.println("list : " + mailingList.size());
		for(int i = 0; i < mailingList.size(); i++) {
			System.out.println("for문 실행 : " + i);
			if(mailingList.get(i).getResearchStateNo() == 6) {
				System.out.println("researchStataNo() == 6 실행 : ");
				int mailingHistoryOrder = ad.selectMailingHistoryOrder(sqlSession, mailingList.get(i).getResearchNo());
				System.out.println("mailingHistoryOrder" + mailingHistoryOrder);
				mailingList.get(i).setResearchStatus(String.valueOf(mailingHistoryOrder));
				mailingList.get(i).setCurrentMailingDate(ad.selectMailingHistoryCurrentDate(sqlSession, mailingList.get(i).getResearchNo()));
				mailingList.get(i).setResearchPeriod(ad.selectResearchPeriod(sqlSession, mailingList.get(i).getResearchNo()));
			}
			System.out.println(mailingList.get(i));
			
//			if(mailingList.get(i).getResearchStateNo() == 5) {
//				mailingList.get(i).set`
//			}
		}
		System.out.println("=============================");
		
		return mailingList;
	}

	/**
	 * @Author      : hjheo
	 * @CreateDate  : 2020. 2. 7.
	 * @ModifyDate  : 2020. 2. 7.
	 * @Description : pc환경조사 음성 파일 넣기
	 */
	@Override
	public int uploadAudio(UploadFile ufo) {
		
		int result = ad.uploadAudio(sqlSession,ufo);
		System.out.println("pc");
		return result;
	}

	@Override
	public List<ResearchReport> selectResearchReportList() {
		return ad.selectResearchReportList(sqlSession);
	}

	@Override
	public List<ResearchHistory> selectResearchHistoryList(int researchNo) {
//		int historyListCount =ad.selectResearchHistoryCount(sqlSession, researchNo);
		List<ResearchHistory> historyList = ad.selectResearchHistoryList(sqlSession, researchNo);
		System.out.println(historyList);
		
//		List<Integer> selectRquestionNoList = ad.selectRquestionNoList(sqlSession, researchNo);
//		System.out.println(selectRquestionNoList);
		return historyList;
	}

	@Override
	public List<RquestionNo> selectRquestionNoList(int researchNo) {
		return ad.selectRquestionNoList(sqlSession, researchNo);
	}

	@Override
	public List<ResearchGraphTemp2> selectResearchHistoryCountList(ResearchGraphTemp temp) {
		return ad.selectResearchHistoryCountList(sqlSession, temp);
	}

	@Override
	public List<Question> selectQuestionList(int researchNo) {
		return ad.selectQuestionList(sqlSession, researchNo);
	}

	@Override
	public List<Choice> selectChoiceList(int researchNo) {
		return ad.selectChoiceList(sqlSession, researchNo);
	}

	@Override
	public ResearchOne selectResearchOne(int researchNo) {
		return ad.selectResearchOne(sqlSession, researchNo);
	}

	/**
	 * @throws ResearchException 
	 * @Author	:hansol
	 * @CreateDate	:2020. 2. 11.
	 * @ModifyDate	:2020. 2. 11.
	 * @Description	:패널 회원의 등급을 활성화 회원으로 바꾸는 메소드
	 */
	@Override
	public int updatePanelLevel(int mno) throws ResearchException {
		
		int result = ad.updatePanelLevel(sqlSession, mno);
		
		if(result <0) {
			throw new ResearchException("패널회원의 등급을 활성화 하는데 실패 하였습니다.");
		}
		return result;
	}

	/**
	 * @throws ResearchException 
	 * @Author	:hansol
	 * @CreateDate	:2020. 2. 11.
	 * @ModifyDate	:2020. 2. 11.
	 * @Description	:관리자의 반려로 인한 thanksSurvey삭제 메소드
	 */
	@Override
	public int deletePanelThanksSurvey(int mno) throws ResearchException {
		int result = ad.deletePanelThanksSurvey(sqlSession, mno);
		
		if(result <0) {
			throw new ResearchException("thanksSurvey삭제를 실패하셨습니다.");
		}
		
		return result;
	}

	@Override
	public int audioEnviron(String questionTitle, String[] choiceTitleArr, String[] choiceOrderArr,String titleContext,String questionFormNo) {
		
		ArrayList<ResearchChoice> choiceList = new ArrayList<>();
		
		for(int i = 0; i < choiceOrderArr.length; i++) {
			ResearchChoice choice = new ResearchChoice();
			
			choice.setChoiceContext(choiceTitleArr[i]);
			choice.setChoiceOrder(Integer.parseInt(choiceOrderArr[i]));
			
			choiceList.add(choice);
		}
		ResearchQuestion req =new ResearchQuestion();
		req.setRquestionContext(titleContext);
		req.setQuestionFormNo(Integer.parseInt(questionFormNo));
		req.setMediaExplain(questionTitle);
		
		ad.mergeQuestion(sqlSession,req);
		
		
		
		
		
		
		int result = ad.deleteChoice(sqlSession);
		if(result > 0) {
			for(int i = 0; i < choiceList.size(); i++) {
				ad.insertAudioChoice(sqlSession, choiceList.get(i));
				System.out.println("choiceList.get(i) : " + choiceList.get(i));
			}
		}
		
		return result;
	}

	/**
	 * @Author      : hjheo
	 * @CreateDate  : 2020. 2. 13.
	 * @ModifyDate  : 2020. 2. 13.
	 * @Description : 영상 yotube주소 포함 저장
	 */
	@Override
	public int videoInsert(String questionTitle, String[] choiceTitleArr, String[] choiceOrderArr, String titleContext,
			String questionFormNo, String videoAdress) {
		
		ArrayList<ResearchChoice> choiceList = new ArrayList<>();
		
		for(int i = 0; i < choiceOrderArr.length; i++) {
			ResearchChoice choice = new ResearchChoice();
			
			choice.setChoiceContext(choiceTitleArr[i]);
			choice.setChoiceOrder(Integer.parseInt(choiceOrderArr[i]));
			
			choiceList.add(choice);
		}
		ResearchQuestion req =new ResearchQuestion();
		req.setRquestionContext(titleContext);
		req.setQuestionFormNo(Integer.parseInt(questionFormNo));
		req.setMediaExplain(questionTitle);
		req.setQuestionVideoLink(videoAdress);
		
		ad.mergeVideoQuestion(sqlSession,req);
		
		int result = ad.deleteChoice(sqlSession);
		if(result > 0) {
			for(int i = 0; i < choiceList.size(); i++) {
				ad.insertAudioChoice(sqlSession, choiceList.get(i));
				System.out.println("choiceList.get(i) : " + choiceList.get(i));
			}
		}
		return result;
	}

	@Override
	public ResearchQuestion pcQaManagement() {
		ResearchQuestion rq = ad.pcQaManagement(sqlSession); 
		return rq;
	}

	@Override
	public int uploadReport(UploadFile ufo) {
		return 0;
  }
  
  @Override
	public int getPanelCount() {
		return ad.getPanelCount(sqlSession);
	}

	@Override
	public int getCorpCount() {
		return ad.getCorpCount(sqlSession);
	}

	@Override
	public int getResearchCount() {
		return ad.getResearchCount(sqlSession);
	}

	@Override
	public int getListCountdisposalResponseList() throws SelectException {
		int getListCountdisposalResponseList = ad.getListCountdisposalResponseList(sqlSession);

		if(getListCountdisposalResponseList == 0) {
			throw new SelectException("폐기 응답 수 조회 실패");
		}
		return getListCountdisposalResponseList;
	}

	@Override
	public List<Map<String, String>> disposalResponseList(PageInfo pi) throws SelectException {
		List<Map<String, String>> disposalResponseList = ad.disposalResponseList(sqlSession, pi);
		
		if(disposalResponseList == null) {
			throw new SelectException("폐기 응답 조회 실패");
		}
		return disposalResponseList;
	}

}