package com.opera.survway.corporation.model.dao;

import com.opera.survway.common.model.vo.ResearchState;
import com.opera.survway.common.model.vo.UploadFile;
import com.opera.survway.corporation.model.vo.*;
import com.opera.survway.exception.LoginException;
import org.mybatis.spring.SqlSessionTemplate;

import java.util.List;

public interface CorpDao {

	CorpMember loginCheck(SqlSessionTemplate sqlSession, CorpMember cm) throws LoginException;

	int insertMemberTable(SqlSessionTemplate sqlSession, CorpMember cm);

	int insertCorpTable(SqlSessionTemplate sqlSession, CorpMember cm);

	String selectEncPassword(SqlSessionTemplate sqlSession, CorpMember cm);

	int insertTermsCorp(SqlSessionTemplate sqlSession, CorpMember cm);

	int insertResearch(SqlSessionTemplate sqlSession, Research research);

	int insertQuestion(SqlSessionTemplate sqlSession, ResearchQuestion question);

	int insertChoice(SqlSessionTemplate sqlSession, ResearchChoice choice);

	int insertImage(SqlSessionTemplate sqlSession, UploadFile uploadFile);

	int insertTarger(SqlSessionTemplate sqlSession, Research research);

	int insertResearchState(SqlSessionTemplate sqlSession, Research research);

	List<Research> previousResearch(SqlSessionTemplate sqlSession, SearchResearch searchResearch);

	int getListCountResearch(SqlSessionTemplate sqlSession, SearchResearch searchResearch);

	Research previousResearchDetail(SqlSessionTemplate sqlSession, int researchNo);

	int getQuestionCount(SqlSessionTemplate sqlSession, int researchNo);

	int insertConferenceHistory(SqlSessionTemplate sqlSession, ResearchState researchstate);

	int insertConferenceState(SqlSessionTemplate sqlSession, ResearchState researchstate);

	int insertPayment(SqlSessionTemplate sqlSession, Payment payment);

	int insertPaymentState(SqlSessionTemplate sqlSession, Payment payment);

	int insertRecontructionConferenceState(SqlSessionTemplate sqlSession, ResearchState researchState);

	int insertRecontructionConferenceHistory(SqlSessionTemplate sqlSession, ResearchState researchState);

	int recontructionApproved(SqlSessionTemplate sqlSession, int researchNo);

	int insertCorpImage(SqlSessionTemplate sqlSession, UploadFile uploadfile);

}
