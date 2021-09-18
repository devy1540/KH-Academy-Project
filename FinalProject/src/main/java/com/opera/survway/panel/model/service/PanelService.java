package com.opera.survway.panel.model.service;

import com.opera.survway.common.model.vo.PageInfo;
import com.opera.survway.common.model.vo.UploadFile;
import com.opera.survway.exception.*;
import com.opera.survway.panel.model.vo.*;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;


public interface PanelService {

	PanelMember loginMember(PanelMember pm) throws LoginException;

	int insertMember(PanelMember pm) throws LoginException;

	int insertInquiry(Inquiry i) throws InquiryException;

	List<Inquiry> selectAllMyInquiry(Inquiry i) throws InquiryException;

	int getListCountInquiry(Inquiry iq) throws InquiryException;

	int updateMemberInfo(PanelMember pm);

	int updatePassword(PanelMember pm);

	int updateLeaveMember(PanelMember pm);

	int getNoticeListCount(SearchNotice searchNotice) throws SelectException;

	List<Notice> selectNoticeList(SearchNotice searchNotice) throws SelectException;

	List<Notice> selectMainNoticeList() throws SelectException;

	List<Research> selectMainResearchList(PanelMember loginUser) throws SelectException;

	List<Reward> showMyRewardDetailSaved(Reward rd) throws RewardException;

	int getListCountRewardSaved(Reward rd) throws RewardException;

	List<Reward> showRewardDetailUsed(Reward r) throws RewardException;

	int getListCountRewardUsed(Reward r) throws RewardException;

	Reward getPanelReward(int mno) throws RewardException;

	int insertCashOutHistory(Reward r) throws RewardException;

	List<ResearchQuestion> getTsQuestionList() throws SelectException;

	int insertFaq(Faq faq) throws InquiryException;

	int getListCountFaq(Faq f) throws InquiryException;

	List<Faq> selectAllFaq(Faq f) throws InquiryException;

	int deleteFaq(Faq f) throws InquiryException;

	int updateFaq(Faq f) throws InquiryException;

	int answerInquiry(Inquiry i) throws InquiryException;

	int deleteAnswerInquiry(Inquiry i) throws InquiryException;

	int getCountMyResearch(PanelMember loginUser);

	List<Research> getMyResearchList(PanelMember loginUser, PageInfo pi);

	List<ResearchQuestion> getResearchQuestionList(String researchNo, String rquestionVideolink) throws SelectException;

	Research getResearchInfo(String researchNo) throws SelectException;

	int writeNotice(Notice n);

	int editNotice(Notice n);

	Notice selectNotice(int parseInt);

	int noticeDelete(int parseInt);

	int useRewardList(Reward r) ;

	int nowMyReward(Reward r);

	int insertResearchTry(AttemptInsert attempt);

	int insertAnswer(InsertAnswer answer);

	int uploadSurvey(PanelSurvey panelSurvey, ArrayList<UploadFile> uploadFileList) throws SurveyException;

	int getListCountPanelResearch(PanelResearchList rl) throws InquiryException;

	List<PanelResearchList> selectAllPanelResearchList(PanelResearchList rl);

	int getListCountPanelResearchRetry(PanelResearchList rl) throws InquiryException;

	List<PanelResearchList> selectAllPanelResearchRetryList(PanelResearchList rl);

	int insertSurveyReward(SurveyReward reward);

	int disposalAnswer(InsertAnswer answer);

  int getPanelSurveyList(SearchSurvey searchSurvey);

	List<Map<String, Object>> panelSurveyList(SearchSurvey searchSurvey, int offsetSize) throws SelectException;

	List<Integer> likeCheck(int mno);

	int changeLikeCount(int surveyNo, int mno, String status);

	List<Map<String, Object>> statisticList(int surveyNo);

	List<Map<String, Object>> replyList(int surveyNo);

	boolean voteCheck(Vote vote);

	int voteSurvey(Vote vote);

	int replyUpload(SurveyReply surveyReply);

	int rereplyUpload(SurveyReply surveyReply);

}
