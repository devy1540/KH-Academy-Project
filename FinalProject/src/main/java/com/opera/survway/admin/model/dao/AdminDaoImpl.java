package com.opera.survway.admin.model.dao;

import com.opera.survway.admin.model.exception.ResearchException;
import com.opera.survway.admin.model.vo.*;
import com.opera.survway.common.model.vo.AllMember;
import com.opera.survway.common.model.vo.PageInfo;
import com.opera.survway.common.model.vo.ResearchState;
import com.opera.survway.common.model.vo.UploadFile;
import com.opera.survway.corporation.model.vo.Research;
import com.opera.survway.corporation.model.vo.ResearchChoice;
import com.opera.survway.corporation.model.vo.ResearchQuestion;
import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class AdminDaoImpl implements AdminDao{

	@Override
	public int getListCountPanel(SqlSessionTemplate sqlSession, SearchMember searchMember) {
		int listCount = 0;
		
		listCount = sqlSession.selectOne("Admin.getListCountPanel", searchMember);
		
		return listCount; 
	}
	
	@Override
	public List<AllMember> memberInfoManagement(SqlSessionTemplate sqlSession, SearchMember searchMember) {
		List<AllMember> memberList = null;
		
		int offset = (searchMember.getPi().getCurrentPage() - 1) * searchMember.getPi().getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, searchMember.getPi().getLimit());
		
		memberList = sqlSession.selectList("Admin.memberInfoManagement", searchMember, rowBounds);
		
		return memberList;
	}

	@Override
	public AllMember selectMember(SqlSessionTemplate sqlSession, int mno) {
		return sqlSession.selectOne("Admin.selectMember", mno);
	}

	@Override
	public int getListCountPanelCashoutApplicant(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("Admin.getListCountPanelCashoutApplicant");
	}

	@Override
	public List<PanelRewardHistory> panelCashoutApplication(SqlSessionTemplate sqlSession, PageInfo pi) {
		List<PanelRewardHistory> panelRewardHistoryList = null;
		
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		panelRewardHistoryList = sqlSession.selectList("Admin.panelCashoutApplication", null, rowBounds);
		
		return panelRewardHistoryList;
	}

	@Override
	public int cashoutPeople(SqlSessionTemplate sqlSession, List<String> list) {
		return sqlSession.update("Admin.cashoutPerson", list);
	}

	@Override
	public int getListCountManageCashoutComplete(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("Admin.getListCountManageCashoutComplete");
	}

	@Override
	public List<PanelRewardHistory> manageCashoutComplete(SqlSessionTemplate sqlSession, PageInfo pi) {
		List<PanelRewardHistory> rewardCompleteHistoryList = null;
		
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		rewardCompleteHistoryList = sqlSession.selectList("Admin.rewardCompleteHistoryList", null, rowBounds);
		
		return rewardCompleteHistoryList;
	}

	@Override
	public int getListCountNewPanel(SqlSessionTemplate sqlSession, SearchMember searchMember) {
		int listCount = 0;
		listCount = sqlSession.selectOne("Admin.getListCountNewPanel", searchMember);
		return listCount;
	}

	@Override
	public List<AllMember> getListNewPanel(SqlSessionTemplate sqlSession, SearchMember searchMember) {
		
		List<AllMember> memberList = null;

		int offset = (searchMember.getPi().getCurrentPage() - 1) * searchMember.getPi().getLimit();

		RowBounds rowBounds = new RowBounds(offset, searchMember.getPi().getLimit());

		memberList = sqlSession.selectList("Admin.selectNewPanelList", searchMember, rowBounds);

		return memberList;
	}

	@Override
	public AllMember getNewPanelDetail(SqlSessionTemplate sqlSession, int mno) {
		return sqlSession.selectOne("Admin.selectOneNewPanel", mno);
	}

	@Override
	public int getListCountArrovalList(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("Admin.getListCountArrovalList");
	}

	@Override
	public List<Map<String, String>> researchApprovalWaitList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();

		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		return sqlSession.selectList("Admin.researchApprovalWaitList", null, rowBounds);
	}

	@Override
	public List<Map<String, Object>> researchApprovalDetail(SqlSessionTemplate sqlSession, int researchNo) {
		return sqlSession.selectList("Admin.researchApprovalDetail", researchNo);
	}

	@Override
	public UploadFile questionImage(SqlSessionTemplate sqlSession, int questionNo) {
		return sqlSession.selectOne("Admin.questionUploadFiles", questionNo);
	}

	@Override
	public UploadFile choiceImage(SqlSessionTemplate sqlSession, int choiceNo) {
		return sqlSession.selectOne("Admin.choiceUploadFiles", choiceNo);
	}

	@Override
	public int researchApproved(SqlSessionTemplate sqlSession, ResearchState researchState) {
		return sqlSession.insert("Admin.researchApproved",  researchState);
	}

	@Override
	public int researchRefer(SqlSessionTemplate sqlSession, ResearchState researchState) {
		return sqlSession.insert("Admin.researchRefer",  researchState);
	}

	@Override
	public int getListCountReferList(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("Admin.getListCountReferList");
	}

	@Override
	public List<Map<String, String>> researchReferList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();

		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		return sqlSession.selectList("Admin.researchReferList", null, rowBounds);
	}

	@Override
	public List<Map<String, Object>> researchReferDetail(SqlSessionTemplate sqlSession, int researchNo) {
		return sqlSession.selectList("Admin.researchReferDetail", researchNo);
	}

	@Override
	public int insertConferenceHistory(SqlSessionTemplate sqlSession, ResearchState researchState) {
		return sqlSession.insert("Admin.insertConferenceHistory", researchState);
	}

	@Override
	public int updateResearchPrice(SqlSessionTemplate sqlSession, ResearchState researchState) {
		return sqlSession.update("Admin.updateResearchPrice", researchState);
	}
	
	@Override
	public int getListResearchWaitingPayment(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("Admin.getListResearchWaitingPayment");
	}

	@Override
	public List<Map<String, String>> researchWaitingPayment(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();

		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		return sqlSession.selectList("Admin.researchWaitingPayment", null, rowBounds);
	}

	@Override
	public List<Map<String, Object>> researchWaitPaymentDetail(SqlSessionTemplate sqlSession, int researchNo) {
		return sqlSession.selectList("Admin.researchWaitPaymentDetail", researchNo);
	}

	@Override
	public int insertReferConferenceHistory(SqlSessionTemplate sqlSession, ResearchState researchState) {
		return sqlSession.insert("Admin.insertReferConferenceHistory", researchState);
	}

	@Override
	public int getListCountPaymentCompletedList(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("Admin.getListCountPaymentCompletedList");
	}

	@Override
	public List<Map<String, String>> paymentCompletedList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();

		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		return sqlSession.selectList("Admin.paymentCompletedList", null, rowBounds);
	}

	@Override
	public List<Map<String, String>> billsDetail(SqlSessionTemplate sqlSession, int billingHistoryNo) {
		return sqlSession.selectList("Admin.billsDetail", billingHistoryNo);
	}

	@Override
	public int getListCountSurveyReconstructionList(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("Admin.getListCountSurveyReconstructionList");
	}

	@Override
	public List<Map<String, String>> surveyReconstructionList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();

		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		return sqlSession.selectList("Admin.surveyReconstructionList", null, rowBounds);
	}

	@Override
	public int deleteDiscriminationChoice(SqlSessionTemplate sqlSession, Research research) {
		return sqlSession.delete("Admin.deleteDiscriminationChoice", research);
	}

	@Override
	public int deleteDiscriminationQuestion(SqlSessionTemplate sqlSession, Research research) {
		return sqlSession.delete("Admin.deleteDiscriminationQuestion", research);
	}

	@Override
	public int reconstruction(SqlSessionTemplate sqlSession, ResearchQuestion researchQuestion) {
		return sqlSession.update("Admin.reconstruction", researchQuestion);
	}

	@Override
	public int insertDiscriminationQuestion(SqlSessionTemplate sqlSession, ResearchQuestion researchQuestion) {
		return sqlSession.insert("Admin.insertDiscriminationQuestion", researchQuestion);
	}

	@Override
	public int insertDiscriminationChoice(SqlSessionTemplate sqlSession, ResearchChoice researchChoice) {
		return sqlSession.insert("Admin.insertDiscriminationChoice", researchChoice);
	}

	@Override
	public int researchReconstruction(SqlSessionTemplate sqlSession, ResearchState researchState) {
		return sqlSession.insert("Admin.researchReconstruction", researchState);
	}

	@Override
	public int updateResearchNamePanel(SqlSessionTemplate sqlSession, Research research) {
		return sqlSession.update("Admin.updateResearchNamePanel", research);
	}

	@Override
	public List<Map<String, Object>> discriminationDetail(SqlSessionTemplate sqlSession, int researchNo) {
		return sqlSession.selectList("Admin.discriminationDetail", researchNo);
	}

	@Override
	public int reconstructureRefer(SqlSessionTemplate sqlSession, ResearchState researchState) {
		return sqlSession.insert("Admin.reconstructureRefer",  researchState);
	}

	@Override
	public int reconstructureReferConferenceHistory(SqlSessionTemplate sqlSession, ResearchState researchState) {
		return sqlSession.insert("Admin.reconstructureReferConferenceHistory",  researchState);
	}

	@Override
	public ResearchTarget researchTargetMailing(SqlSessionTemplate sqlSession, int researchNo) {
		return sqlSession.selectOne("Admin.researchTargetMailing", researchNo);
	}

	@Override
	public List<TargetMember> getTargetList(SqlSessionTemplate sqlSession, ResearchTarget target, int researchEngagementGoals) throws ResearchException {
		RowBounds rowBounds = new RowBounds(0, researchEngagementGoals);
		List<TargetMember> list = sqlSession.selectList("Admin.selectTargetList", target, rowBounds);
		if(list == null) {
			throw new ResearchException("타겟멤버 불러오기 실패");
		}
		return list;
	}

	@Override
	public int selectResearchEngagementGoals(SqlSessionTemplate sqlSession, int researchNo) {
		return sqlSession.selectOne("Admin.selectResearchEngagementGoals", researchNo);
	}
	
  @Override
	public List<Object> tsQaManagement(SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("Admin.researchSelect");
	}

	@Override
	public int tsDeleteChoice(SqlSessionTemplate sqlSession) {
		return sqlSession.delete("Admin.tsDeleteChoice");
	}

	@Override
	public int tsDeleteQuestion(SqlSessionTemplate sqlSession) {
		return sqlSession.delete("Admin.tsDeleteQuestion");
	}

	@Override
	public int insertQuestion(SqlSessionTemplate sqlSession, ResearchQuestion question) {
		return sqlSession.update("Admin.tsUpdateQuestion", question); 
	}

	@Override
	public int insertChoice(SqlSessionTemplate sqlSession, ResearchChoice researchChoice) {
		return sqlSession.insert("Admin.insertChoice", researchChoice);
	}

	@Override
	public int uploadAudio(SqlSessionTemplate sqlSession, UploadFile ufo) {
		return sqlSession.update("Admin.uploadAudio",ufo);
  }
  
  @Override
	public List<PanelThanksSurvey> selectPanelTs(SqlSessionTemplate sqlSession, PanelThanksSurvey ps) {
		return sqlSession.selectList("Admin.selectPanelTs",ps);
	}

	@Override
	public List<MailingList> selectMailingList(SqlSessionTemplate sqlSession, MailingList list) {
		return sqlSession.selectList("Admin.selectMailingList", list);
	}

	@Override
	public int getListCountMailingList(SqlSessionTemplate sqlSession, MailingList list) {
		return sqlSession.selectOne("Admin.selectCountMailingList", list);
	}

	@Override
	public int insertMailingHistory(SqlSessionTemplate sqlSession, int researchNo) {
		return sqlSession.insert("Admin.insertMailingHistory", researchNo);
	}

	@Override
	public int insertRStatusHistory(SqlSessionTemplate sqlSession, int researchNo) {
		return sqlSession.insert("Admin.insertRStatusHistory", researchNo);
	}

	@Override
	public int selectMailingHistoryNo(SqlSessionTemplate sqlSession, int researchNo) {
		return sqlSession.selectOne("Admin.selectMailingHistoryNo", researchNo);
	}

	@Override
	public int insertMailingReceiver(SqlSessionTemplate sqlSession, MailingReceiver mr) {
		return sqlSession.insert("Admin.insertMailingReceiver", mr);
	}
	
	@Override
	public int insertMailingHistoryRe(SqlSessionTemplate sqlSession, int researchNo) {
		return sqlSession.insert("Admin.insertMailingHistoryRe", researchNo);
	}

	@Override
	public int selectMailingHistoryOrder(SqlSessionTemplate sqlSession, int researchNo) {
		String result = sqlSession.selectOne("Admin.selectMailingHistoryOrder", researchNo);
		System.out.println("dao : " + result);
		if(result == null) {
			return 0;
		} else {
			return Integer.parseInt(result);
		}
	}

	@Override
	public String selectMailingHistoryCurrentDate(SqlSessionTemplate sqlSession, int researchNo) {
		return sqlSession.selectOne("Admin.selectMailingHistoryCurrentDate", researchNo);
	}

	@Override
	public String selectResearchPeriod(SqlSessionTemplate sqlSession, int researchNo) {
		return sqlSession.selectOne("Admin.selectResearchPeriod", researchNo);
	}

	@Override
	public List<ResearchReport> selectResearchReportList(SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("Admin.selectResearchReportList");
	}

	@Override
	public List<ResearchHistory> selectResearchHistoryList(SqlSessionTemplate sqlSession, int researchNo) {
		return sqlSession.selectList("Admin.selectResearchHistoryList", researchNo);
	}

	@Override
	public List<RquestionNo> selectRquestionNoList(SqlSessionTemplate sqlSession, int researchNo) {
		return sqlSession.selectList("Admin.selectRquestionNoList", researchNo);
	}

	@Override
	public int selectResearchHistoryCount(SqlSessionTemplate sqlSession, int researchNo) {
		return sqlSession.selectOne("Admin.selectResearchHistoryCount", researchNo);
	}

	@Override
	public List<ResearchGraphTemp2> selectResearchHistoryCountList(SqlSessionTemplate sqlSession,
			ResearchGraphTemp temp) {
		return sqlSession.selectList("Admin.selectResearchHistoryCountList", temp);
	}

	@Override
	public List<Question> selectQuestionList(SqlSessionTemplate sqlSession, int researchNo) {
		return sqlSession.selectList("Admin.selectQuestionList", researchNo);
	}

	@Override
	public List<Choice> selectChoiceList(SqlSessionTemplate sqlSession, int researchNo) {
		return sqlSession.selectList("Admin.selectChoiceList", researchNo);
	}

	@Override
	public ResearchOne selectResearchOne(SqlSessionTemplate sqlSession, int researchNo) {
		return sqlSession.selectOne("Admin.selectResearchOne", researchNo);
	}
	
	@Override
	public int updatePanelLevel(SqlSessionTemplate sqlSession, int mno) {
		return sqlSession.update("Admin.updatePanelLevel",mno);
	}

	@Override
	public int deletePanelThanksSurvey(SqlSessionTemplate sqlSession, int mno) {
		return sqlSession.delete("Admin.deletePanelThanksSurvey",mno);
	}
	
	@Override
	public int deleteChoice(SqlSessionTemplate sqlSession) {
		return sqlSession.update("Admin.deleteChoice");
	}

	@Override
	public int mergeQuestion(SqlSessionTemplate sqlSession, ResearchQuestion req) {
		return sqlSession.update("Admin.updateQuestion",req); 
	}

	@Override 
	public int insertAudioChoice(SqlSessionTemplate sqlSession, ResearchChoice choice) {
		return sqlSession.insert("Admin.insertAudioChoice", choice);
	}

	@Override
	public ResearchQuestion pcQaManagement(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("Admin.selectPcQa");
	}

	@Override
	public int mergeVideoQuestion(SqlSessionTemplate sqlSession, ResearchQuestion req) {
		return sqlSession.update("Admin.updateVideoQuestion",req);
	}

	@Override
	public int getPanelCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("Admin.getPanelCount");
	}

	@Override
	public int getCorpCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("Admin.getCorpCount");
	}

	@Override
	public int getResearchCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("Admin.getResearchCount");
	}

	@Override
	public int getListCountdisposalResponseList(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("Admin.getListCountdisposalResponseList");
	}

	@Override
	public List<Map<String, String>> disposalResponseList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();

		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		return sqlSession.selectList("Admin.disposalResponseList", null, rowBounds);
	}
}
