package com.opera.survway.admin.controller;

import com.google.gson.Gson;
import com.opera.survway.admin.model.exception.ResearchException;
import com.opera.survway.admin.model.service.AdminService;
import com.opera.survway.admin.model.vo.*;
import com.opera.survway.common.model.vo.*;
import com.opera.survway.corporation.model.vo.Research;
import com.opera.survway.corporation.model.vo.ResearchChoice;
import com.opera.survway.corporation.model.vo.ResearchQuestion;
import com.opera.survway.exception.SelectException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Controller
public class AdminResearchController {

	@Autowired
	AdminService as;
	@Autowired
	private JavaMailSender mailSender; // Mail Sender
	
	/**
	 * @Author      : Ungken
	 * @CreateDate  : 2020. 1. 31.
	 * @ModifyDate  : 2020. 1. 31.
	 * @Description : 리서치 승인 대기 목록 조회
	 */
	@RequestMapping("researchApprovalWaitList.adminResearch")
	public String researchApprovalWaitList(HttpServletRequest request, Model model) {
		String queryString = request.getQueryString();
		
		Map<String, List<String>> queryMap =  null;
		
		int currentPage = 1; 
		
		if(queryString != null) { 
			queryMap = Util.splitQuery(queryString);
			if(queryMap.containsKey("currentPage")) {
				currentPage = Integer.parseInt(queryMap.get("currentPage").get(0));
			}
		}
	  
		int listCount = 0;
		try {
			listCount = as.getListCountArrovalList();
			
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
			
			List<Map<String, String>> researchApprovalWaitList = as.researchApprovalWaitList(pi);
			
			model.addAttribute("researchApprovalWaitList", researchApprovalWaitList);
			model.addAttribute("pi", pi);
			return "researchApprovalWaitList";
		} catch (SelectException e) {
			model.addAttribute("msg", e.getMessage());
			return "redirect:errorPage.me";
		}
	}
	
	/**
	 * @Author      : Ungken
	 * @CreateDate  : 2020. 2. 1.
	 * @ModifyDate  : 2020. 2. 1.
	 * @Description : 신청 리서치 상세 보기
	 */
	@PostMapping("researchApprovalDetail.adminResearch")
	public ModelAndView researchApprovalDetail(ModelAndView mv, String researchNoStr) {
		int researchNo = Integer.parseInt(researchNoStr);
		
		List<Map<String, Object>> researchDetail = as.researchApprovalDetail(researchNo);
		
		mv.addObject("researchDetail", researchDetail);
		mv.setViewName("jsonView");
		
		return mv;
	}
	/**
	 * @Author      : Ungken
	 * @CreateDate  : 2020. 2. 1.
	 * @ModifyDate  : 2020. 2. 1.
	 * @Description : 리서치 승인
	 */
	@PostMapping("researchApproved.adminResearch")
	public ModelAndView researchApproved(ModelAndView mv, String researchNoStr, String engagementGoalsStr, String qCountStr) {
		int researchNo = Integer.parseInt(researchNoStr);
		int engagementGoals = Integer.parseInt(engagementGoalsStr);
		int qCount = Integer.parseInt(qCountStr);
		
		int price = 0;
		
		if(qCount <= 10) {
			switch(engagementGoals) {
				case 100:
					price = engagementGoals * 4500;
					break;
				case 200:
					price = engagementGoals * 3800;
					break;
				case 300:
					price = engagementGoals * 3400;
					break;
				case 400:
					price = engagementGoals * 3000;
					break;
				case 500:
					price = engagementGoals * 2800;
					break;
			}
		}else if(qCount > 10 && qCount <= 30) {
			switch(engagementGoals) {
				case 100:
					price = engagementGoals * 5100;
					break;
				case 200:
					price = engagementGoals * 4500;
					break;
				case 300:
					price = engagementGoals * 3800;
					break;
				case 400:
					price = engagementGoals * 3400;
					break;
				case 500:
					price = engagementGoals * 2800;
					break;
			}
		}else if(qCount > 30 && qCount <= 50) {
			switch(engagementGoals) {
				case 100:
					price = engagementGoals * 6700;
					break;
				case 200:
					price = engagementGoals * 5500;
					break;
				case 300:
					price = engagementGoals * 4700;
					break;
				case 400:
					price = engagementGoals * 4200;
					break;
				case 500:
					price = engagementGoals * 3700;
					break;
			}
		}else if(qCount > 50 && qCount <= 70) {
			switch(engagementGoals) {
				case 100:
					price = engagementGoals * 8400;
					break;
				case 200:
					price = engagementGoals * 7000;
					break;
				case 300:
					price = engagementGoals * 6300;
					break;
				case 400:
					price = engagementGoals * 5800;
					break;
				case 500:
					price = engagementGoals * 4500;
					break;
			}
		}else if(qCount > 70) {
			switch(engagementGoals) {
				case 100:
					price = engagementGoals * 9400;
					break;
				case 200:
					price = engagementGoals * 8000;
					break;
				case 300:
					price = engagementGoals * 7300;
					break;
				case 400:
					price = engagementGoals * 6500;
					break;
				case 500:
					price = engagementGoals * 5700;
					break;
			}
		}
		
		ResearchState researchState = new ResearchState();
		researchState.setResearchNo(researchNo);
		researchState.setPrice(price);
		boolean isApproved = as.researchApproved(researchState);
		
		mv.addObject("isApproved", isApproved);
		mv.setViewName("jsonView");
		return mv;
	}
	
	/**
	 * @Author      : Ungken
	 * @CreateDate  : 2020. 2. 2.
	 * @ModifyDate  : 2020. 2. 2.
	 * @Description : 리서치 반려
	 */
	@PostMapping("researchRefer.adminResearch")
	public ModelAndView researchRefer(ModelAndView mv, String researchNoStr, String referReason) {
		int researchNo = Integer.parseInt(researchNoStr);
		
		ResearchState researchState = new ResearchState();
		researchState.setReferReason(referReason);
		researchState.setResearchNo(researchNo);
		
		boolean isRefer = as.researchRefer(researchState);
		
		mv.addObject("isRefer", isRefer);
		mv.setViewName("jsonView");
		return mv;
	}
	/**
	 * @Author      : Ungken
	 * @CreateDate  : 2020. 2. 1.
	 * @ModifyDate  : 2020. 2. 1.
	 * @Description : 리서치 반려 목록
	 */
	@RequestMapping("researchReferList.adminResearch")
	public String researchReferList(HttpServletRequest request, Model model) {
		String queryString = request.getQueryString();
		
		Map<String, List<String>> queryMap =  null;
		
		int currentPage = 1; 
		
		if(queryString != null) { 
			queryMap = Util.splitQuery(queryString);
			if(queryMap.containsKey("currentPage")) {
				currentPage = Integer.parseInt(queryMap.get("currentPage").get(0));
			}
		}
	  
		int listCount = 0;
		try {
			listCount = as.getListCountReferList();
			
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
			
			List<Map<String, String>> researchReferList = as.researchReferList(pi);
			
			model.addAttribute("researchReferList", researchReferList);
			model.addAttribute("pi", pi);
			return "researchReferList";
		} catch (SelectException e) {
			model.addAttribute("msg", e.getMessage());
			return "redirect:errorPage.me";
		}
	}
	
	/**
	 * @Author      : Ungken
	 * @CreateDate  : 2020. 2. 2.
	 * @ModifyDate  : 2020. 2. 2.
	 * @Description : 리서치 반려 상세 조회
	 */
	@PostMapping("researchReferDetail.adminResearch")
	public ModelAndView researchReferDetail(ModelAndView mv, String researchNoStr) {
		int researchNo = Integer.parseInt(researchNoStr);
		
		List<Map<String, Object>> researchDetail = as.researchReferDetail(researchNo);
		
		mv.addObject("researchDetail", researchDetail);
		mv.setViewName("jsonView");
		
		return mv;
	}
	
	
	/**
	 * @Author      : Ungken
	 * @CreateDate  : 2020. 2. 2.
	 * @ModifyDate  : 2020. 2. 2.
	 * @Description : 리서치 납부 대기 및 가격 협상 리스트
	 */
	@RequestMapping("researchWaitingPayment.adminResearch")
	public String researchWaitingPayment(HttpServletRequest request, Model model) {
		String queryString = request.getQueryString();
		
		Map<String, List<String>> queryMap =  null;
		
		int currentPage = 1; 
		
		if(queryString != null) { 
			queryMap = Util.splitQuery(queryString);
			if(queryMap.containsKey("currentPage")) {
				currentPage = Integer.parseInt(queryMap.get("currentPage").get(0));
			}
		}
	  
		int listCount = 0;
		try {
			listCount = as.getListResearchWaitingPayment();
			
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
			
			List<Map<String, String>> researchWaitingPayment = as.researchWaitingPayment(pi);
			
			model.addAttribute("researchWaitingPayment", researchWaitingPayment);
			model.addAttribute("pi", pi);
			return "researchWaitingPayment";
		} catch (SelectException e) {
			model.addAttribute("msg", e.getMessage());
			return "redirect:errorPage.me";
		}
	}
	
	/**
	 * @Author      : Ungken
	 * @CreateDate  : 2020. 2. 2.
	 * @ModifyDate  : 2020. 2. 2.
	 * @Description : 리서치 납부 대기 및 가격 협상 상세 보기
	 */
	@PostMapping("researchWaitPaymentDetail.adminResearch")
	public ModelAndView researchWaitPaymentDetail(ModelAndView mv, String researchNoStr) {
		int researchNo = Integer.parseInt(researchNoStr);
		
		List<Map<String, Object>> researchDetail = as.researchWaitPaymentDetail(researchNo);

		mv.addObject("researchDetail", researchDetail);
		mv.setViewName("jsonView");
		return mv;
	}
	
	/**
	 * @Author      : Ungken
	 * @CreateDate  : 2020. 2. 2.
	 * @ModifyDate  : 2020. 2. 2.
	 * @Description : 가격 협상 승인
	 */
	@PostMapping("researchPaymentApproved.adminResearch")
	public ModelAndView researchPaymentApproved(ModelAndView mv, String researchNoStr, String conferencePriceStr) {
		int researchNo = Integer.parseInt(researchNoStr);
		int conferencePrice = Integer.parseInt(conferencePriceStr);
		
		ResearchState researchState = new ResearchState();
		researchState.setResearchNo(researchNo);
		researchState.setPrice(conferencePrice);
		
		boolean isApproved = as.researchApproved(researchState);

		mv.addObject("isApproved", isApproved);
		mv.setViewName("jsonView");
		return mv;
	}
	
	/**
	 * @Author      : Ungken
	 * @CreateDate  : 2020. 2. 2.
	 * @ModifyDate  : 2020. 2. 2.
	 * @Description : 가격 협상 
	 */
	@PostMapping("researchPaymentRefer.adminResearch")
	public ModelAndView researchPaymentRefer(ModelAndView mv, String researchNoStr, String researchPriceStr, String referReason) {
		int researchNo = Integer.parseInt(researchNoStr);
		int researchPrice = Integer.parseInt(researchPriceStr);

		ResearchState researchState = new ResearchState();
		researchState.setResearchNo(researchNo);
		researchState.setPrice(researchPrice);
		researchState.setReferReason(referReason);
		
		boolean isRefer = as.researchPaymentRefer(researchState);
		
		mv.addObject("isRefer", isRefer);
		mv.setViewName("jsonView");
		return mv;
	}
	
	/**
	 * @Author      : Ungken
	 * @CreateDate  : 2020. 2. 3.
	 * @ModifyDate  : 2020. 2. 3.
	 * @Description : 결제 완료 이력
	 */
	@RequestMapping("researchConsultationCompleted.adminResearch")
	public String rResearchConsultationCompleted(Model model, HttpServletRequest request) {
		String queryString = request.getQueryString();
		
		Map<String, List<String>> queryMap =  null;
		
		int currentPage = 1; 
		
		if(queryString != null) { 
			queryMap = Util.splitQuery(queryString);
			if(queryMap.containsKey("currentPage")) {
				currentPage = Integer.parseInt(queryMap.get("currentPage").get(0));
			}
		}
	  
		int listCount = 0;
		try {
			listCount = as.getListCountPaymentCompletedList();
			
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
			
			List<Map<String, String>> paymentList = as.paymentCompletedList(pi);
			
			model.addAttribute("paymentList", paymentList);
			model.addAttribute("pi", pi);
			return"researchConsultationCompleted";
		} catch (SelectException e) {
			model.addAttribute("msg", e.getMessage());
			return "redirect:errorPage.me";
		}
		
	}
	
	/**
	 * @Author      : Ungken
	 * @CreateDate  : 2020. 2. 3.
	 * @ModifyDate  : 2020. 2. 3.
	 * @Description : 결제 이력 상세보기
	 */
	@PostMapping("billsDetail.adminResearch")
	public ModelAndView billsDetail(ModelAndView mv, String billingHistoryNoStr) {
		int billingHistoryNo = Integer.parseInt(billingHistoryNoStr);
		
		List<Map<String, String>> billsDetail = as.billsDetail(billingHistoryNo);
		
		mv.addObject("billsDetail", billsDetail);
		mv.setViewName("jsonView");
		return mv;
	}
	
	
	
	/**
	 * @Author      : Ungken
	 * @CreateDate  : 2020. 2. 3.
	 * @ModifyDate  : 2020. 2. 3.
	 * @Description : 리서치 재구성 대기 목록
	 */
	@RequestMapping("surveyReconstructionList.adminResearch")
	public String surveyReconstructionList(Model model, HttpServletRequest request) {
		String queryString = request.getQueryString();
		
		Map<String, List<String>> queryMap =  null;
		
		int currentPage = 1; 
		
		if(queryString != null) { 
			queryMap = Util.splitQuery(queryString);
			if(queryMap.containsKey("currentPage")) {
				currentPage = Integer.parseInt(queryMap.get("currentPage").get(0));
			}
		}
	  
		int listCount = 0;
		try {
			listCount = as.getListCountSurveyReconstructionList();
			
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
			
			List<Map<String, String>> surveyReconstructionList = as.surveyReconstructionList(pi);
			
			model.addAttribute("surveyReconstructionList", surveyReconstructionList);
			model.addAttribute("pi", pi);
			return "surveyReconstructionList";
		} catch (SelectException e) {
			model.addAttribute("msg", e.getMessage());
			return "redirect:errorPage.me";
		}
		
	}
	
	/**
	 * @Author      : Ungken
	 * @CreateDate  : 2020. 2. 4.
	 * @ModifyDate  : 2020. 2. 4.
	 * @Description : 리서치 문항 재구성
	 */
	@PostMapping("researchReconstruction.adminResearch")
	public ModelAndView researchReconstruction(ModelAndView mv, String[] discriminationQuestionOrder, String[] surveyQuizTitle, 
			String[] discriminationChoiceOrder, String[] choiceInput, String[] correctAnswer, 
			String researchNoStr, String[] questionOrder, String[] rquestionContext, String researchNamePanel) {
		Research research = new Research();
		research.setResearchName(researchNamePanel); // 패널에게 보여질 제목
		research.setResearchNo(Integer.parseInt(researchNoStr));
		// 기존 문항 내용 업데이트를 위한 ArrayList
		ArrayList<ResearchQuestion> questionList = new ArrayList<>();
		for(int i = 0; i < questionOrder.length; i++) {
			ResearchQuestion researchQuestion = new ResearchQuestion();
			researchQuestion.setQuestionOrder(Integer.parseInt(questionOrder[i]));
			researchQuestion.setRquestionContext(rquestionContext[i]);
			researchQuestion.setResearchNo(Integer.parseInt(researchNoStr));
			questionList.add(researchQuestion);
		}
		
		// 조사 대상자 판별 퀴즈를 위한 ArrayList
		ArrayList<ResearchQuestion> discriminationQuestionList = new ArrayList<>();
		int choiceIndex = 0;
		
		for(int i = 0; i < discriminationQuestionOrder.length; i++) {
			ArrayList<ResearchChoice> discriminationChoiceList = new ArrayList<>();
			ResearchQuestion researchQuestion = new ResearchQuestion();
			researchQuestion.setQuestionOrder(Integer.parseInt(discriminationQuestionOrder[i]));
			researchQuestion.setRquestionContext(surveyQuizTitle[i]);
			researchQuestion.setQuestionFormNo(Integer.parseInt(correctAnswer[i])); // 정답 보기를 넣기 위해 임의로..
			researchQuestion.setResearchNo(Integer.parseInt(researchNoStr));
			
			for(int j = choiceIndex; j < discriminationChoiceOrder.length; j++) {
				ResearchChoice researchChoice = new ResearchChoice();
				researchChoice.setChoiceOrder(Integer.parseInt(discriminationChoiceOrder[j]));
				researchChoice.setChoiceContext(choiceInput[j]);
				
				discriminationChoiceList.add(researchChoice);
				if(j != discriminationChoiceOrder.length - 1) {
					if(Integer.parseInt(discriminationChoiceOrder[j + 1]) == 1) {
						choiceIndex = j + 1;
						break;
					}
				}
			}
			researchQuestion.setRequestChoiceList(discriminationChoiceList);
			discriminationQuestionList.add(researchQuestion);
		}
		research.setQuestionList(discriminationQuestionList);
		
		boolean isReconstruction = as.reconstruction(research, questionList);
		
		mv.addObject("isReconstruction", isReconstruction);
		mv.setViewName("jsonView");
		return mv;
	}
	
	/**
	 * @Author      : Ungken
	 * @CreateDate  : 2020. 2. 4.
	 * @ModifyDate  : 2020. 2. 4.
	 * @Description : 리서치 문항 재구성 상세
	 */
	@PostMapping("researchWaitingReviewDetail.adminResearch")
	public ModelAndView researchWaitingReviewDetail(ModelAndView mv, String researchNoStr) {
		int researchNo = Integer.parseInt(researchNoStr);
		
		List<Map<String, Object>> researchDetail = as.researchApprovalDetail(researchNo);
		
		List<Map<String, Object>> DiscriminationDetail = as.discriminationDetail(researchNo);
		
		mv.addObject("DiscriminationDetail", DiscriminationDetail);
		mv.addObject("researchDetail", researchDetail);
		mv.setViewName("jsonView");
		
		return mv;
	}
	
	@PostMapping("reconstructureRefer.adminResearch")
	public ModelAndView reconstructureRefer(ModelAndView mv, String researchNoStr, String referReason) {
		int researchNo = Integer.parseInt(researchNoStr);
		ResearchState researchState = new ResearchState();
		researchState.setResearchNo(researchNo);
		researchState.setReferReason(referReason);
		
		boolean isRefer = as.reconstructureRefer(researchState);
		
		mv.addObject("isRefer", isRefer);
		mv.setViewName("jsonView");
		return mv;
	}
	
	//타입안정해서
	@RequestMapping("tsQaManagement.adminResearch")
	public String tsQaManagement(Model model) {
		List<Object> r = as.tsQaManagement();
		System.out.println(r);
		model.addAttribute("research", r);		
		return "tsQaManagement";
	}
	
	@PostMapping("tsQaManagementUpdate.adminResearch")
	public ModelAndView tsQaManagementUpdate(ModelAndView mv, @RequestParam(value="questionOrderArr") String[] questionOrderArr, @RequestParam(value="choiceOrderArr") String[] choiceOrderArr, @RequestParam(value="questionTitleArr") String[] questionTitleArr, @RequestParam(value="choiceTitleArr") String[] choiceTitleArr, @RequestParam(value="questionFormArr") String[] questionFormArr,String[] questionNo) {
		
		int choiceIndex = 0;
		ArrayList<ResearchQuestion> questionList = new ArrayList<>();
		
		for(int i = 0; i < questionOrderArr.length; i++) {
			ResearchQuestion researchQuestion = new ResearchQuestion();
			researchQuestion.setQuestionOrder(Integer.parseInt(questionOrderArr[i]));
			researchQuestion.setRquestionContext(questionTitleArr[i]);
			researchQuestion.setQuestionFormNo(Integer.parseInt(questionFormArr[i]));
			researchQuestion.setQuestionNo(Integer.parseInt(questionNo[i])); //추가20.02.13			
			if(Integer.parseInt(questionFormArr[i]) == 1) {
				ArrayList<ResearchChoice> choiceList = new ArrayList<>();
				
				for(int j = choiceIndex; j < choiceOrderArr.length; j++) {
					ResearchChoice researchChoice = new ResearchChoice();
					researchChoice.setChoiceOrder(Integer.parseInt(choiceOrderArr[j]));
					researchChoice.setChoiceContext(choiceTitleArr[j]);
					
					choiceList.add(researchChoice);
					if(j != choiceOrderArr.length - 1) {
						if(Integer.parseInt(choiceOrderArr[j + 1]) == 1) {
							choiceIndex = j + 1;
							break;
						}
					}
				}
				researchQuestion.setRequestChoiceList(choiceList);	
			}
			questionList.add(researchQuestion);
		}
		
		System.out.println("controller");
		
		int result =as.tsQaManagementUpdate(questionList);
		mv.addObject("result",result);
		mv.setViewName("jsonView");
		return mv;
	}
	
	@PostMapping("researchTargetMailing.adminResearch")
	public ModelAndView researchTargetMailing(ModelAndView mv, int researchNo) {
//		ResearchTarget target = as.researchTargetMailing(researchNo);
		Boolean result;
		try {
			result = as.researchTargetMailing(researchNo);
			System.out.println(result);
			mv.addObject("result", result);
		} catch (ResearchException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
//		System.out.println(target);
		mv.setViewName("jsonView");
		return mv;
	}
	
	@RequestMapping("groupMailingWaitingList.admin")
	public String forwardGroupMailingWaitingList(HttpServletRequest request, Model model) {
		// Post로 보낸걸 queryString이라고 한다
		String queryString = request.getQueryString();
		// 그걸 쪼개기 작업하기
		Map<String, List<String>> queryMap = null;
		int currentPage = 1;
		String researchName = "";
		MailingList list = new MailingList();
		if (queryString != null) {
			queryMap = Util.splitQuery(queryString);
			if (queryMap.containsKey("currentPage")) {
				currentPage = Integer.parseInt(queryMap.get("currentPage").get(0));
			}
			if (queryMap.containsKey("researchName")) {
				researchName = queryMap.get("inquiryTitle").get(0);
				list.setResearchName(researchName);
			}
		}
		
		int listCount = 0;
		
		listCount = as.getListCountMailingList(list);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		list.setPi(pi);
		List<MailingList> mailingList = as.selectMailingList(list);
		model.addAttribute("mailingList", mailingList);
		model.addAttribute("pi", pi);
		return "adminResearch/groupMailingWaitingList";
  }
	
	/**
	 * @Author      : hjheo
	 * @CreateDate  : 2020. 2. 6.
	 * @ModifyDate  : 2020. 2. 6.
	 * @Description : pc환경조사 audio
	 */
	@PostMapping("uploadFile.adminResearch")
	public ModelAndView uploadAudio(HttpServletRequest request, ModelAndView mv, MultipartFile file) {
		String root = request.getSession().getServletContext().getRealPath("resources"); //루트
		String savePath = root + "\\uploadFiles"; //저장경로
		
		String originFileName = file.getOriginalFilename(); //파일 원본이름가져오기
		String ext = originFileName.substring(originFileName.lastIndexOf(".")); //확장자
		String saveFile = OperaFileNamePolicy.getRandomString() + ext; //랜덤이름+확장자
	
		UploadFile ufo =new UploadFile();  //업로드 파일 객체 생성
		
		ufo.setChangeName(saveFile); //change이름 넣기
		ufo.setOriginName(originFileName); //오리지널 이름 넣기
		ufo.setFilePath(savePath); //파일 경로 넣기
		
		int result = 0;
		result = as.uploadAudio(ufo);
		
		try { 
			file.transferTo(new File(savePath + "\\" + saveFile)); 
		} catch(IllegalStateException | IOException e) { 
			e.printStackTrace(); 
		}
		 
		mv.addObject("ufo", ufo);
		mv.setViewName("jsonView");
		return mv;
	}
	
	@PostMapping("uploadFileReport.adminResearch")
	public ModelAndView uploadReport(HttpServletRequest request, ModelAndView mv, MultipartFile file) {
		String root = request.getSession().getServletContext().getRealPath("resources"); //루트
		String savePath = root + "\\uploadFiles"; //저장경로
		
		String originFileName = file.getOriginalFilename(); //파일 원본이름가져오기
		String ext = originFileName.substring(originFileName.lastIndexOf(".")); //확장자
		String saveFile = OperaFileNamePolicy.getRandomString() + ext; //랜덤이름+확장자
		UploadFile ufo =new UploadFile();  //업로드 파일 객체 생성
		ufo.setChangeName(saveFile); //change이름 넣기
		ufo.setOriginName(originFileName); //오리지널 이름 넣기
		ufo.setFilePath(savePath); //파일 경로 넣기
		
		int result =0;
		result = as.uploadReport(ufo);
		
		try { 
			file.transferTo(new File(savePath + "\\" + saveFile)); 
		} catch(IllegalStateException | IOException e) { 
			e.printStackTrace(); 
		}
		
		mv.addObject("ufo", ufo);
		mv.setViewName("jsonView");
		return mv;
	}
	
	/**
	 * @Author      : hjheo
	 * @CreateDate  : 2020. 2. 10.
	 * @ModifyDate  : 2020. 2. 10.
	 * @Description : pc환경조사_오디오ver저장
	 */
	@PostMapping("audioEnviron.adminResearch")
	public ModelAndView audioEnviron(ModelAndView mv, @RequestParam(value="questionTitle") String questionTitle,@RequestParam(value="choiceTitleArr") String [] choiceTitleArr,@RequestParam(value="choiceOrderArr") String[] choiceOrderArr ,@RequestParam(value="titleContext") String titleContext,@RequestParam(value="questionFormNo") String questionFormNo) {
		//questionTitle,choicetitle
		System.out.println(questionTitle);
		for(int i = 0; i < choiceOrderArr.length; i++) {
			System.out.println(choiceOrderArr[i]);
		}
		for(int i = 0; i < choiceTitleArr.length; i++) {
			System.out.println(choiceTitleArr[i]);
		}
		
		
		//1.이거로 해서 delete부터
	   int result =as.audioEnviron(questionTitle,choiceTitleArr,choiceOrderArr,titleContext,questionFormNo);  
		
	   System.out.println("questionTitle"+questionTitle);
	   System.out.println("titleContext:"+titleContext);
		mv.addObject("result",result);
		mv.setViewName("jsonView");
		
		return mv;
	}
	
	/**
	 * @Author      : hjheo
	 * @CreateDate  : 2020. 2. 11.
	 * @ModifyDate  : 2020. 2. 11.
	 * @Description : 이거는 pc환경조사 select
	 */
	@RequestMapping("pcQaManagement.adminResearch")
	public String pcQaManagement(Model model) {
		ResearchQuestion question = as.pcQaManagement();
				System.out.println(question);
		//초이스리스트는 컬렉션으로		
		model.addAttribute("pcQa", question);
		return "pcQaManagement";
	}
	
	@PostMapping("video.adminResearch")
	public ModelAndView videoInsert(HttpServletRequest request,ModelAndView mv, String questionTitle,String [] choiceTitleArr,String[] choiceOrderArr,String titleContext, String questionFormNo,String videoAdress ) {
		for(int i = 0; i < choiceOrderArr.length; i++) {
			System.out.println(choiceOrderArr[i]);
		}
		for(int i = 0; i < choiceTitleArr.length; i++) {
			System.out.println(choiceTitleArr[i]);
		}
		String videoLink = (videoAdress.replace("https://", "")).replace("http://", "");
		
		System.out.println(videoLink);
		
		int result =as.videoInsert(questionTitle,choiceTitleArr,choiceOrderArr,titleContext,questionFormNo,videoLink);
		
	
		System.out.println("result:"+result);
		System.out.println("videoLink"+videoLink);
		
		
		
		mv.setViewName("jsonView");
		return mv;
	}
	
	@PostMapping("selectResearchGraph.adminResearch")
	public ModelAndView selectResearchGraph(ModelAndView mv, int researchNo) {
		ResearchGraphTemp temp = null;
		Gson gson = new Gson();
		List<RquestionNo> rquestionNoList = as.selectRquestionNoList(researchNo);		//문제번호 불러오는 리스트
		String[] jsonArr = new String[rquestionNoList.size()];
		String testJson = null;
		for(int i = 0; i < rquestionNoList.size(); i++) {
			temp = new ResearchGraphTemp();
			temp.setResearchNo(researchNo);
			temp.setRquestionNo(rquestionNoList.get(i).getRquestionNo());
			List<ResearchGraphTemp2> countList = as.selectResearchHistoryCountList(temp);
			jsonArr[i] = gson.toJson(countList);
			
		}
		testJson = gson.toJson(jsonArr);
		mv.addObject("jsonArr", jsonArr);
		mv.addObject("");
		mv.addObject("questionCount", rquestionNoList.size());
		mv.setViewName("jsonView");
		return mv;
	}
	
	/**
	 * @Author      : yhj
	 * @CreateDate  : 2020. 2. 13.
	 * @ModifyDate  : 2020. 2. 13.
	 * @Description : 리서치 보고서 작성 대기 관리 - 통계처리
	 */
	@RequestMapping("researchReportStandbyList.admin")
	public String forwardResearchReportStandbyList(Model model) {
		List<ResearchReport> researchReportList = as.selectResearchReportList();
		model.addAttribute("researchReportList", researchReportList);
		return "adminResearch/researchReportStandbyList";
	}
	
	/**
	 * @Author      : yhj
	 * @CreateDate  : 2020. 2. 13.
	 * @ModifyDate  : 2020. 2. 13.
	 * @Description : 리서치 보고서 작성 대기 관리 - 보고서 작성
	 */
	@RequestMapping("researchReportWriteList.admin")
	public String forwardResearchReportWriteList(Model model) {
		List<ResearchReport> researchReportList = as.selectResearchReportList();
		model.addAttribute("researchReportList", researchReportList);
		return "adminResearch/researchReportWriteList";
	}
	
	/**
	 * @Author      : yhj
	 * @CreateDate  : 2020. 2. 13.
	 * @ModifyDate  : 2020. 2. 13.
	 * @Description : 리서치 보고서 작성 대기 관리 - 결과전송
	 */
	@RequestMapping("researchReportSendList.admin")
	public String forwardResearchReportSendList(Model model) {
		List<ResearchReport> researchReportList = as.selectResearchReportList();
		model.addAttribute("researchReportList", researchReportList);
		return "adminResearch/researchReportSendList";
	}
	
	/**
	 * @Author      : yhj
	 * @CreateDate  : 2020. 2. 12.
	 * @ModifyDate  : 2020. 2. 12.
	 * @Description : 해당 리서치 문제랑 통계자로 보는 ajax
	 */
	@PostMapping("selectResearchDetail.adminResearch")
	public ModelAndView selectResearchDetail(ModelAndView mv, int researchNo) {
		List<Question> question = as.selectQuestionList(researchNo);
		String[] jsonArr = new String[question.size()];
		String[] jsonChoiceArr = new String[question.size()];
		Gson gson = new Gson();
		ResearchGraphTemp temp = null;
		for(int i = 0; i < question.size(); i++) {
			temp = new ResearchGraphTemp();
			temp.setResearchNo(researchNo);
			temp.setRquestionNo(question.get(i).getRquestionNo());
			List<ResearchGraphTemp2> countList = as.selectResearchHistoryCountList(temp);
			List<Choice> choiceList = as.selectChoiceList(question.get(i).getRquestionNo());
			jsonArr[i] = gson.toJson(countList);
			jsonChoiceArr[i] = gson.toJson(choiceList);
		}
		mv.addObject("question", question);
		mv.addObject("jsonArr", jsonArr);
		mv.addObject("jsonChoiceArr", jsonChoiceArr);
		mv.setViewName("jsonView");
		return mv;
	}
	
	@PostMapping("selectResearchOne.adminResearch")
	public ModelAndView selectResearchOne(ModelAndView mv, int researchNo) {
		ResearchOne r = as.selectResearchOne(researchNo);
		System.out.println(r);
		mv.addObject("r", r);
		mv.setViewName("jsonView");
		return mv;
	}
	
	
	@RequestMapping("disposalResponseManagement.adminResearch")
	public String disposalResponseManagement(Model model, HttpServletRequest request) {
		String queryString = request.getQueryString();
		
		Map<String, List<String>> queryMap =  null;
		
		int currentPage = 1; 
		
		if(queryString != null) { 
			queryMap = Util.splitQuery(queryString);
			if(queryMap.containsKey("currentPage")) {
				currentPage = Integer.parseInt(queryMap.get("currentPage").get(0));
			}
		}
	  
		int listCount = 0;
		try {
			listCount = as.getListCountdisposalResponseList();
			
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
			
			List<Map<String, String>> disposalResponseList = as.disposalResponseList(pi);
			
			model.addAttribute("disposalResponseList", disposalResponseList);
			model.addAttribute("pi", pi);
			return "disposalResponseManagement";
		} catch (SelectException e) {
			model.addAttribute("msg", e.getMessage());
			return "redirect:errorPage.me";
		}
	}
	@PostMapping("researchReportMailing.adminResearch")
	public ModelAndView researchReportMailing(ModelAndView mv, int researchNo) {
		InetAddress inet;
		String svrIp = "";
		try {
			inet = InetAddress.getLocalHost();
			svrIp = inet.getHostAddress();
		} catch (UnknownHostException e1) {
			e1.printStackTrace();
		}
		int memberMno = as.selectResearchOne(researchNo).getMno();
		AllMember m;
		try {
			m = as.selectMember(memberMno);
			
			//메일 전송 부분 시작
			String setfrom = "yychani94@gmail.com";         
		    String tomail  = m.getUserEmail();    // 받는 사람 이메일
		    String title   = "리서치 완료되었습니다.";      // 제목
//		    String content = "test이메일입니다. 리서치 하세요";
		    String content = "<form action='http://" + svrIp + ":8001/survway/panelLogin.panel' method='GET'> "
					+ "<p> 안녕하세요, 서브웨이입니다. <br> 회원님께서 요청하신 리서치에 대한 결과가 나왔습니다. 확인바랍니다. </p> "
//					+ "<input type='hidden' name='userId' value='" + pm.getUserId() + "'>"
					+ "<button type='submit' style='width: 370px; cursor: pointer; height: 70px; border: 0;  background: #00679A; color: white; font-size: 20pt; margin-top: 10px;'>결과 확인하기</button>"
				+ " </form>";    // 내용
		   
		    try {
				MimeMessage message = mailSender.createMimeMessage();
				MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
				 
				messageHelper.setFrom(setfrom);  // 보내는사람 생략하거나 하면 정상작동을 안함
				messageHelper.setTo(tomail);     // 받는사람 이메일
				messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
				messageHelper.setText(content);  // 메일 내용

				String contents = "<img src=\"cid:logo\" style='width: 420px;'>" + content; 
				messageHelper.setText(contents, true); 
				
				FileSystemResource file = new FileSystemResource(new File("C:\\images\\survwayLogo.png")); 
				messageHelper.addInline("logo", file);

				mailSender.send(message);
				mv.addObject("result", true);
		    } catch(Exception e){
		      System.out.println(e);
		      mv.addObject("result", false);
		    }
			//메일 전송 부분 끝
			mv.setViewName("jsonView");
			
		} catch (SelectException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		return mv;
	}
	
}
