package com.opera.survway.admin.model.service;

import com.opera.survway.admin.model.exception.ResearchException;
import com.opera.survway.admin.model.vo.*;
import com.opera.survway.common.model.vo.AllMember;
import com.opera.survway.common.model.vo.PageInfo;
import com.opera.survway.common.model.vo.ResearchState;
import com.opera.survway.common.model.vo.UploadFile;
import com.opera.survway.corporation.model.vo.Research;
import com.opera.survway.corporation.model.vo.ResearchQuestion;
import com.opera.survway.exception.SelectException;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service
public interface AdminService {
	List<AllMember> memberInfoManagement(SearchMember searchMember) throws SelectException;

	int getListCountPanel(SearchMember searchMember) throws SelectException;

	AllMember selectMember(int mno) throws SelectException;

	int getListCountPanelCashoutApplicant() throws SelectException;

	List<PanelRewardHistory> panelCashoutApplication(PageInfo pi) throws SelectException;

	boolean cashoutPeople(List<String> cnoArr);

	int getListCountManageCashoutComplete() throws SelectException;

	List<PanelRewardHistory> manageCashoutComplete(PageInfo pi) throws SelectException;

	int getListCountNewPanel(SearchMember searchMember) throws SelectException;

	List<AllMember> getListNewPanel(SearchMember searchMember) throws SelectException;

	AllMember selectNewPanelDetail(int mno) throws SelectException;

	List<Map<String, String>> researchApprovalWaitList(PageInfo pi) throws SelectException;

	int getListCountArrovalList() throws SelectException;

	List<Map<String, Object>> researchApprovalDetail(int researchNo);

	boolean researchApproved(ResearchState researchState);

	boolean researchRefer(ResearchState researchState);

	int getListCountReferList() throws SelectException;

	List<Map<String, String>> researchReferList(PageInfo pi) throws SelectException;

	List<Map<String, Object>> researchReferDetail(int researchNo);

	int getListResearchWaitingPayment() throws SelectException;

	List<Map<String, String>> researchWaitingPayment(PageInfo pi) throws SelectException;

	List<Map<String, Object>> researchWaitPaymentDetail(int researchNo);

	boolean researchPaymentRefer(ResearchState researchState);

	int getListCountPaymentCompletedList() throws SelectException;

	List<Map<String, String>> paymentCompletedList(PageInfo pi) throws SelectException;

	List<Map<String, String>> billsDetail(int billingHistoryNo);

	int getListCountSurveyReconstructionList() throws SelectException;

	List<Map<String, String>> surveyReconstructionList(PageInfo pi) throws SelectException;

	boolean reconstruction(Research research, ArrayList<ResearchQuestion> questionList);

	List<Map<String, Object>> discriminationDetail(int researchNo);

	boolean reconstructureRefer(ResearchState researchState);

	boolean researchTargetMailing(int researchNo) throws ResearchException;

	List<Object> tsQaManagement();

	int tsQaManagementUpdate(ArrayList<ResearchQuestion> questionList);

	int uploadAudio(UploadFile ufo);

	List<PanelThanksSurvey> selectPanelTs(PanelThanksSurvey ps);

	List<MailingList> selectMailingList(MailingList list);

	int getListCountMailingList(MailingList list);

	List<ResearchReport> selectResearchReportList();

	List<ResearchHistory> selectResearchHistoryList(int researchNo);

	List<RquestionNo> selectRquestionNoList(int researchNo);

	List<ResearchGraphTemp2> selectResearchHistoryCountList(ResearchGraphTemp temp);

	List<Question> selectQuestionList(int researchNo);

	List<Choice> selectChoiceList(int researchNo);

	ResearchOne selectResearchOne(int researchNo);

	int updatePanelLevel(int mno) throws ResearchException;

	int deletePanelThanksSurvey(int mno) throws ResearchException;

	int audioEnviron(String questionTitle, String[] choiceTitleArr, String[] choiceOrderArr,String titleContex,String questionFormNo);

	ResearchQuestion pcQaManagement();

	int videoInsert(String questionTitle, String[] choiceTitleArr, String[] choiceOrderArr, String titleContext,
			String questionFormNo, String videoAdress);

	int uploadReport(UploadFile ufo);

	int getPanelCount();

	int getCorpCount();

	int getResearchCount();

	int getListCountdisposalResponseList() throws SelectException;

	List<Map<String, String>> disposalResponseList(PageInfo pi) throws SelectException;

}
