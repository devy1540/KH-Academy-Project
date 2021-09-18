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
import org.mybatis.spring.SqlSessionTemplate;

import java.util.List;
import java.util.Map;

public interface AdminDao {

	List<AllMember> memberInfoManagement(SqlSessionTemplate sqlSession, SearchMember searchMember);

	int getListCountPanel(SqlSessionTemplate sqlSession, SearchMember searchMember);

	AllMember selectMember(SqlSessionTemplate sqlSession, int mno);

	int getListCountPanelCashoutApplicant(SqlSessionTemplate sqlSession);

	List<PanelRewardHistory> panelCashoutApplication(SqlSessionTemplate sqlSession, PageInfo pi);

	int cashoutPeople(SqlSessionTemplate sqlSession, List<String> cnoArr);

	int getListCountManageCashoutComplete(SqlSessionTemplate sqlSession);

	List<PanelRewardHistory> manageCashoutComplete(SqlSessionTemplate sqlSession, PageInfo pi);

	int getListCountNewPanel(SqlSessionTemplate sqlSession, SearchMember searchMember);

	List<AllMember> getListNewPanel(SqlSessionTemplate sqlSession, SearchMember searchMember);

	AllMember getNewPanelDetail(SqlSessionTemplate sqlSession, int mno);

	int getListCountArrovalList(SqlSessionTemplate sqlSession);

	List<Map<String, String>> researchApprovalWaitList(SqlSessionTemplate sqlSession, PageInfo pi);

	List<Map<String, Object>> researchApprovalDetail(SqlSessionTemplate sqlSession, int researchNo);

	UploadFile questionImage(SqlSessionTemplate sqlSession, int questionNo);

	UploadFile choiceImage(SqlSessionTemplate sqlSession, int choiceNo);

	int researchApproved(SqlSessionTemplate sqlSession, ResearchState researchState);

	int researchRefer(SqlSessionTemplate sqlSession, ResearchState researchState);

	int getListCountReferList(SqlSessionTemplate sqlSession);

	List<Map<String, String>> researchReferList(SqlSessionTemplate sqlSession, PageInfo pi);

	List<Map<String, Object>> researchReferDetail(SqlSessionTemplate sqlSession, int researchNo);

	int insertConferenceHistory(SqlSessionTemplate sqlSession, ResearchState researchState);

	int updateResearchPrice(SqlSessionTemplate sqlSession, ResearchState researchState);

	int getListResearchWaitingPayment(SqlSessionTemplate sqlSession);

	List<Map<String, String>> researchWaitingPayment(SqlSessionTemplate sqlSession, PageInfo pi);

	List<Map<String, Object>> researchWaitPaymentDetail(SqlSessionTemplate sqlSession, int researchNo);

	int insertReferConferenceHistory(SqlSessionTemplate sqlSession, ResearchState researchState);

	int getListCountPaymentCompletedList(SqlSessionTemplate sqlSession);

	List<Map<String, String>> paymentCompletedList(SqlSessionTemplate sqlSession, PageInfo pi);

	List<Map<String, String>> billsDetail(SqlSessionTemplate sqlSession, int billingHistoryNo);

	int getListCountSurveyReconstructionList(SqlSessionTemplate sqlSession);

	List<Map<String, String>> surveyReconstructionList(SqlSessionTemplate sqlSession, PageInfo pi);

	int deleteDiscriminationChoice(SqlSessionTemplate sqlSession, Research research);

	int deleteDiscriminationQuestion(SqlSessionTemplate sqlSession, Research research);

	int reconstruction(SqlSessionTemplate sqlSession, ResearchQuestion researchQuestion);

	int insertDiscriminationQuestion(SqlSessionTemplate sqlSession, ResearchQuestion researchQuestion);

	int insertDiscriminationChoice(SqlSessionTemplate sqlSession, ResearchChoice researchChoice);

	int researchReconstruction(SqlSessionTemplate sqlSession, ResearchState researchState);

	int updateResearchNamePanel(SqlSessionTemplate sqlSession, Research research);

	List<Map<String, Object>> discriminationDetail(SqlSessionTemplate sqlSession, int researchNo);

	int reconstructureRefer(SqlSessionTemplate sqlSession, ResearchState researchState);

	int reconstructureReferConferenceHistory(SqlSessionTemplate sqlSession, ResearchState researchState);

	List<Object> tsQaManagement(SqlSessionTemplate sqlSession);

	int tsDeleteChoice(SqlSessionTemplate sqlSession);

	int tsDeleteQuestion(SqlSessionTemplate sqlSession);

	int insertQuestion(SqlSessionTemplate sqlSession, ResearchQuestion question);

	int insertChoice(SqlSessionTemplate sqlSession, ResearchChoice researchChoice);

	List<PanelThanksSurvey> selectPanelTs(SqlSessionTemplate sqlSession, PanelThanksSurvey ps);

	List<MailingList> selectMailingList(SqlSessionTemplate sqlSession, MailingList list);

	int getListCountMailingList(SqlSessionTemplate sqlSession, MailingList list);

	int insertMailingHistory(SqlSessionTemplate sqlSession, int researchNo);

	int insertRStatusHistory(SqlSessionTemplate sqlSession, int researchNo);

	int selectMailingHistoryNo(SqlSessionTemplate sqlSession, int researchNo);

	int insertMailingReceiver(SqlSessionTemplate sqlSession, MailingReceiver mr);

	int uploadAudio(SqlSessionTemplate sqlSession, UploadFile ufo);
	
	int insertMailingHistoryRe(SqlSessionTemplate sqlSession, int researchNo);

	int selectResearchEngagementGoals(SqlSessionTemplate sqlSession, int researchNo);

	List<TargetMember> getTargetList(SqlSessionTemplate sqlSession, ResearchTarget target, int researchEngagementGoals)
			throws ResearchException;

	ResearchTarget researchTargetMailing(SqlSessionTemplate sqlSession, int researchNo);

	int selectMailingHistoryOrder(SqlSessionTemplate sqlSession, int researchNo);

	String selectMailingHistoryCurrentDate(SqlSessionTemplate sqlSession, int researchNo);
 
	String selectResearchPeriod(SqlSessionTemplate sqlSession, int researchNo);

	List<ResearchReport> selectResearchReportList(SqlSessionTemplate sqlSession);

	List<ResearchHistory> selectResearchHistoryList(SqlSessionTemplate sqlSession, int researchNo);

	List<RquestionNo> selectRquestionNoList(SqlSessionTemplate sqlSession, int researchNo);

	int selectResearchHistoryCount(SqlSessionTemplate sqlSession, int researchNo);

	List<ResearchGraphTemp2> selectResearchHistoryCountList(SqlSessionTemplate sqlSession, ResearchGraphTemp temp);

	List<Question> selectQuestionList(SqlSessionTemplate sqlSession, int researchNo);

	List<Choice> selectChoiceList(SqlSessionTemplate sqlSession, int researchNo);

	ResearchOne selectResearchOne(SqlSessionTemplate sqlSession, int researchNo);
	
	int updatePanelLevel(SqlSessionTemplate sqlSession, int mno);

	int deletePanelThanksSurvey(SqlSessionTemplate sqlSession, int mno);

	int deleteChoice(SqlSessionTemplate sqlSession);

	int mergeQuestion(SqlSessionTemplate sqlSession, ResearchQuestion req);

	int insertAudioChoice(SqlSessionTemplate sqlSession, ResearchChoice choice);

	ResearchQuestion pcQaManagement(SqlSessionTemplate sqlSession);

	int mergeVideoQuestion(SqlSessionTemplate sqlSession, ResearchQuestion req);

	int getPanelCount(SqlSessionTemplate sqlSession);

	int getCorpCount(SqlSessionTemplate sqlSession);

	int getResearchCount(SqlSessionTemplate sqlSession);

	int getListCountdisposalResponseList(SqlSessionTemplate sqlSession);

	List<Map<String, String>> disposalResponseList(SqlSessionTemplate sqlSession, PageInfo pi);

}
