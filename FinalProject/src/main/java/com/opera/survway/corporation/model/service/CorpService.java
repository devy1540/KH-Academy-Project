package com.opera.survway.corporation.model.service;

import com.opera.survway.admin.model.exception.ResearchException;
import com.opera.survway.common.model.vo.ResearchState;
import com.opera.survway.common.model.vo.UploadFile;
import com.opera.survway.corporation.model.vo.*;
import com.opera.survway.exception.LoginException;
import com.opera.survway.exception.SelectException;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public interface CorpService {

	CorpMember loginMember(CorpMember cm) throws LoginException;

	int insertCorp(CorpMember cm, UploadFile uploadfile) throws LoginException;

	void insertResearch(Research research, ArrayList<ResearchQuestion> questionList, ArrayList<UploadFile> uploadFiles) throws ResearchException;

	List<Research> previousResearch(SearchResearch searchResearch) throws SelectException;

	int getListCountResearch(SearchResearch searchResearch) throws SelectException;

	Research previousResearchDetail(int researchNo) throws SelectException;

	int getQuestionCount(int researchNo);

	boolean priceConference(ResearchState researchstate);

	boolean researchPayment(Payment payment);

	boolean recontructionConference(ResearchState researchState);

	boolean recontructionApproved(int researchNo);
}
