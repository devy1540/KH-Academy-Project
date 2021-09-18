package com.opera.survway.common.model.dao;

import com.opera.survway.panel.model.vo.PanelMember;
import org.mybatis.spring.SqlSessionTemplate;

public interface CommonDao {

	boolean duplicationIdCheck(SqlSessionTemplate sqlSession, String userId);

	boolean duplicationEmailCheck(SqlSessionTemplate sqlSession, String userEmail);

	int certificationMember(SqlSessionTemplate sqlSession, String userId);

	String selectEncPassword(SqlSessionTemplate sqlSession, String userId);

	int updateAccount(SqlSessionTemplate sqlSession, PanelMember loginUser);

}
