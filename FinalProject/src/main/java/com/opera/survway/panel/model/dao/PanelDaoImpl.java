package com.opera.survway.panel.model.dao;

import com.opera.survway.common.model.vo.PageInfo;
import com.opera.survway.common.model.vo.UploadFile;
import com.opera.survway.exception.LoginException;
import com.opera.survway.exception.SelectException;
import com.opera.survway.panel.model.vo.*;
import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;


@Repository
public class PanelDaoImpl implements PanelDao{

	@Override
	public PanelMember loginCheck(SqlSessionTemplate sqlSession, PanelMember pm) throws LoginException {
		
		PanelMember loginUser = sqlSession.selectOne("Panel.loginCheck", pm);
		
		if(loginUser==null) {
			throw new LoginException("로그인 정보가 일치하지 않습니다");
		}
		
		return loginUser;
	}
	
	@Override
	public String selectEncPassword(SqlSessionTemplate sqlSession, PanelMember pm) {
		return sqlSession.selectOne("Panel.selectPwd", pm.getUserId());
	}
	
	@Override
	public String selectEncPassword(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.selectOne("Panel.selectPwd", userId);
	}

	@Override
	public int insertMemberTable(SqlSessionTemplate sqlSession, PanelMember pm) {
		return sqlSession.insert("Panel.insertMemberTable", pm);
	}

	@Override
	public int insertPanelTable(SqlSessionTemplate sqlSession, PanelMember pm) {
		return sqlSession.insert("Panel.insertPanelTable", pm);
	}

	@Override
	public int selectMno(SqlSessionTemplate sqlSession, PanelMember pm) {
		return sqlSession.selectOne("Panel.selectMno", pm);
	}

	@Override
	public int insertInquiry(SqlSessionTemplate sqlSession, Inquiry i) {
		
		return sqlSession.insert("Panel.insertInquiry", i);
	}

	@Override
	public List<Inquiry> selectAllMyInquiry(SqlSessionTemplate sqlSession, Inquiry i) {
		List<Inquiry> list = null;
		
		int offset = (i.getPi().getCurrentPage() -1)* i.getPi().getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, i.getPi().getLimit());
		
		if(i.getMno() != 1) {
			list = sqlSession.selectList("Panel.selectAllMyInquiry", i,rowBounds);
		}else if(i.getMno() ==1) {
			list = sqlSession.selectList("Panel.adminSelectAllMyInquiry",i,rowBounds);
		}
			
		return list;
	}

	@Override
	public int getListCountInquiry(SqlSessionTemplate sqlSession, Inquiry iq) {
		int listCount =0;
		if(iq.getMno() != 1) {
			listCount = sqlSession.selectOne("Panel.getListCountInquiry",iq);
		}else if(iq.getMno() == 1) {
			listCount = sqlSession.selectOne("Panel.adminGetListCountInquiry", iq);
		}
		
		return listCount;
	}

	@Override
	public int insertTermsPanel(SqlSessionTemplate sqlSession, PanelMember pm) {
		ArrayList<Integer> indexArr = new ArrayList<Integer>();
		for(int i = 1; i <= 5; i++) {
			indexArr.add(i);
		}
		pm.setIndexArr(indexArr);
		return sqlSession.insert("Panel.insertTermsPanel", pm);
	}
	
	@Override
	public int updateMemberInfo(SqlSessionTemplate sqlSession, PanelMember pm) {
		return sqlSession.update("Panel.updateMemberInfo", pm);
	}

	@Override
	public int updatePassword(SqlSessionTemplate sqlSession, PanelMember pm) {
		return sqlSession.update("Panel.updatePassword", pm);
	}

  @Override
	public int insertRewardPanel(SqlSessionTemplate sqlSession, PanelMember pm) {
		return sqlSession.insert("Panel.insertRewardPanel", pm);
	}

	@Override
	public int insertTernaryPanel(SqlSessionTemplate sqlSession, PanelMember pm) {
		return sqlSession.insert("Panel.insertTernaryPanel", pm);
	}

	@Override
	public int getListCountRewardSaved(SqlSessionTemplate sqlSession, Reward rd) {
		return sqlSession.selectOne("Panel.getListCountRewardSaved",rd);
	}

	@Override
	public List<Reward> showMyRewardDetailSaved(SqlSessionTemplate sqlSession, Reward rd) {
		
		List<Reward> list = null;
		
		int offset = (rd.getPi().getCurrentPage() -1)* rd.getPi().getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, rd.getPi().getLimit());
		
		list = sqlSession.selectList("Panel.showMyRewardDetailSaved", rd,rowBounds);
		
		return list;
		
	}

	@Override
	public List<Reward> showMyRewardDetailUsed(SqlSessionTemplate sqlSession, Reward r) {
		List<Reward> list = null;
		
		int offset = (r.getPi().getCurrentPage() -1)* r.getPi().getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, r.getPi().getLimit());
		
		list = sqlSession.selectList("Panel.showMyRewardDetailUsed", r,rowBounds);
		
		return list;
	}

	@Override
	public int getListCountRewardUsed(SqlSessionTemplate sqlSession, Reward r) {
		
		return sqlSession.selectOne("Panel.getListCountRewardUsed",r);
	}

	@Override
	public int updateLeaveMember(SqlSessionTemplate sqlSession, PanelMember pm) {
		return sqlSession.update("Panel.updateLeaveMember", pm);
	}

	@Override
	public int getNoticeListCount(SqlSessionTemplate sqlSession, SearchNotice searchNotice) {
		return sqlSession.selectOne("Panel.getNoticeListCount",searchNotice);
	}

	@Override
	public List<Notice> selectNoticeList(SqlSessionTemplate sqlSession, SearchNotice searchNotice) {
		int offset = (searchNotice.getPi().getCurrentPage() -1)* searchNotice.getPi().getLimit();
		RowBounds rowBounds = new RowBounds(offset,searchNotice.getPi().getLimit());
    
		return sqlSession.selectList("Panel.selectNoticeList", searchNotice, rowBounds);
  }
  
	@Override
	public List<Notice> selectMainNoticeList(SqlSessionTemplate sqlSession) throws SelectException {
		RowBounds rowBounds = new RowBounds(0, 5);
		List<Notice> noticeList = sqlSession.selectList("Panel.selectMainNoticeList", null, rowBounds);
		if(noticeList == null) {
			throw new SelectException("메인페이지 공지사항 불러오기 실패");
		}
		return noticeList;
	}

	@Override
	public List<Research> selectMainResearchList(SqlSessionTemplate sqlSession, PanelMember loginUser) throws SelectException {
		List<Research> researchList = null;
		RowBounds rowBounds = new RowBounds(0, 4);
		researchList = sqlSession.selectList("Panel.selectMainResearchList", null, rowBounds);
		
		if(researchList == null) {
			throw new SelectException("메인페이지에서 리서치 불러오기 실패");
		}
		return researchList;
	}

	
	@Override
	public Reward getPanelReward(SqlSessionTemplate sqlSession, int mno) {
		
		return sqlSession.selectOne("Panel.getPanelReward",mno);
	}

	@Override
	public int insertCashOutHistory(SqlSessionTemplate sqlSession, Reward r) {
		
		return sqlSession.insert("Panel.insertCashOutHistory", r);
	}

	@Override
	public int insertRewardHistory(SqlSessionTemplate sqlSession, Reward r) {
		
		return sqlSession.insert("Panel.insertRewardHistory",r);
	}

	@Override
	public int updatePanelReward(SqlSessionTemplate sqlSession, Reward r) {
		
		return sqlSession.update("Panel.updatePanelReard",r);
	}
	@Override
	public List<ResearchQuestion> getTsQuestionList(SqlSessionTemplate sqlSession) throws SelectException {
		List<ResearchQuestion> tsQuestions = null;
		tsQuestions = sqlSession.selectList("Panel.selectTsQuestionList");
		if(tsQuestions == null) {
			throw new SelectException("TS조사 문항 리스트 불러오기 실패");
		}
		return tsQuestions;
	}

	@Override
	public List<ResearchChoice> getTsChoiceList(SqlSessionTemplate sqlSession, int rquestionNo) throws SelectException {
		List<ResearchChoice> tsChoices = null;
		tsChoices = sqlSession.selectList("Panel.selectTsChoiceList", rquestionNo);
		if(tsChoices == null) {
			throw new SelectException("TS조사 문항별 보기 리스트 불러오기 실패");
		}
		return tsChoices;
	}

	@Override
	public int insertFaq(SqlSessionTemplate sqlSession, Faq faq) {
		
		return sqlSession.insert("Panel.insertFaq", faq);
	}

	@Override
	public int getListCountFaq(SqlSessionTemplate sqlSession, Faq f) {
		
		return sqlSession.selectOne("Panel.getListCountFaq",f);
	}

	@Override
	public List<Faq> selectAllFaq(SqlSessionTemplate sqlSession, Faq f) {
		
		return sqlSession.selectList("Panel.selectAllFaq",f);
	}

	@Override
	public int deleteFaq(SqlSessionTemplate sqlSession, Faq f) {
		
		return sqlSession.update("Panel.deleteFaq",f);
	}

	@Override
	public int updateFaq(SqlSessionTemplate sqlSession, Faq f) {
		
		return sqlSession.update("Panel.updateFaq",f);
	}

	@Override
	public int answerInquiry(SqlSessionTemplate sqlSession, Inquiry i) {
		
		return sqlSession.update("Panel.answerInquiry",i);
	}

	@Override
	public int deleteAnswerInquiry(SqlSessionTemplate sqlSession, Inquiry i) {
		
		return sqlSession.update("Panel.deleteAnswerInquiry",i);
	}

	public int getCountMyResearch(SqlSessionTemplate sqlSession, PanelMember loginUser) {
		return sqlSession.selectOne("Panel.selectCountMyResearch", loginUser);
	}

	@Override
	public List<Research> getMyResearchList(SqlSessionTemplate sqlSession, PanelMember loginUser, PageInfo pi) {
		List<Research> myResearchList = null;
		int offset = (pi.getCurrentPage()-1)*pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		myResearchList = sqlSession.selectList("Panel.selectMyResearchList", loginUser, rowBounds);
		return myResearchList;
	}

	@Override
	public List<ResearchQuestion> getResearchQuestionList(SqlSessionTemplate sqlSession, String researchNo) throws SelectException {
		List<ResearchQuestion> researchQuestions = null;
		researchQuestions = sqlSession.selectList("Panel.selectResearchQuestionList", researchNo);
		if(researchQuestions == null) {
			throw new SelectException("설문조사 문항 리스트 불러오기 실패");
		}
		return researchQuestions;
	}

	@Override
	public List<ResearchChoice> getResearchChoiceList(SqlSessionTemplate sqlSession, int rquestionNo) throws SelectException {
		List<ResearchChoice> researchChoices = null;
		researchChoices = sqlSession.selectList("Panel.selectResearchChoiceList", rquestionNo);
		if(researchChoices == null) {
			throw new SelectException("TS조사 문항별 보기 리스트 불러오기 실패");
		}
		return researchChoices;
	}

	@Override
	public Research getResearchInfo(SqlSessionTemplate sqlSession, String researchNo) throws SelectException {
		Research researchInfo = null;
		researchInfo = sqlSession.selectOne("Panel.selectResearchInfo", researchNo);
		if(researchInfo == null) {
			throw new SelectException("선택된 설문조사 정보 불러오기 실패");
		}
		return researchInfo;
  }
  
	public int insert(String string, Notice n, SqlSessionTemplate session) {
		return session.insert("Panel.writeNotice",n);
	}

	@Override
	public Notice selectNotice(int noticeNo, SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("Panel.selectNotice",noticeNo);
	}

	@Override
	public int updateNotice(SqlSessionTemplate sqlSession, Notice n) {
		return sqlSession.update("Panel.updateNotice",n);
	}

	@Override
	public int noticeDelete(int noticeNo, SqlSessionTemplate sqlSession) {
		return sqlSession.update("Panel.noticeDelete",noticeNo);
	}

	@Override
	public int useRewardList(SqlSessionTemplate sqlSession, Reward r) {
		int survey = sqlSession.selectOne("Panel.surveyOutReward",r);
		int cashout = sqlSession.selectOne("Panel.cashOutReward",r);
		int num = survey+cashout;
		return num;
	}

	@Override
	public int nowMyReward(SqlSessionTemplate sqlSession, Reward r) {
		
		return sqlSession.selectOne("Panel.nowMyReward",r);
	}

	@Override
	public int insertAttemptParticipant(SqlSessionTemplate sqlSession, AttemptInsert attempt) {
		return sqlSession.insert("Panel.insertAttemptParticipant", attempt);
	}

	@Override
	public int updateNomineeReward(SqlSessionTemplate sqlSession, String nominee) {
		return sqlSession.update("Panel.updateNomineeReward", nominee);
	}

	@Override
	public int updateUserReward(SqlSessionTemplate sqlSession, PanelMember pm) {
		return sqlSession.update("Panel.updateUserReward", pm);
	}

	@Override
	public int insertRewardNomineeHistory(SqlSessionTemplate sqlSession, String nominee) {
		return sqlSession.update("Panel.insertRewardNomineeHistory", nominee);
	}

	@Override
	public int insertRewardUserHistory(SqlSessionTemplate sqlSession, PanelMember pm) {
		return sqlSession.update("Panel.insertRewardUserHistory", pm);
	}

  @Override
	public int getListCountPanelResearech(SqlSessionTemplate sqlSession, PanelResearchList rl) {
		
		return sqlSession.selectOne("Panel.getListCountPanelResearch",rl);
	}

	@Override
	public List<PanelResearchList> selectAllPanelResearchList(SqlSessionTemplate sqlSession, PanelResearchList rl) {
		List<PanelResearchList> list = null;
		int offset = (rl.getPi().getCurrentPage()-1)*rl.getPi().getLimit();
		RowBounds rowBounds = new RowBounds(offset, rl.getPi().getLimit());
		list = sqlSession.selectList("Panel.selectAllPanelResearchList",rl,rowBounds);
		return list;
	}

	@Override
	public int getListCountPanelResearchRetry(SqlSessionTemplate sqlSession, PanelResearchList rl) {
		return sqlSession.selectOne("Panel.getListCountPanelResearchRetry",rl);
	}

	@Override
	public List<PanelResearchList> selectAllPanelResearchRetryList(SqlSessionTemplate sqlSession, PanelResearchList rl) {
		List<PanelResearchList> list = null;
		int offset = (rl.getPi().getCurrentPage()-1)*rl.getPi().getLimit();
		RowBounds rowBounds = new RowBounds(offset, rl.getPi().getLimit());
		list = sqlSession.selectList("Panel.selectAllPanelResearchRetryList",rl,rowBounds);
		return list;
	}

	@Override
	public int selectPanelReward(SqlSessionTemplate sqlSession, int mno) {
		return sqlSession.selectOne("Panel.getCurrentPanelReward", mno);
	}

	@Override
	public int updateSurveyReard(SqlSessionTemplate sqlSession, SurveyReward reward) {
		return sqlSession.update("Panel.updatePanelReward", reward);
	}

	@Override
	public int insertRewardHistory(SqlSessionTemplate sqlSession, SurveyReward reward) {
		return sqlSession.insert("Panel.insertSurveyRewardHistory", reward);
	}

	@Override
	public ResearchQuestion getPcQuestion(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("Panel.selectPcQuestion");
	}

	@Override
	public List<ResearchChoice> getPcChoices(SqlSessionTemplate sqlSession, int rquestionNo) {
		return sqlSession.selectList("Panel.selectPcChoices", rquestionNo);
	}
	
	@Override
	public List<ResearchQuestion> getTargetQuestions(SqlSessionTemplate sqlSession, String researchNo) {
		return sqlSession.selectList("Panel.selectTargetQuestions", researchNo);
	}

	@Override
	public List<ResearchChoice> getTargetChoiceList(SqlSessionTemplate sqlSession, int rquestionNo) {
		return sqlSession.selectList("Panel.selectTargetChoices", rquestionNo);
	}

	@Override
	public int selectRquestionNo(SqlSessionTemplate sqlSession, InsertAnswer answer) {
		return sqlSession.selectOne("Panel.selectRquestionNo", answer);
	}

	@Override
	public int insertAnswer(SqlSessionTemplate sqlSession, InsertAnswer answer) {
		return sqlSession.insert("Panel.insertAnswer", answer);
	}

	@Override
	public int selectResearchhistoryNo(SqlSessionTemplate sqlSession, InsertAnswer answer) {
		return sqlSession.selectOne("Panel.selectResearchhistoryNo", answer);
	}

	@Override
	public int insertDisposalHistsory(SqlSessionTemplate sqlSession, InsertAnswer answer) {
		return sqlSession.insert("Panel.insertDisposalHistory", answer);
	}

	@Override
	public int insertNondisposalhistory(SqlSessionTemplate sqlSession, InsertAnswer answer) {
		return sqlSession.insert("Panel.insertNondisposalHistory", answer);
	}

	@Override
	public int countValidAnswer(SqlSessionTemplate sqlSession, InsertAnswer answer) {
		return sqlSession.selectOne("Panel.selectCountValidAnswer", answer);
	}

	@Override
	public int selectResearchEngagementGoals(SqlSessionTemplate sqlSession, InsertAnswer answer) {
		return sqlSession.selectOne("Panel.selectResearchEngagementGoals", answer);
	}

	@Override
	public int insertRstatusHistory(SqlSessionTemplate sqlSession, InsertAnswer answer) {
		return sqlSession.insert("Panel.insertRstatusHistorySeven", answer);
	}

	@Override
	public int selectPanelTernaryCount(SqlSessionTemplate sqlSession, InsertAnswer answer) {
		return sqlSession.selectOne("Panel.selectTernaryCount", answer);
	}

	@Override
	public int updateTernaryCount(SqlSessionTemplate sqlSession, InsertAnswer answer) {
		return sqlSession.update("Panel.updateTernaryCount", answer);
	}

	@Override
	public int insertTernaryOutHistory(SqlSessionTemplate sqlSession, InsertAnswer answer) {
		return sqlSession.insert("Panel.insertTernaryOutHistory", answer);
	}

	@Override
	public int updateBlack(SqlSessionTemplate sqlSession, InsertAnswer answer) {
		return sqlSession.update("Panel.updatePanellevelNoBlack", answer);
	}
	
	@Override
	public int rereplyUpload(SqlSessionTemplate sqlSession, SurveyReply surveyReply) {
		return sqlSession.insert("Panel.rereplyUpload", surveyReply);
	}

	@Override
	public int insertPanelReward(SqlSessionTemplate sqlSession, Vote vote) {
		return sqlSession.update("Panel.insertPanelReward", vote); 
	}

	@Override
	public int insertSurveyRewardHistory(SqlSessionTemplate sqlSession, Vote vote) {
		return sqlSession.insert("Panel.insertPanelSurveyRewardHistory", vote);
	}
  @Override
	public int uploadSurvey(SqlSessionTemplate sqlSession, PanelSurvey panelSurvey) {
		return sqlSession.insert("Panel.uploadSurvey", panelSurvey);
	}

	@Override
	public int uploadSurveyChoice(SqlSessionTemplate sqlSession, PanelSurveyChoice panelSurveyChoice) {
		return sqlSession.insert("Panel.uploadSurveyChoice", panelSurveyChoice);
	}

	@Override
	public int uploadSurveyChoiceImage(SqlSessionTemplate sqlSession, UploadFile uploadFile) {
		return sqlSession.insert("Panel.uploadSurveyChoiceImage", uploadFile);
	}

	@Override
	public int getPanelSurveyList(SqlSessionTemplate sqlSession, SearchSurvey searchSurvey) {
		return sqlSession.selectOne("Panel.getPanelSurveyList", searchSurvey);
	}

	@Override
	public List<Map<String, Object>> panelSurveyList(SqlSessionTemplate sqlSession, SearchSurvey searchSurvey, int offsetSize) {
		
		int offset = (searchSurvey.getPi().getCurrentPage() - 1) * searchSurvey.getPi().getLimit();
		
		if(offsetSize != 0) {
			offset = offsetSize + 1;
		}
		
		RowBounds rowBounds = new RowBounds(offset, searchSurvey.getPi().getLimit());
		return sqlSession.selectList("Panel.panelSurveyList", searchSurvey, rowBounds);
	}

	@Override
	public List<Integer> likeCheck(SqlSessionTemplate sqlSession, int mno) {
		return sqlSession.selectList("Panel.likeCheck", mno);
	}

	@Override
	public int minusLikeCount(SqlSessionTemplate sqlSession, int surveyNo) {
		return sqlSession.insert("Panel.minusLikeCount", surveyNo);
	}

	@Override
	public int plusLikeCount(SqlSessionTemplate sqlSession, int surveyNo) {
		return sqlSession.insert("Panel.plusLikeCount", surveyNo);
	}

	@Override
	public int deleteLikeHistory(SqlSessionTemplate sqlSession, PanelSurvey panelSurvey) {
		return sqlSession.delete("Panel.deleteLikeHistory", panelSurvey);
	}

	@Override
	public int addLikeHistory(SqlSessionTemplate sqlSession, PanelSurvey panelSurvey) {
		return sqlSession.delete("Panel.addLikeHistory", panelSurvey);
	}

	@Override
	public List<Map<String, Object>> statisticList(SqlSessionTemplate sqlSession, int surveyNo) {
		return sqlSession.selectList("Panel.statisticList", surveyNo);
	}

	@Override
	public List<Map<String, Object>> replyList(SqlSessionTemplate sqlSession, int surveyNo) {
		return sqlSession.selectList("Panel.replyList", surveyNo);
	}

	@Override
	public int voteCheck(SqlSessionTemplate sqlSession, Vote vote) {
		return sqlSession.selectOne("Panel.voteCheck", vote);
	}

	@Override
	public int voteSurvey(SqlSessionTemplate sqlSession, Vote vote) {
		return sqlSession.insert("Panel.voteSurvey", vote);
	}

	@Override
	public int replyUpload(SqlSessionTemplate sqlSession, SurveyReply surveyReply) {
		return sqlSession.insert("Panel.replyUpload", surveyReply);
  }

	@Override
	public PanelMember getPanelInfo(SqlSessionTemplate sqlSession, InsertAnswer answer) {
		return sqlSession.selectOne("Panel.selectPanelInfo", answer);
	}
}
