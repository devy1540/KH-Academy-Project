package com.opera.survway.corporation.controller;

import com.opera.survway.admin.model.exception.ResearchException;
import com.opera.survway.common.model.vo.*;
import com.opera.survway.corporation.model.service.CorpService;
import com.opera.survway.corporation.model.vo.*;
import com.opera.survway.exception.SelectException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Controller
public class CorpResearchController {
	@Autowired
	private CorpService cs;
	
	/**
	 * @Author      : Ungken
	 * @CreateDate  : 2020. 1. 29.
	 * @ModifyDate  : 2020. 1. 29.
	 * @Description : 기업 리서치 기본 정보 fowarding
	 */
	@PostMapping("requestResearch.corpResearch")
	public String requestResearch(Research research, String targetAgeRangeAmount, String mno, String companyNo, String startDate, String endDate, Model model) {
		String startDateSplit= startDate.split("-")[0] + startDate.split("-")[1] + startDate.split("-")[2];
		String endDateSplit= endDate.split("-")[0] + endDate.split("-")[1] + endDate.split("-")[2];
		
		research.setResearchPeriod(startDateSplit + "~" + endDateSplit);
		research.setMno(Integer.parseInt(companyNo));
		
		if(research.getTargetAgeRange().equals("config")) {
			research.setTargetAgeRange(targetAgeRangeAmount);
		}
		if(research.getAdditionaltEtc().equals("")) {
			research.setAdditionaltEtc(null);
		}
		
		model.addAttribute("research", research);
		return "writeQuestion";
	}
	
	/**
	 * @Author      : Ungken
	 * @CreateDate  : 2020. 1. 29.
	 * @ModifyDate  : 2020. 1. 29.
	 * @Description : 기업 리서치 정보 문항 작성
	 */
	@PostMapping("insertResearch.corpResearch")
	public String insertResearch(HttpServletRequest request, Research research, String[] questionFormNo, String[] rquestionContext, MultipartFile[] uploadImage, @RequestParam("imageChoiceUpload") MultipartFile[] imageChoiceUpload, String[] mediaExist, String[] questionVideoLink, String[] mediaExplain, String[] questionOrder, String[] choiceContext, String[] choiceNo, Model model) {
		System.out.println(research);
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\uploadFiles";
		
		ArrayList<String> saveFiles = new ArrayList<>();
		ArrayList<String> originFiles = new ArrayList<>();
		ArrayList<String> exts = new ArrayList<>();
		
		ArrayList<String> choiceSaveFiles = new ArrayList<>();
		ArrayList<String> choiceOriginFiles = new ArrayList<>();
		ArrayList<String> choiceExts = new ArrayList<>();
		
 		for(MultipartFile file : uploadImage) {
 			String originFileName = file.getOriginalFilename();
 			String ext = originFileName.substring(originFileName.lastIndexOf("."));
 			String saveFile = OperaFileNamePolicy.getRandomString() + ext;
			saveFiles.add(saveFile);
			originFiles.add(originFileName);
			exts.add(ext);
			try {
				file.transferTo(new File(savePath + "\\" + saveFile));
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
		}
 		
 		for(MultipartFile file : imageChoiceUpload) {
 			String originFileName = file.getOriginalFilename();
 			String ext = originFileName.substring(originFileName.lastIndexOf("."));
 			String saveFile = OperaFileNamePolicy.getRandomString() + ext;
 			choiceSaveFiles.add(saveFile);
 			choiceOriginFiles.add(originFileName);
 			choiceExts.add(ext);
			try {
				file.transferTo(new File(savePath + "\\" + saveFile));
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
		}
 		
 		int uploadFileIndex = 0;
 		int uploadChoiceFileIndex = 0;
 		
 		ArrayList<UploadFile> uploadFiles = new ArrayList<>();
 		
		int mediaIndex = 0;
		int videoIndex = 0;
		int choiceIndex = 0;
		
		ArrayList<ResearchQuestion> questionList = new ArrayList<>();
		
		for(int i = 0; i < questionOrder.length; i++) {
			ArrayList<ResearchChoice> choiceList = new ArrayList<>();
			
			ResearchQuestion researchQuestion = new ResearchQuestion();
			researchQuestion.setRquestionContext(rquestionContext[i]);
			researchQuestion.setQuestionOrder(Integer.parseInt(questionOrder[i]));
			researchQuestion.setQuestionFormNo(Integer.parseInt(questionFormNo[i]));
			researchQuestion.setMediaExist(mediaExist[i]);
			if(!mediaExist[i].equals("false")) {
				researchQuestion.setMediaExplain(mediaExplain[mediaIndex++]);
				if(mediaExist[i].equals("image")) {
					
					UploadFile uploadfile = new UploadFile();
					uploadfile.setFilePath(savePath);
					uploadfile.setOriginName(originFiles.get(uploadFileIndex));
					uploadfile.setChangeName(saveFiles.get(uploadFileIndex++));
					uploadfile.setFileType("리서치 문항");
					uploadfile.setRquestionNo(Integer.parseInt(questionOrder[i])); //나중에 select키로 문항에 대한 시퀀스 가져와야함
					uploadFiles.add(uploadfile);
					
				}else if(mediaExist[i].equals("video")) {
					String videoLink = (questionVideoLink[videoIndex++].replace("https://", "")).replace("http://", "");
					researchQuestion.setQuestionVideoLink(videoLink);
				}
			}
			if(Integer.parseInt(questionFormNo[i]) != 2 && Integer.parseInt(questionFormNo[i]) != 4){
				
				for(int j = choiceIndex; j < choiceNo.length; j++) {
					ResearchChoice researchChoice = new ResearchChoice();
					researchChoice.setChoiceOrder(Integer.parseInt(choiceNo[j]));
					researchChoice.setChoiceContext(choiceContext[j]);

					choiceList.add(researchChoice);
					if(Integer.parseInt(questionFormNo[i]) == 3) {
						UploadFile uploadfile = new UploadFile();
						uploadfile.setFilePath(savePath);
						uploadfile.setOriginName(choiceOriginFiles.get(uploadChoiceFileIndex));
						uploadfile.setChangeName(choiceSaveFiles.get(uploadChoiceFileIndex++));
						uploadfile.setFileType("리서치 보기");
						uploadfile.setRchoiceNo(researchChoice.getChoiceOrder()); //나중에 select키로 문항에 대한 시퀀스 가져와야함
						uploadFiles.add(uploadfile);
					}
					if(j != choiceNo.length - 1) {
						if(Integer.parseInt(choiceNo[j + 1]) == 1) {
							choiceIndex = j + 1;
							break;
						}
					}
				}
			}
			researchQuestion.setRequestChoiceList(choiceList);
			questionList.add(researchQuestion);
		}
		
		try {
			cs.insertResearch(research, questionList, uploadFiles);
			
			model.addAttribute("message", "researchComplete");
			return "redirect:corpModal.corp";
		} catch (ResearchException e) {
			model.addAttribute("msg", e.getMessage());
			return "redirect:errorPage.me";
		}
		
	}
	
	
	/**
	 * @Author      : Ungken
	 * @CreateDate  : 2020. 1. 30.
	 * @ModifyDate  : 2020. 1. 30.
	 * @Description : 리서치 이력
	 */
	@RequestMapping("previousResearchMain.corpResearch")
	public String previousResearch(HttpServletRequest request, Model model) {
		String queryString = request.getQueryString();
		
		Map<String, List<String>> queryMap =  null;
		
		int currentPage = 1; 
		String researchState = "";
		String researchName = "";
		SearchResearch searchResearch = new SearchResearch();
		if(queryString != null) { 
			queryMap = Util.splitQuery(queryString);
			if(queryMap.containsKey("currentPage")) {
				currentPage = Integer.parseInt(queryMap.get("currentPage").get(0));
			}
			if(queryMap.containsKey("researchState")) {
				researchState = queryMap.get("researchState").get(0);
				String[] stateArr = researchState.split(",");
				searchResearch.setResearchState(stateArr);
			}
			if(queryMap.containsKey("researchName")) {
				researchName = queryMap.get("researchName").get(0);
				searchResearch.setResearchName(researchName);
			}
		}
		int listCount = 0;

		try {
			searchResearch.setMno(((CorpMember)request.getSession().getAttribute("loginUser")).getMno());
			listCount = cs.getListCountResearch(searchResearch);
			
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
			
			searchResearch.setPi(pi);
			
			List<Research> researchList = cs.previousResearch(searchResearch);
			for(int i = 0; i < researchList.size(); i++) {
				String[] beforPeriod = researchList.get(i).getResearchPeriod().split("~");
				researchList.get(i).setAdditionaltEtc(beforPeriod[0].substring(0, 4) + "-" + beforPeriod[0].substring(4, 6) + "-" + beforPeriod[0].substring(6, 8));
				researchList.get(i).setResearchPeriod(beforPeriod[1].substring(0, 4) + "-" + beforPeriod[1].substring(4, 6) + "-" + beforPeriod[1].substring(6, 8));
			}
			
			model.addAttribute("researchList", researchList);
			model.addAttribute("pi", pi);
			
			return "previousResearchMain";
		} catch (SelectException e) {
			model.addAttribute("msg", e.getMessage());
			return "redirect:errorPage.me";
		}
	}
	/**
	 * @Author      : Ungken
	 * @CreateDate  : 2020. 2. 2.
	 * @ModifyDate  : 2020. 2. 2.
	 * @Description : 리서치 이력 상세
	 */
	@RequestMapping("previousResearchDetail.corpResearch")
	public String previousResearchDetail(Model model, String researchNo) {

		try {
			Research research = cs.previousResearchDetail(Integer.parseInt(researchNo));
			
			
			String[] beforPeriod = research.getResearchPeriod().split("~");
			research.setResearchPeriod(beforPeriod[0].substring(0, 4) + "-" + beforPeriod[0].substring(4, 6) + "-" + beforPeriod[0].substring(6, 8) + " ~ " + beforPeriod[1].substring(0, 4) + "-" + beforPeriod[1].substring(4, 6) + "-" + beforPeriod[1].substring(6, 8));
			
			int questionCount = cs.getQuestionCount(research.getResearchNo());
			
			model.addAttribute("research", research);
			model.addAttribute("questionCount", questionCount);
			return "previousResearchDetail";
			
		} catch (NumberFormatException e) {
			model.addAttribute("msg", "리서치 조회 실패");
			return "redirect:errorPage.me";
		} catch (SelectException e) {
			model.addAttribute("msg", e.getMessage());
			return "redirect:errorPage.me";
		}
	}
	
	/**
	 * @Author      : Ungken
	 * @CreateDate  : 2020. 2. 2.
	 * @ModifyDate  : 2020. 2. 2.
	 * @Description : 리서치 가격 협의
	 */
	@PostMapping("priceConference.corpResearch")
	public ModelAndView priceConference(ModelAndView mv, String researchNoStr, String priceStr) {
		int researchNo = Integer.parseInt(researchNoStr);
		int price = Integer.parseInt(priceStr);
		
		ResearchState researchstate = new ResearchState();
		researchstate.setResearchNo(researchNo);
		researchstate.setPrice(price);
		
		boolean isConference = cs.priceConference(researchstate);
		
		mv.addObject("isConference", isConference);
		mv.setViewName("jsonView");
		return mv;
	}
	
	/**
	 * @Author      : Ungken
	 * @CreateDate  : 2020. 2. 2.
	 * @ModifyDate  : 2020. 2. 2.
	 * @Description : 리서치 결제
	 */
	@PostMapping("researchPayment.corpResearch")
	public ModelAndView researchPayment(ModelAndView mv, String paymentReason, String paymentAmountStr, String paymentDateStr, String mnoStr, String researchNoStr) {
		int researchNo = Integer.parseInt(researchNoStr);
		int paymentAmount = Integer.parseInt(paymentAmountStr);
		int mno = Integer.parseInt(mnoStr);
		
		Date paymentDate = Date.valueOf(paymentDateStr);
		
		Payment payment = new Payment();
		payment.setMno(mno);
		payment.setPaymentAmount(paymentAmount);
		payment.setPaymentDate(paymentDate);
		payment.setPaymentReason(paymentReason);
		payment.setResearchNo(researchNo);
		
		System.out.println(payment);
		
		boolean isPayment = cs.researchPayment(payment);
		
		mv.addObject("isPayment", isPayment);
		mv.setViewName("jsonView");
		return mv;
	}
	
	/**
	 * @Author      : Ungken
	 * @CreateDate  : 2020. 2. 5.
	 * @ModifyDate  : 2020. 2. 5.
	 * @Description : 리서치 재구성 협의
	 */
	@PostMapping("recontructionConference.corpResearch")
	public ModelAndView recontructionConference(ModelAndView mv, String researchNoStr, String conferenceContext) {
		int researchNo = Integer.parseInt(researchNoStr);
		
		ResearchState researchState = new ResearchState();
		researchState.setReferReason(conferenceContext);
		researchState.setResearchNo(researchNo);
		
		boolean isConference = cs.recontructionConference(researchState);
		
		mv.setViewName("jsonView");
		return mv;
	}
	
	@PostMapping("recontructionApproved.corpResearch")
	public ModelAndView recontructionApproved(ModelAndView mv, String researchNoStr) {
		int researchNo = Integer.parseInt(researchNoStr);
		
		boolean isApproved = cs.recontructionApproved(researchNo);
		
		mv.addObject(isApproved);
		mv.setViewName("jsonView");
		return mv;
	}
}
