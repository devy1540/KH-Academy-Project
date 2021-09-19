package com.opera.survway.corporation.model.dao;

import com.opera.survway.common.model.vo.ResearchState;
import com.opera.survway.common.model.vo.UploadFile;
import com.opera.survway.corporation.model.vo.*;
import com.opera.survway.exception.LoginException;
import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class CorpDaoImpl implements CorpDao {

	@Override
	public CorpMember loginCheck(SqlSessionTemplate sqlSession, CorpMember cm) throws LoginException {
		
		CorpMember loginUser = sqlSession.selectOne("Corp.loginCheck", cm);

		if(loginUser == null) {
			throw new LoginException("로그인 정보가 존재하지 않습니다.");
		}

		return loginUser;
	}

	@Override
	public int insertMemberTable(SqlSessionTemplate sqlSession, CorpMember cm) {
		return sqlSession.insert("Corp.insertMember", cm);
	}

	@Override
	public int insertCorpTable(SqlSessionTemplate sqlSession, CorpMember cm) {
		return sqlSession.insert("Corp.insertCorp", cm);
	}

	@Override
	public String selectEncPassword(SqlSessionTemplate sqlSession, CorpMember cm) {
		return sqlSession.selectOne("Corp.selectPwd", cm.getUserId());
	}

	@Override
	public int insertTermsCorp(SqlSessionTemplate sqlSession, CorpMember cm) {
		return sqlSession.insert("Corp.insertTermsCorp", cm);
	}

	@Override
	public int insertResearch(SqlSessionTemplate sqlSession, Research research) {
		return sqlSession.insert("Corp.insertResearch", research);
	}

	@Override
	public int insertTarger(SqlSessionTemplate sqlSession, Research research) {
		return sqlSession.insert("Corp.insertTarget", research);
	}
	
	@Override
	public int insertQuestion(SqlSessionTemplate sqlSession, ResearchQuestion question) {
		return sqlSession.insert("Corp.insertQuestion", question);
	}

	@Override
	public int insertChoice(SqlSessionTemplate sqlSession, ResearchChoice choice) {
		return sqlSession.insert("Corp.insertChoice", choice);
	}

	@Override
	public int insertImage(SqlSessionTemplate sqlSession, UploadFile uploadFile) {
		if(uploadFile.getFileType().equals("리서치 문항")) {
			return sqlSession.insert("Corp.insertImage", uploadFile);
		}else if(uploadFile.getFileType().equals("리서치 보기")) {
			return sqlSession.insert("Corp.insertChoiceImage", uploadFile);
		}
		return 0;
	}

	@Override
	public int insertResearchState(SqlSessionTemplate sqlSession, Research research) {
		return sqlSession.insert("Corp.insertResearchState", research);
	}

	@Override
	public List<Research> previousResearch(SqlSessionTemplate sqlSession, SearchResearch searchResearch) {
		int offset = (searchResearch.getPi().getCurrentPage() - 1) * searchResearch.getPi().getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, searchResearch.getPi().getLimit());
		
		return sqlSession.selectList("Corp.previousResearch", searchResearch, rowBounds);
	}

	@Override
	public int getListCountResearch(SqlSessionTemplate sqlSession, SearchResearch searchResearch) {
		return sqlSession.selectOne("Corp.getListCountResearch", searchResearch);
	}

	@Override
	public Research previousResearchDetail(SqlSessionTemplate sqlSession, int researchNo) {
		return sqlSession.selectOne("Corp.previousResearchDetail", researchNo);
	}

	@Override
	public int getQuestionCount(SqlSessionTemplate sqlSession, int researchNo) {
		return sqlSession.selectOne("Corp.getQuestionCount", researchNo);
	}

	@Override
	public int insertConferenceHistory(SqlSessionTemplate sqlSession, ResearchState researchstate) {
		return sqlSession.insert("Corp.insertConferenceHistory", researchstate);
	}

	@Override
	public int insertConferenceState(SqlSessionTemplate sqlSession, ResearchState researchstate) {
		return sqlSession.insert("Corp.insertConferenceState", researchstate);
	}

	@Override
	public int insertPayment(SqlSessionTemplate sqlSession, Payment payment) {
		return sqlSession.insert("Corp.insertPayment", payment);
	}

	@Override
	public int insertPaymentState(SqlSessionTemplate sqlSession, Payment payment) {
		return sqlSession.insert("Corp.insertPaymentState", payment);
	}

	@Override
	public int insertRecontructionConferenceState(SqlSessionTemplate sqlSession, ResearchState researchState) {
		return sqlSession.insert("Corp.insertRecontructionConferenceState", researchState);
	}

	@Override
	public int insertRecontructionConferenceHistory(SqlSessionTemplate sqlSession, ResearchState researchState) {
		return sqlSession.insert("Corp.insertRecontructionConferenceHistory", researchState);
	}

	@Override
	public int recontructionApproved(SqlSessionTemplate sqlSession, int researchNo) {
		return sqlSession.insert("Corp.recontructionApproved", researchNo);
	}

	@Override
	public int insertCorpImage(SqlSessionTemplate sqlSession, UploadFile uploadfile) {
		return sqlSession.insert("Corp.insertCorpImage", uploadfile);
	}
}
