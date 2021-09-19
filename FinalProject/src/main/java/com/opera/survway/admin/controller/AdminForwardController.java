package com.opera.survway.admin.controller;

import com.opera.survway.admin.model.service.AdminService;
import com.opera.survway.admin.model.vo.MailingList;
import com.opera.survway.exception.SelectException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminForwardController {
	@Autowired
	AdminService as;
	
	@RequestMapping("adminMain.admin")
	public String forwardMain(Model model) {
		
		MailingList list = new MailingList();
		try {
			int panelCount = as.getPanelCount();
			int corpCount = as.getCorpCount();
			int approvalListCount = as.getListCountArrovalList();
			int reconstructionListCount = as.getListCountSurveyReconstructionList();
			int mailingWaitingListCount = as.getListCountMailingList(list);
			int allResearchCount = as.getResearchCount();
			
			model.addAttribute("panelCount", panelCount);
			model.addAttribute("corpCount", corpCount);
			model.addAttribute("approvalListCount", approvalListCount);
			model.addAttribute("reconstructionListCount", reconstructionListCount);
			model.addAttribute("mailingWaitingListCount", mailingWaitingListCount);
			model.addAttribute("allResearchCount", allResearchCount);
			
			return "common/adminMain";
		} catch (SelectException e) {
			model.addAttribute("msg", e.getMessage());
			return "redirect:errorPage.me";
		}
		
	}
	
	// 신규 패널 관리
	@RequestMapping("newPanelManagement.admin")
	public String forwardNewPanelManagement() {
		return "memberManagement/newPanelManagement";
	}

//	//단체 메일링 대기 목록
//	@RequestMapping("groupMailingWaitingList.admin")
//	public String forwardGroupMailingWaitingList() {
//		return "adminResearch/groupMailingWaitingList";
//	}

	//폐기응답목록
	@RequestMapping("disposalResponseManagement.admin")
	public String forwardDisposalResponseManagement() {
		return "adminResearch/disposalResponseManagement";
	}
	//불량응답목록
	@RequestMapping("poorResponseList.admin")
	public String forwardPoorResponseList() {
		return "adminResearch/poorResponseList";
	}
	
	//불량응답이의신청관리
	@RequestMapping("applicationForDefectiveResponse.admin")
	public String forwardApplicationForDefectiveResponse() {
		return "adminResearch/applicationForDefectiveResponse";
	}
	
	//불량응답이의신청 처리완료
	@RequestMapping("poorResponseComplete.admin")
	public String forwardPoorResponseComplete() {
		return "adminResearch/poorResponseComplete";
	}
	
//	//리서치 보고서 작성 대기 목록-통계처리
//	@RequestMapping("researchReportStandbyList.admin")
//	public String forwardResearchReportStandbyList() {
//		return "adminResearch/researchReportStandbyList";
//	}
	
//	//리서치 보고서 작성 대기 목록-보고서 작성 목록
//	@RequestMapping("researchReportWriteList.admin")
//	public String forwardResearchReportWriteList() {
//		return "adminResearch/researchReportWriteList";
//	}

	//리서치 보고서 작성 대기 목록-결과 전송 목록
//	@RequestMapping("researchReportSendList.admin")
//	public String forwardResearchReportSendList() {
//		return "adminResearch/researchReportSendList";
//	}
	
	//완료된 리서치 목록
	@RequestMapping("researchCompletedProcessingList.admin")
	public String forwardResearchCompletedProcessingList() {
		return "adminResearch/researchCompletedProcessingList";
	}
	
	//ts질문관리
	@RequestMapping("tsQaManagement.admin")
	public String forwardTsQaManagement() {
		return "adminResearch/tsQaManagement";
	}
	
	
	//패널 pc환경조사 질문관리
	@RequestMapping("pcQaManagement.admin")
	public String forwardpcQaManagement() {
		return "adminResearch/pcQaManagement";
	}
}
