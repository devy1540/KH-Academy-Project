package com.opera.survway.panel.model.service;


import com.opera.survway.common.model.vo.PageInfo;
import com.opera.survway.common.model.vo.UploadFile;
import com.opera.survway.exception.*;
import com.opera.survway.panel.model.dao.PanelDao;
import com.opera.survway.panel.model.vo.*;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import javax.mail.internet.MimeMessage;
import java.io.File;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;


@Service
public class PanelServiceImpl implements PanelService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private PanelDao pd;
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	@Autowired
	private JavaMailSender mailSender; // Mail Sender
	
	
	/**
	 * @Author      : Oh
	 * @CreateDate  : 2020-01-19
	 * @ModifyDate  : 2020-01-21
	 * @Description : 로그인 기능
	 */
	@Override
	public PanelMember loginMember(PanelMember pm) throws LoginException {
		
		PanelMember loginUser = null;
		
		String encPassword = pd.selectEncPassword(sqlSession, pm);
		if(passwordEncoder.matches(pm.getUserPwd(), encPassword)) {
			loginUser = pd.loginCheck(sqlSession, pm);
		}else {
			throw new LoginException("로그인 정보가 일치하지 않습니다");
		}
		
		return loginUser;
	}

	/**
	 * @Author      : Oh
	 * @CreateDate  : 2020-01-19
	 * @ModifyDate  : 2020-01-21
	 * @Description : 회원가입 기능
	 */
	@Override
	public int insertMember(PanelMember pm) throws LoginException {
		
		int resultMemberTable=0;
		int resultPanelTable=0;
		
		resultMemberTable = pd.insertMemberTable(sqlSession, pm);
		if(resultMemberTable > 0) {
			int mno = pd.selectMno(sqlSession, pm);
			pm.setMno(mno);
			resultPanelTable = pd.insertPanelTable(sqlSession, pm);
			if(resultPanelTable > 0) {
				pd.insertTermsPanel(sqlSession, pm);
				pd.insertRewardPanel(sqlSession, pm);
				pd.insertTernaryPanel(sqlSession, pm);
			}
			int result = pd.updateNomineeReward(sqlSession, pm.getNominee());
			if(result > 0) {
				//해당 추천인이 존재하면 피추천인의 리워드 100포인트 증가
				int result2 = pd.updateUserReward(sqlSession, pm);
				if(result2 > 0) {
					// 추천자의 리워드도 500포인트 증가
					int result3 = pd.insertRewardNomineeHistory(sqlSession, pm.getNominee());
					int result4 = pd.insertRewardUserHistory(sqlSession, pm);
					
				}
			} 
			
		}
		
		if(!(resultMemberTable>0 && resultPanelTable>0)) {
			throw new LoginException("회원가입 실패!");
		}else {
			return 0;
		}
	}

	/**
	 * @throws InquiryException 
	 * @Author	:hansol
	 * @CreateDate	:2020. 1. 22.
	 * @ModifyDate	:2020. 1. 22.
	 * @Description	: 1:1문의 등록
	 */
	@Override
	public int insertInquiry(Inquiry i) throws InquiryException {
		int result =0;
		
		result=pd.insertInquiry(sqlSession, i);
		
		if(!(result >0)) {
			throw new InquiryException("1:1문의 등록 실패");
		}
		
		return result;
	}

	/**
	 * @throws InquiryException 
	 * @Author	:hansol
	 * @CreateDate	:2020. 1. 23.
	 * @ModifyDate	:2020. 1. 23.
	 * @Description	:1:1문의  조회
	 */
	@Override
	public List<Inquiry> selectAllMyInquiry(Inquiry i) throws InquiryException {
		
		List<Inquiry> list = pd.selectAllMyInquiry(sqlSession, i); 
		
		if(list == null) {
			throw new InquiryException("1:1문의 목록 조회 실패");
		}
		
		return list;
	}

	/**
	 * @throws InquiryException 
	 * @Author	:hansol
	 * @CreateDate	:2020. 1. 24.
	 * @ModifyDate	:2020. 1. 24.
	 * @Description	:1:1문의 개수
	 */
	@Override
	public int getListCountInquiry(Inquiry iq) throws InquiryException {
		
		int listCount = pd.getListCountInquiry(sqlSession, iq);
		
		if(listCount <=0) {
			throw new InquiryException("1:1문의수 조회 실패");
		}
		return listCount;
	}
	/**
	 * @Author      : yhj
	 * @CreateDate  : 2020. 1. 22.
	 * @ModifyDate  : 2020. 1. 22.
	 * @Description : 회원정보수정(비밀번호X)
	 */
	@Override
	public int updateMemberInfo(PanelMember pm) {
		
		return pd.updateMemberInfo(sqlSession, pm);
	}

	/**
	 * @Author      : yhj
	 * @CreateDate  : 2020. 1. 24.
	 * @ModifyDate  : 2020. 1. 24.
	 * @Description : 회원정보수정(비밀번호)
	 */
	@Override
	public int updatePassword(PanelMember pm) {
		return pd.updatePassword(sqlSession, pm);
	}

	/**
	 * @throws RewardException 
	 * @Author	:hansol
	 * @CreateDate	:2020. 1. 27.
	 * @ModifyDate	:2020. 1. 27.
	 * @Description	:리워드 적립내역 listcount
	 */
	@Override
	public int getListCountRewardSaved(Reward rd) throws RewardException {
		int listCount = pd.getListCountRewardSaved(sqlSession, rd);
		
		if(listCount <=0) {
			throw new RewardException("리워드 적립내역 listCount 조회실패");
		}
		return listCount;
		
	}
	
	/**
	 * @throws RewardException 
	 * @Author	:hansol
	 * @CreateDate	:2020. 1. 27.
	 * @ModifyDate	:2020. 1. 27.
	 * @Description	:리워드 적립내역
	 */
	@Override
	public List<Reward> showMyRewardDetailSaved(Reward rd) throws RewardException {
		
		List<Reward> list = pd.showMyRewardDetailSaved(sqlSession, rd);
		
		if(list == null) {
			throw new RewardException("리워드 적립내역 조회 실패");
		}
		
		return list;
	}

	/**
	 * @throws RewardException 
	 * @Author	:hansol
	 * @CreateDate	:2020. 1. 28.
	 * @ModifyDate	:2020. 1. 28.
	 * @Description	:리워드 사용 내역 보기
	 */
	@Override
	public List<Reward> showRewardDetailUsed(Reward r) throws RewardException {
		
		List<Reward> list = pd.showMyRewardDetailUsed(sqlSession, r);
		
		if(list == null) {
			throw new RewardException("리워드 사용내역 조회 실패");
		}
		
		return list;
	}

	/**
	 * @throws RewardException 
	 * @Author	:hansol
	 * @CreateDate	:2020. 1. 28.
	 * @ModifyDate	:2020. 1. 28.
	 * @Description	:리워드 사용 내역 listcount
	 */
	@Override
	public int getListCountRewardUsed(Reward r) throws RewardException {
		int listCount = pd.getListCountRewardUsed(sqlSession, r);
		
		if(listCount <=0) {
			throw new RewardException("리워드 사용내역 listCount 조회실패");
		}
		return listCount;
	}

	/*
	 * @Author      : yhj
	 * @CreateDate  : 2020. 1. 26.
	 * @ModifyDate  : 2020. 1. 26.
	 * @Description : 회원탈퇴
	 */
	@Override
	public int updateLeaveMember(PanelMember pm) {
		return pd.updateLeaveMember(sqlSession, pm);
	}

	/**
	 * @throws SelectException 
	 * @Author      : hjheo
	 * @CreateDate  : 2020. 1. 27.
	 * @ModifyDate  : 2020. 1. 27.
	 * @Description : 공지사항 수 조회 
	 */
	@Override
	public int getNoticeListCount(SearchNotice searchNotice) throws SelectException {
		int listCount=0;
		listCount = pd.getNoticeListCount(sqlSession,searchNotice);
		
		if(listCount<0) {
			throw new SelectException("공지사항 수 조회 실패");
		}
		return listCount;
	}

	@Override
	public List<Notice> selectNoticeList(SearchNotice searchNotice) throws SelectException {
		List<Notice> noticeList =null;
		
		noticeList = pd.selectNoticeList(sqlSession, searchNotice);
		 
		if(noticeList == null) {
			throw new SelectException("공지사항 조회 실패");
		}
		return noticeList;
  }
	/**
	 * @throws SelectException 
	 * @Author      : yhj
	 * @CreateDate  : 2020. 1. 28.
	 * @ModifyDate  : 2020. 1. 28.
	 * @Description : 메인페이지에서 공지사항 조회
	 */
	@Override
	public List<Notice> selectMainNoticeList() throws SelectException {
		return pd.selectMainNoticeList(sqlSession);
	}

	/**
	 * @throws SelectException 
	 * @Author      : yhj
	 * @CreateDate  : 2020. 1. 28.
	 * @ModifyDate  : 2020. 1. 28.
	 * @Description : 메인페이지에서 리서치 조회
	 */
	@Override
	public List<Research> selectMainResearchList(PanelMember loginUser) throws SelectException {
		return pd.selectMainResearchList(sqlSession, loginUser);
	}

	/**
	 * @throws RewardException 
	 * @Author	:hansol
	 * @CreateDate	:2020. 1. 30.
	 * @ModifyDate	:2020. 1. 30.
	 * @Description	:패널 리워드량 가져오기
	 */
	@Override
	public Reward getPanelReward(int mno) throws RewardException {
		Reward r = null;
		
		r = pd.getPanelReward(sqlSession, mno);
		
		if(r == null) {
			throw new RewardException("패널이 보유한 리워드를 조회하지 못했습니다.");
		}
		return r;
	}

	/**
	 * @throws RewardException 
	 * @Author	:hansol
	 * @CreateDate	:2020. 1. 30.
	 * @ModifyDate	:2020. 1. 30.
	 * @Description	:insert cashoutHistory, insertRewardHistory, updatePanelReward
	 */
	@Override
	public int insertCashOutHistory(Reward r) throws RewardException {
		
		int result = pd.insertCashOutHistory(sqlSession,r);
		if(result >0) {
			result = pd.insertRewardHistory(sqlSession,r);
			if(result >0) {
				result = pd.updatePanelReward(sqlSession,r);
			}else if(result<0) {
				throw new RewardException("rewardHistory insert 실패");
			}
		}else if(result <0) {
			throw new RewardException("cashouthistory insert 실패");
		}
		return result;
  }

	/*
	 * @throws SelectException 
	 * @Author      : Sooo
	 * @CreateDate  : 2020. 1. 31.
	 * @ModifyDate  : 2020. 1. 31.
	 * @Description : ts조사 질문 문항들 및 보기 리스트 조회
	 */
	@Override
	public List<ResearchQuestion> getTsQuestionList() throws SelectException {
		
		//TS문제 정보들 받아와서 ResearchQuestion 리스트에 담기
		List<ResearchQuestion> tsQuestions = null;
		tsQuestions = pd.getTsQuestionList(sqlSession);
		
		//반복문으로 rquestionNo 하나씩 보내서 해당 choice들 조회해와서 ResearchChoice 어레이리스트에 담고 이걸 setter로 ResearchQuestion객체에 담기
		List<ResearchChoice> tsChoices = null;
		for(int i=0; i<tsQuestions.size(); i++) {
			tsChoices = pd.getTsChoiceList(sqlSession, tsQuestions.get(i).getRquestionNo());
			tsQuestions.get(i).setChoiceList(tsChoices);
		}
		return tsQuestions;
	}

	/**
	 * @throws InquiryException 
	 * @Author	:hansol
	 * @CreateDate	:2020. 2. 3.
	 * @ModifyDate	:2020. 2. 3.
	 * @Description	:자주묻는 질문 등록
	 */
	@Override
	public int insertFaq(Faq faq) throws InquiryException {
		
		int result = pd.insertFaq(sqlSession, faq);
		
		if(result <0) {
			throw new InquiryException("자주묻는 질문 등록 실퍄");
		}
		
		return result;
	}

	@Override
	public int getListCountFaq(Faq f) throws InquiryException {

		int listCount = pd.getListCountFaq(sqlSession, f);
		
		if(listCount <=0) {
			throw new InquiryException("자주묻는 질문수 조회 실패");
		}
		return listCount;
		
	}

	/**
	 * @Author	:hansol
	 * @CreateDate	:2020. 2. 3.
	 * @ModifyDate	:2020. 2. 3.
	 * @Description	:자주묻는 질문 리스트 가져오기
	 */
	@Override
	public List<Faq> selectAllFaq(Faq f) throws InquiryException {
		
		List<Faq> list = pd.selectAllFaq(sqlSession,f);
		
		if(list == null) {
			throw new InquiryException("자주묻는 질문 리스트 가져오기 실패");
		}
		
		return list;
	}

	/**
	 * @throws InquiryException 
	 * @Author	:hansol
	 * @CreateDate	:2020. 2. 3.
	 * @ModifyDate	:2020. 2. 3.
	 * @Description	:자주묻는 질문 삭제
	 */
	@Override
	public int deleteFaq(Faq f) throws InquiryException {
		
		int num = pd.deleteFaq(sqlSession, f);
		
		if(num <=0) {
			throw new InquiryException("자주묻는 질문 삭제 실패");
		}
		return num;
	}

	/**
	 * @throws InquiryException 
	 * @Author	:hansol
	 * @CreateDate	:2020. 2. 3.
	 * @ModifyDate	:2020. 2. 3.
	 * @Description	:자주 묻는 질문 수정
	 */
	@Override
	public int updateFaq(Faq f) throws InquiryException {
		int result = pd.updateFaq(sqlSession,f);
		
		if(result <=0) {
			throw new InquiryException("faq 수정 실패");
		}
		return result;
	}
	 /*
	 * @throws SurveyException 
	 * @Author      : Sooo
	 * @CreateDate  : 2020. 2. 1.
	 * @ModifyDate  : 2020. 2. 1.
	 * @Description : 로그인된 패널이 참여할 수 있는 설문조사 갯수 조회
	 */
	@Override
	public int getCountMyResearch(PanelMember loginUser) {
		return pd.getCountMyResearch(sqlSession, loginUser);
	}

	/**
	 * @throws SurveyException 
	 * @Author      : Sooo
	 * @CreateDate  : 2020. 2. 1.
	 * @ModifyDate  : 2020. 2. 1.
	 * @Description : 로그인된 패널이 참여할 수 있는 설문조사 목록 조회
	 */
	@Override
	public List<Research> getMyResearchList(PanelMember loginUser, PageInfo pi) {
		List<Research> myResearchList = null;
		myResearchList = pd.getMyResearchList(sqlSession, loginUser, pi);
		return myResearchList;
	}

	/**
	 * @throws SelectException 
	 * @Author      : Sooo
	 * @CreateDate  : 2020. 2. 3.
	 * @ModifyDate  : 2020. 2. 3.
	 * @Description : 설문조사 목록 중 선택한 설문조사에 대한 문제 및 보기 리스트 조회
	 */
	@Override
	public List<ResearchQuestion> getResearchQuestionList(String researchNo, String rquestionVideolink) throws SelectException {
		
		List<ResearchQuestion> researchQuestions = new ArrayList<ResearchQuestion>();
		List<ResearchChoice> researchChoices = new ArrayList<ResearchChoice>();
		
		//미디어가 있다면 pc환경조사 먼저 가져와서 리스트에 먼저 담기
		if(rquestionVideolink != null) {
			ResearchQuestion pcQuestion = pd.getPcQuestion(sqlSession);
			pcQuestion.setCorrectAnswer(pcQuestion.getQuestionFormNo());
			pcQuestion.setQuestionFormNo(1);
			List<ResearchChoice> pcChoices = pd.getPcChoices(sqlSession, pcQuestion.getRquestionNo());
			pcQuestion.setChoiceList(pcChoices);
			pcQuestion.setQuestionType("pc");
			researchQuestions.add(pcQuestion);
		}
		
		//조사대상자테이블 조회해서 조사대상자퀴즈가 있다면 pc환경조사 다음에 담기
		List<ResearchQuestion> targetQuestions = pd.getTargetQuestions(sqlSession, researchNo);
		if(targetQuestions != null) {
			for(int i=0; i<targetQuestions.size(); i++) {
				targetQuestions.get(i).setQuestionFormNo(1);
				List<ResearchChoice> targetChoices = pd.getTargetChoiceList(sqlSession, targetQuestions.get(i).getRquestionNo());
				targetQuestions.get(i).setChoiceList(targetChoices);
				targetQuestions.get(i).setQuestionType("target");
				researchQuestions.add(targetQuestions.get(i));
			}
		}
		
		//선택한 researchNo로  ResearchQuestion 받아와서 리스트에 담기
		List<ResearchQuestion> rquestions = pd.getResearchQuestionList(sqlSession, researchNo);
				
		//반복문으로 rquestionNo 하나씩 보내서 해당 choice들 조회해와서 ResearchChoice 어레이리스트에 담고 이걸 setter로 ResearchQuestion객체에 담기
		for(int i=0; i<rquestions.size(); i++) {
			List<ResearchChoice> rchoices = pd.getResearchChoiceList(sqlSession, rquestions.get(i).getRquestionNo());
			rquestions.get(i).setChoiceList(rchoices);
			rquestions.get(i).setQuestionType("general");
			researchQuestions.add(rquestions.get(i));
		}
		
		return researchQuestions;
	}

	/**
	 * @throws SelectException 
	 * @Author      : Sooo
	 * @CreateDate  : 2020. 2. 5.
	 * @ModifyDate  : 2020. 2. 5.
	 * @Description : 진행중인 설문조사 목록에서 특정 리서치 선택 시에 가져올 리서치 정보
	 */
	@Override
	public Research getResearchInfo(String researchNo) throws SelectException {
		Research researchInfo = null;
		researchInfo = pd.getResearchInfo(sqlSession, researchNo);
		return researchInfo;
	}

	@Override
	public int writeNotice(Notice n) {
		int result =pd.insert("Panel.writeNotice",n,sqlSession);
		return result;
	}

  /*
	 * @Author	:hansol
	 * @CreateDate	:2020. 2. 5.
	 * @ModifyDate	:2020. 2. 5.
	 * @Description	:1:1문의 답변 등록
	 */
	@Override
	public int answerInquiry(Inquiry i) throws InquiryException {
		int num = pd.answerInquiry(sqlSession,i);
		
		if(num <0) {
			throw new InquiryException("1:1문의 답변 실패!");
		}
		
		return num;
	}

	/**
	 * @throws InquiryException 
	 * @Author	:hansol
	 * @CreateDate	:2020. 2. 5.
	 * @ModifyDate	:2020. 2. 5.
	 * @Description	:1:1문의 답변 지우기
	 */
	@Override
	public int deleteAnswerInquiry(Inquiry i) throws InquiryException {
		int num = pd.deleteAnswerInquiry(sqlSession, i);
		
		if(num <0) {
			throw new InquiryException("1:1문의 답변 지우기");
		}
		return num;
	}
  /*
	 * @Author      : hjheo
	 * @CreateDate  : 2020. 2. 5.
	 * @ModifyDate  : 2020. 2. 5.
	 * @Description : 공지사항 수정
	 */
	
	  @Override public int editNotice(Notice n) { 
		  int result =pd.updateNotice(sqlSession,n);
	    return result; 
	  }

	/**
	 * @Author      : hjheo
	 * @CreateDate  : 2020. 2. 5.
	 * @ModifyDate  : 2020. 2. 5.
	 * @Description : 공지사항 조회
	 */
	@Override
	public Notice selectNotice(int noticeNo) {
		return pd.selectNotice(noticeNo,sqlSession);
	}

	/**
	 * @Author      : hjheo
	 * @CreateDate  : 2020. 2. 5.
	 * @ModifyDate  : 2020. 2. 5.
	 * @Description : 공지사항 딜리트
	 */
	@Override
	public int noticeDelete(int noticeNo) {
		return pd.noticeDelete(noticeNo,sqlSession);
	}

	/**
	 * @throws InquiryException 
	 * @Author	:hansol
	 * @CreateDate	:2020. 2. 6.
	 * @ModifyDate	:2020. 2. 6.
	 * @Description	:총 사용한 리워드
	 */
	@Override
	public int useRewardList(Reward r)  {
		int num = pd.useRewardList(sqlSession,r);
		return num;
	}

	/**
	 * @Author	:hansol
	 * @CreateDate	:2020. 2. 7.
	 * @ModifyDate	:2020. 2. 7.
	 * @Description	:현재 나의 리워드
	 */
	@Override
	public int nowMyReward(Reward r) {
		
		int num = pd.nowMyReward(sqlSession,r);
		
		return num;
	}

	/**
	 * @Author      : Sooo
	 * @CreateDate  : 2020. 2. 9.
	 * @ModifyDate  : 2020. 2. 9.
	 * @Description : 설문조사 시도 테이블에 인서트
	 */
	@Override
	public int insertResearchTry(AttemptInsert attempt) {
		int result = pd.insertAttemptParticipant(sqlSession, attempt);
		return result;
	}

	/**
	 * @Author      : Sooo
	 * @CreateDate  : 2020. 2. 9.
	 * @ModifyDate  : 2020. 2. 9.
	 * @Description : 설문조사 응답 내용 인서트
	 */
	@Override
	public int insertAnswer(InsertAnswer answer) {
		
		//이메일
		InetAddress inet;
		String svrIp = "";
		try {
			inet = InetAddress.getLocalHost();
			svrIp = inet.getHostAddress();
		} catch (UnknownHostException e1) {
			e1.printStackTrace();
		}
		
		PanelMember pm = pd.getPanelInfo(sqlSession, answer);
		
		//totalAnswer를 나눠서 rquestionResponse에 잘라넣어서 각 문제마다 InsertAnswer객체 생성해서 반복문으로 insert
		String[] eachResponse = answer.getTotalAnswer().split(",/,");
		
		boolean answerCheck = true;
		if(answer.getTargetCount() > 0) {
			String[] eachTargetCorrectAnswer = answer.getTargetAnswer().split(",");
			
			for(int i=0; i<answer.getTargetCount(); i++) {
				if(!(eachResponse[(i+1)]).equals(eachTargetCorrectAnswer[i])) {
					answerCheck = false;
				}
			}
		}
		
		if(!answerCheck) {
			answer.setDisposalReason("비대상자");
		}
		
		int count = (eachResponse.length) - answer.getPcCount() - answer.getTargetCount();
		int startIndex = eachResponse.length - count;
		//문제order를 다시 set하기위한 int 선언
		int rquestionOrder = 1;
		for(int i=startIndex; i<eachResponse.length - 1; i++) {
			//문제 order로 rquestionNo 가져오기
			answer.setResearchOrder(rquestionOrder);
			int rquestionNo = pd.selectRquestionNo(sqlSession, answer);
			answer.setRquestionNo(rquestionNo);
			answer.setRquestionResponse(eachResponse[i]);
			rquestionOrder++;
			
			//RESEARCHHISTORY에 인서트
			int insertResult = pd.insertAnswer(sqlSession, answer);
		}
		
		//해당회원이 방금 인서트한 히스토리중 최근 시퀀스no 조회
		int lastResearchhistoryNo = pd.selectResearchhistoryNo(sqlSession, answer);
		answer.setResearchhistoryNo(lastResearchhistoryNo);
		
		//폐기일경우 폐기테이블 insert
		if( (answer.getDisposalReason()).equals("비대상자") || (answer.getDisposalReason()).equals("시간제한") || (answer.getDisposalReason()).equals("불량응답") || (answer.getDisposalReason()).equals("시간제한,불량응답") ) {
			int result = pd.insertDisposalHistsory(sqlSession, answer);
		}else {
			int result = pd.insertNondisposalhistory(sqlSession, answer);
		}
		
		
		//불량응답한 회원 3진아웃 count 올리기
		if( (answer.getDisposalReason()).equals("불량응답") || (answer.getDisposalReason()).equals("시간제한,불량응답") ) {
			//패널 기존 3진아웃 횟수 조회
			int ternaryCount = pd.selectPanelTernaryCount(sqlSession, answer);
			
			if(ternaryCount == 2) {
				ternaryCount = 0;
				answer.setTernaryCount(ternaryCount);
				answer.setTernaryReason("블랙리스트 등록");
				//해당 회원 패널레벨 6으로 변경
				int blackResult = pd.updateBlack(sqlSession, answer);
				
				/*메일 전송 부분 시작*/
				String setfrom = "yychani94@gmail.com";         
			    String tomail  = pm.getUserEmail();     // 받는 사람 이메일
			    String title   = "Survway 응답 관련 안내입니다.";      // 제목
			    String userName = pm.getUserName();
			    String content = "<p> " + userName + "님 안녕하세요, 서브웨이입니다.<br> 회원님께서는 불량응답을 3회 기록하셨기에 1년간 설문조사에 참여하실 수 없습니다. <br> 1년 후 3개월 안에 회원정보 재인증하지 않을 시 회원탈퇴 및 회원정보가 삭제됩니다.  <br> 이 결과에 유감을  표합니다. 감사합니다. </p> <input type='hidden' name='userId' value='" + pm.getUserId() + "'>";    // 내용
			   
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
				/*메일 전송 부분 끝*/
			    
			}else {
				ternaryCount++;
				answer.setTernaryCount(ternaryCount);
				answer.setTernaryReason("불량응답 기록");
				
				/*메일 전송 부분 시작*/
				String setfrom = "yychani94@gmail.com";         
			    String tomail  = pm.getUserEmail();     // 받는 사람 이메일
			    String title   = "Survway 응답 관련 안내입니다.";      // 제목
			    String userName = pm.getUserName();
			    String content = "<p> " + userName + "님 안녕하세요, 서브웨이입니다.<br> 회원님께서는 현재까지 불량응답을 " + ternaryCount + "번 기록하셨기에 안내드립니다. <br> 설문조사 응답 시 'ㅋㅋㅋ', 'ㅏㅏ' 등의 자음 또는 모음을 입력하시거나 특수문자를 입력하시면 불량 응답으로 기록되며,<br> 불량 응답 3회 기록 시 1년간 활동이 제한되니 성의 있는 답변 부탁드립니다. <br> 감사합니다. </p> <input type='hidden' name='userId' value='" + pm.getUserId() + "'>";    // 내용
			   
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
				/*메일 전송 부분 끝*/
			}
			
			//ternaryCount 업데이트 및 ternaryout history 인서트
			int ternaryUpdate = pd.updateTernaryCount(sqlSession, answer);
			int ternaryInsert = pd.insertTernaryOutHistory(sqlSession, answer);
			
		}
		
		
		
		//먼저 비폐기테이블에서 해당 리서치에 대한 유효응답 갯수를 count
		int validAnswer = pd.countValidAnswer(sqlSession, answer);
		//해당 리서치의 목표인원 조회
		int researchEngagementGoals = pd.selectResearchEngagementGoals(sqlSession, answer);
		//목표인원이 채워지면 리서치 상태를 7로 변경
		if(validAnswer >= researchEngagementGoals) {
			int result = pd.insertRstatusHistory(sqlSession, answer);
		}
		
		return 0;
	}

  /**
	 * @throws InquiryException 
	 * @Author	:hansol
	 * @CreateDate	:2020. 2. 12.
	 * @ModifyDate	:2020. 2. 12.
	 * @Description	:참여 완료한 목록 listCount
	 */
	@Override
	public int getListCountPanelResearch(PanelResearchList rl) throws InquiryException {
		
		int result = pd.getListCountPanelResearech(sqlSession, rl );
		
		if(result <0) {
			throw new InquiryException("참여한 설문조사 listCount 조회 실패");
    }
		return result;
	}
  
  /**
	 * @throws SurveyException 
	 * @Author      : Ungken
	 * @CreateDate  : 2020. 2. 11.
	 * @ModifyDate  : 2020. 2. 11.
	 * @Description : 패널 서베이 문항 작성
	 */
	@Override
	public int uploadSurvey(PanelSurvey panelSurvey, ArrayList<UploadFile> uploadFileList) throws SurveyException {
		int result = 0;
		int result1 = pd.uploadSurvey(sqlSession, panelSurvey);
		if(result1 > 0) {
			int result2 = 0;
			for(int i = 0; i < panelSurvey.getChoiceList().size(); i++) {
				panelSurvey.getChoiceList().get(i).setSurveyNo(panelSurvey.getSurveyNo());
			}
			for(int i = 0; i < panelSurvey.getChoiceList().size(); i++) {
				result2 += pd.uploadSurveyChoice(sqlSession, panelSurvey.getChoiceList().get(i));
			}
			if(result2 == panelSurvey.getChoiceList().size()) {
				if(uploadFileList != null) {
					for(int i = 0; i < panelSurvey.getChoiceList().size(); i++) {
						uploadFileList.get(i).setSchoiceNo(panelSurvey.getChoiceList().get(i).getSchoiceNo());
					}
					int result3 = 0;
					for(int i = 0; i < uploadFileList.size(); i++) {
						result3 += pd.uploadSurveyChoiceImage(sqlSession, uploadFileList.get(i));
					}
					if(result3 == uploadFileList.size()) {
						result = 1;
					}
				}else {
					result = 1;
				}
			}
		}
		
		if(!(result > 0)) {
			throw new SurveyException("서베이 문항 작성 실패");
		}
		return result;
	} 

	/**
	 * @Author      : Ungken
	 * @CreateDate  : 2020. 2. 11.
	 * @ModifyDate  : 2020. 2. 11.
	 * @Description : 패널 서베이 문항 수
	 */
	@Override
	public int getPanelSurveyList(SearchSurvey searchSurvey) {
		return pd.getPanelSurveyList(sqlSession, searchSurvey);
	}

	/**
	 * @throws SelectException 
	 * @Author      : Ungken
	 * @CreateDate  : 2020. 2. 11.
	 * @ModifyDate  : 2020. 2. 11.
	 * @Description : 패널 서베이 문항 리스트
	 */
	@Override
	public List<Map<String, Object>> panelSurveyList(SearchSurvey searchSurvey, int offsetSize) throws SelectException {
		List<Map<String, Object>> panelSurveyList = pd.panelSurveyList(sqlSession, searchSurvey, offsetSize);
		
		if(panelSurveyList == null) {
			throw new SelectException("패널 서베이 리스트 조회 실패");
		}
		return panelSurveyList;
	}

	/**
	 * @Author      : Ungken
	 * @CreateDate  : 2020. 2. 11.
	 * @ModifyDate  : 2020. 2. 11.
	 * @Description : 좋아요 한 서베이 체크
	 */
	@Override
	public List<Integer> likeCheck(int mno) {
		return pd.likeCheck(sqlSession, mno);
	}

	/**
	 * @Author      : Ungken
	 * @CreateDate  : 2020. 2. 12.
	 * @ModifyDate  : 2020. 2. 12.
	 * @Description : 좋아요 증가 및 감소
	 */
	@Override
	public int changeLikeCount(int surveyNo, int mno, String status) {
		int result = 0;
		PanelSurvey panelSurvey = new PanelSurvey();
		panelSurvey.setMno(mno);
		panelSurvey.setSurveyNo(surveyNo);
		
		if(status.equals("minus")) { 
			result = pd.minusLikeCount(sqlSession, surveyNo);
			pd.deleteLikeHistory(sqlSession, panelSurvey);
		}else if(status.equals("plus")) {
			result = pd.plusLikeCount(sqlSession, surveyNo);
			pd.addLikeHistory(sqlSession, panelSurvey);
		}
		return result;
	}

	/**
	 * @Author      : Ungken
	 * @CreateDate  : 2020. 2. 12.
	 * @ModifyDate  : 2020. 2. 12.
	 * @Description : 통계 리스트
	 */
	@Override
	public List<Map<String, Object>> statisticList(int surveyNo) {
		return pd.statisticList(sqlSession, surveyNo);
	}

	/**
	 * @Author      : Ungken
	 * @CreateDate  : 2020. 2. 12.
	 * @ModifyDate  : 2020. 2. 12.
	 * @Description : 댓글 리스트
	 */
	@Override
	public List<Map<String, Object>> replyList(int surveyNo) {
		return pd.replyList(sqlSession, surveyNo);
	}

	/**
	 * @Author      : Ungken
	 * @CreateDate  : 2020. 2. 12.
	 * @ModifyDate  : 2020. 2. 12.
	 * @Description : 투표여부 확인
	 */
	@Override
	public boolean voteCheck(Vote vote) {
		boolean alreadyVoted = false;
		
		int result = pd.voteCheck(sqlSession, vote);
		
		if(result > 0) {
			alreadyVoted = true;
		}else {
			alreadyVoted = false;
		}
		
		return alreadyVoted;
	}

	/**
	 * @Author      : Ungken
	 * @CreateDate  : 2020. 2. 12.
	 * @ModifyDate  : 2020. 2. 12.
	 * @Description : 투표
	 */
	@Override
	public int voteSurvey(Vote vote) {
		int result = pd.voteSurvey(sqlSession, vote);
		if(result > 0) {
			pd.insertSurveyRewardHistory(sqlSession, vote);
			pd.insertPanelReward(sqlSession, vote);
		}
    return result;
	}
  /**
	 * @throws InquiryException 
	 * @Author	:im233
	 * @CreateDate	:2020. 2. 12.
	 * @ModifyDate	:2020. 2. 12.
	 * @Description	:참여완료목록 가져오기 
	 */
	@Override
	public List<PanelResearchList> selectAllPanelResearchList(PanelResearchList rl)  {
		List<PanelResearchList> list = pd.selectAllPanelResearchList(sqlSession, rl);
		return list;
	}

	/**
	 * @throws InquiryException 
	 * @Author	:hansol
	 * @CreateDate	:2020. 2. 13.
	 * @ModifyDate	:2020. 2. 13.
	 * @Description	:참여시도한 조사listCount
	 */
	@Override
	public int getListCountPanelResearchRetry(PanelResearchList rl) throws InquiryException {
		int result = pd.getListCountPanelResearchRetry(sqlSession,rl);
		
		if(result <0) {
			throw new InquiryException("참여시도한 조사 listCount조회 실패");
		}
		return result;
	}
    
	/**
	 * @Author      : Sooo
	 * @CreateDate  : 2020. 2. 11.
	 * @ModifyDate  : 2020. 2. 11.
	 * @Description : 설문조사 리워드 인서트 및 관련 디비 테이블 처리
	 */
	@Override
	public int insertSurveyReward(SurveyReward reward) {
		
		//먼저 해당 회원의 기존 리워드 가져와서 세팅하기
		int getPanelReward = pd.selectPanelReward(sqlSession, reward.getMno());
		System.out.println("기존리워드 : " + getPanelReward);
		int afterchangePoint = getPanelReward + reward.getSurveyReward();
		System.out.println("변경리워드 : " + afterchangePoint);
		reward.setAfterchangePoint(afterchangePoint);
		
		int result = 0;
		
		
		//해당 정보 넘겨서 패널리워드 테이블에 업데이트
		int result1 = pd.updateSurveyReard(sqlSession, reward);
		//리워드히스토리에 관련 정보 인서트
		int result2 = pd.insertRewardHistory(sqlSession, reward);
		
		if(result1>0 && result2>0) {
			result = 1;
		}
		return result;
	}

	/**
	 * @Author      : Ungken
	 * @CreateDate  : 2020. 2. 13.
	 * @ModifyDate  : 2020. 2. 13.
	 * @Description : 댓글 달기
	 */
	@Override 
	public int replyUpload(SurveyReply surveyReply) {
		return pd.replyUpload(sqlSession, surveyReply);
	}

	/**
	 * @Author      : Ungken
	 * @CreateDate  : 2020. 2. 13.
	 * @ModifyDate  : 2020. 2. 13.
	 * @Description : 대댓글 달기
	 */
	@Override 
	public int rereplyUpload(SurveyReply surveyReply) {
		return pd.rereplyUpload(sqlSession, surveyReply);
   }
  
	/**
	 * @Author	:hansol
	 * @CreateDate	:2020. 2. 13.
	 * @ModifyDate	:2020. 2. 13.
	 * @Description	:참여시도한 조사 가져오기
	 */
	@Override
	public List<PanelResearchList> selectAllPanelResearchRetryList(PanelResearchList rl) {
		List<PanelResearchList> list = pd.selectAllPanelResearchRetryList(sqlSession, rl);
		return list;
	}

	/**
	 * @Author      : Sooo
	 * @CreateDate  : 2020. 2. 13.
	 * @ModifyDate  : 2020. 2. 13.
	 * @Description : 폐기테이블 또는 비폐기테이블에 데이터 쌓기
	 */
	@Override
	public int disposalAnswer(InsertAnswer answer) {
		// TODO Auto-generated method stub
		return 0;
	}
}
