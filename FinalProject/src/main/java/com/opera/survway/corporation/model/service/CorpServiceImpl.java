package com.opera.survway.corporation.model.service;

import com.opera.survway.admin.model.exception.ResearchException;
import com.opera.survway.common.model.vo.ResearchState;
import com.opera.survway.common.model.vo.UploadFile;
import com.opera.survway.corporation.model.dao.CorpDao;
import com.opera.survway.corporation.model.vo.*;
import com.opera.survway.exception.LoginException;
import com.opera.survway.exception.SelectException;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class CorpServiceImpl implements CorpService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private CorpDao cd;
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	@Autowired
	private DataSourceTransactionManager transactionmanager;
	
	/**
	 * @Author      : Ungken
	 * @CreateDate  : 2020. 1. 23.
	 * @ModifyDate  : 2020. 1. 23.
	 * @Description : 기업 로그인
	 */
	@Override
	public CorpMember loginMember(CorpMember cm) throws LoginException {
		
		CorpMember loginUser = null;
		String encPassword = cd.selectEncPassword(sqlSession, cm);
		
		if(passwordEncoder.matches(cm.getUserPwd(), encPassword)) {
			loginUser = cd.loginCheck(sqlSession, cm);
		}else {
			throw new LoginException("기업 로그인 실패");
		}
		
		return loginUser;
	}
	
	/**
	 * @Author      : Ungken
	 * @CreateDate  : 2020. 1. 23.
	 * @ModifyDate  : 2020. 1. 23.
	 * @Description : 기업 회원가입
	 */
	@Override
	public int insertCorp(CorpMember cm, UploadFile uploadfile) throws LoginException {

		int resultMemberTable = cd.insertMemberTable(sqlSession, cm);
		int resultCorpTable = 0;
		int resultCorpImage = 0;
		if(resultMemberTable > 0) {
			resultCorpTable = cd.insertCorpTable(sqlSession, cm);
			if(resultCorpTable > 0) {
				uploadfile.setMno(cm.getMno());
				resultCorpImage = cd.insertCorpImage(sqlSession, uploadfile);
			}
		}
		
		if(!(resultMemberTable > 0 && resultCorpTable > 0 && resultCorpImage > 0)) {
			throw new LoginException("회원가입 실패!");
		}else {
			return 0;
		}
		
	}
	
	/**
	 * @throws ResearchException 
	 * @Author      : Ungken
	 * @CreateDate  : 2020. 1. 29.
	 * @ModifyDate  : 2020. 1. 29.
	 * @Description : 기업 리서치 정보 문항 작성
	 */
	@Override
	public void insertResearch(Research research, ArrayList<ResearchQuestion> questionList,
			ArrayList<UploadFile> uploadFiles) throws ResearchException {
		int result = 0;
		int result1 = cd.insertResearch(sqlSession, research);
		if(result1 > 0 ) {
			int result2 = cd.insertTarger(sqlSession, research);
			for(int i = 0; i < questionList.size(); i++) {
				questionList.get(i).setResearchNo(research.getResearchNo());
			}
			int result3 = 0;
			for(int i = 0; i < questionList.size(); i++) {
				result3 += cd.insertQuestion(sqlSession, questionList.get(i));
			}
			if(result3 == questionList.size()) {
				for(int i = 0; i < questionList.size(); i++) {
					for(int j = 0; j < questionList.get(i).getRequestChoiceList().size(); j++) {
						questionList.get(i).getRequestChoiceList().get(j).setRquestionNo(questionList.get(i).getQuestionNo());
					}
				}
				ArrayList<ResearchChoice> choiceList = new ArrayList<>();
				for(int i = 0; i < questionList.size(); i++) {
					for(int j = 0; j < questionList.get(i).getRequestChoiceList().size(); j++) {
						choiceList.add(questionList.get(i).getRequestChoiceList().get(j));
					}
				}
				int result4 = 0;
				for(int i = 0; i < choiceList.size(); i++) {
					result4 += cd.insertChoice(sqlSession, choiceList.get(i));
				}
				if(result4 == choiceList.size()) {
					for(int i = 0; i < uploadFiles.size(); i++) {
						for(int j = 0; j < questionList.size(); j++) {
							if(uploadFiles.get(i).getRquestionNo() == questionList.get(j).getQuestionOrder()) {
								uploadFiles.get(i).setRquestionNo(questionList.get(j).getQuestionNo());
							}
						}
						for(int k = 0; k < questionList.size(); k++) {
							for(int j = 0; j < questionList.get(k).getRequestChoiceList().size(); j++) {
								if(questionList.get(k).getQuestionFormNo() == 3) {
									if(uploadFiles.get(i).getRchoiceNo() == questionList.get(k).getRequestChoiceList().get(j).getChoiceOrder()) {
										uploadFiles.get(i).setRchoiceNo(questionList.get(k).getRequestChoiceList().get(j).getChoiceNo());
									}
								}
							}
						}
					}
					int result5 = 0;
					for(int i = 0; i < uploadFiles.size(); i++) {
						result5 += cd.insertImage(sqlSession, uploadFiles.get(i));
					}
					if(result5 == uploadFiles.size()) {
						int result6 = cd.insertResearchState(sqlSession, research);
						if(result6 > 0) {
							result = 1;
						}
					}
				}
			}
		}
		
		if(!(result > 0)){
			throw new ResearchException("리서치 작성 오류");
		}
	}

	/**
	 * @Author      : Ungken
	 * @CreateDate  : 2020. 1. 31.
	 * @ModifyDate  : 2020. 1. 31.
	 * @Description : 리서치 이력 조회 
	 */
	@Override
	public List<Research> previousResearch(SearchResearch searchResearch) throws SelectException {
		List<Research> researchList = cd.previousResearch(sqlSession, searchResearch);
		
		if(researchList == null) {
			throw new SelectException("리서치 이력 조회 실패");
		}
		return researchList;
	}

	/**
	 * @Author      : Ungken
	 * @CreateDate  : 2020. 1. 31.
	 * @ModifyDate  : 2020. 1. 31.
	 * @Description : 리서치 이력 수 조회
	 */
	@Override
	public int getListCountResearch(SearchResearch searchResearch) throws SelectException {
		int listCount = cd.getListCountResearch(sqlSession, searchResearch);
		
		if(listCount < 0) {
			throw new SelectException("리서치 이력 수 조회 실패");
		}
		return listCount;
	}

	/**
	 * @Author      : Ungken
	 * @CreateDate  : 2020. 1. 31.
	 * @ModifyDate  : 2020. 1. 31.
	 * @Description : 리서치 상세 조회 
	 */
	@Override
	public Research previousResearchDetail(int researchNo) throws SelectException {

		Research research = cd.previousResearchDetail(sqlSession, researchNo);
		
		if(research == null) {
			throw new SelectException("리서치 상세 조회 실패");
		}
		return research;
	}

	/**
	 * @Author      : Ungken
	 * @CreateDate  : 2020. 1. 31.
	 * @ModifyDate  : 2020. 1. 31.
	 * @Description : 리서치 문항 수 조회(리서치 상세)
	 */
	@Override
	public int getQuestionCount(int researchNo) {
		return cd.getQuestionCount(sqlSession, researchNo);
	}

	/**
	 * @Author      : Ungken
	 * @CreateDate  : 2020. 2. 2.
	 * @ModifyDate  : 2020. 2. 2.
	 * @Description : 리서치 가격 협상
	 */
	@Override
	public boolean priceConference(ResearchState researchstate) {
		boolean isConference = false;
		
		int result1 = cd.insertConferenceState(sqlSession, researchstate);
		
		int result2 = cd.insertConferenceHistory(sqlSession, researchstate);
		
		if(result1 > 0 && result2 > 0) {
			isConference = true;
		}
		return isConference;
	}

	/**
	 * @Author      : Ungken
	 * @CreateDate  : 2020. 2. 2.
	 * @ModifyDate  : 2020. 2. 2.
	 * @Description : 리서치 결제
	 */
	@Override
	public boolean researchPayment(Payment payment) {
		boolean isPayment = false;
		
		int result1 = cd.insertPayment(sqlSession, payment);
		
		int result2 = cd.insertPaymentState(sqlSession, payment);
		
		if(result1 > 0 && result2 > 0) {
			isPayment = true;
		}
		return isPayment;
	}

	@Override
	public boolean recontructionConference(ResearchState researchState) {
		boolean isConference = false;
		
		int result1 = cd.insertRecontructionConferenceState(sqlSession, researchState);
		
		int result2 = cd.insertRecontructionConferenceHistory(sqlSession, researchState);
		
		if(result1 > 0 && result2 > 0) {
			isConference = true;
		}
		return isConference;
	}

	@Override
	public boolean recontructionApproved(int researchNo) {
		boolean isApproved = false;
		
		int result = cd.recontructionApproved(sqlSession, researchNo);
		
		if(result > 0) {
			isApproved = true;
		}
		return isApproved;
	}

}

