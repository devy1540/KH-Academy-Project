package com.opera.survway.common.model.service;

import com.opera.survway.common.model.dao.CommonDao;
import com.opera.survway.panel.model.vo.PanelMember;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class CommonServiceImpl implements CommonService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private CommonDao cd;
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	
	/**
	 * @Author      : Ungken
	 * @CreateDate  : 2020. 1. 21.
	 * @ModifyDate  : 2020. 1. 21.
	 * @Description : 아이디 중복확인 기능
	 */
	@Override
	public boolean duplicationIdCheck(String userId) {
		return cd.duplicationIdCheck(sqlSession, userId);
	}
	
	/**
	 * @Author      : Ungken
	 * @CreateDate  : 2020. 1. 21.
	 * @ModifyDate  : 2020. 1. 21.
	 * @Description : 이메일 중복확인 기능
	 */
	@Override
	public boolean duplicationEmailCheck(String userEmail) {
		return cd.duplicationEmailCheck(sqlSession, userEmail);
	}

	/**
	 * @Author      : Ungken
	 * @CreateDate  : 2020. 1. 22.
	 * @ModifyDate  : 2020. 1. 22.
	 * @Description : 정회원 인증 기능
	 */
	@Override
	public int certificationMember(String userId) {
		return cd.certificationMember(sqlSession, userId);
	}
	
	/**
	 * @Author      : yhj
	 * @CreateDate  : 2020. 1. 24.
	 * @ModifyDate  : 2020. 1. 24.
	 * @Description : 모달창 비밀번호 체크
	 */
	@Override
	public boolean checkPasswordModal(String userId, String ajaxPwd) {
//		PanelMember pm = new PanelMember();
//		pm.setUserId(userId);
		System.out.println("userId : " + userId);
		System.out.println("ajaxPwd : " + ajaxPwd);
		String userPwd = cd.selectEncPassword(sqlSession, userId);
		System.out.println("userPwd : " + userPwd);
		if(passwordEncoder.matches(ajaxPwd, userPwd)) {
			System.out.println("service단 : 일치");
			return true;
		} else {
			System.out.println("service단 : 불일치");
			return false;
		}
	}

	/**
	 * @Author      : Ungken
	 * @CreateDate  : 2020. 2. 6.
	 * @ModifyDate  : 2020. 2. 6.
	 * @Description : 계좌 번호 업데이트
	 */
	@Override
	public boolean updateAccount(PanelMember loginUser) {
		boolean isUpdate = false;
		
		int result = cd.updateAccount(sqlSession, loginUser);
		
		if(result > 0) {
			isUpdate = true;
		}
		return isUpdate;
	}

}
