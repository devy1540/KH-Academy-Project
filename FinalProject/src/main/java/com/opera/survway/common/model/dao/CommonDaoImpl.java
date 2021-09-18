package com.opera.survway.common.model.dao;

import com.opera.survway.panel.model.vo.PanelMember;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class CommonDaoImpl implements CommonDao{
	
	@Override
	public boolean duplicationIdCheck(SqlSessionTemplate sqlSession, String userId) {
		int count = sqlSession.selectOne("Member.duplicationIdCheck", userId);
		
		if(count > 0) {
			return true;
		}else {
			return false;
		}
	}

	@Override
	public boolean duplicationEmailCheck(SqlSessionTemplate sqlSession, String userEmail) {
		int count = sqlSession.selectOne("Member.duplicationEmailCheck", userEmail);
		
		if(count > 0) {
			return true;
		}else {
			return false;
		}
	}

	@Override
	public int certificationMember(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.update("Member.certification", userId);
	}
	
	@Override
	public String selectEncPassword(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.selectOne("Panel.selectPwd", userId);
	}

	@Override
	public int updateAccount(SqlSessionTemplate sqlSession, PanelMember loginUser) {
		return sqlSession.update("Panel.updateAccount", loginUser);
	}
}
