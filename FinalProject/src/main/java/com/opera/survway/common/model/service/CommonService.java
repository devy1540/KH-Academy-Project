package com.opera.survway.common.model.service;

import com.opera.survway.panel.model.vo.PanelMember;

public interface CommonService {

	boolean duplicationIdCheck(String userId);

	boolean duplicationEmailCheck(String userEmail);

	int certificationMember(String userId);

	boolean checkPasswordModal(String userId, String ajaxPwd);

	boolean updateAccount(PanelMember loginUser);

}
