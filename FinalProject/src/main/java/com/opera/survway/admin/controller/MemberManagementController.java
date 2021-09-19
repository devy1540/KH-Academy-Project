package com.opera.survway.admin.controller;


import com.opera.survway.admin.model.service.AdminService;
import com.opera.survway.admin.model.vo.PanelThanksSurvey;
import com.opera.survway.admin.model.vo.SearchMember;
import com.opera.survway.common.model.vo.AllMember;
import com.opera.survway.common.model.vo.PageInfo;
import com.opera.survway.common.model.vo.Pagination;
import com.opera.survway.common.model.vo.Util;
import com.opera.survway.exception.SelectException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

@Controller
public class MemberManagementController {
	
	@Autowired
	private AdminService as;
	@Autowired
	private JavaMailSender mailSender; // Mail Sender
	
	/**
	 * @Author      : Ungken
	 * @CreateDate  : 2020. 1. 23.
	 * @ModifyDate  : 2020. 1. 24.
	 * @Description : 회원 전체 조회 & 검색
	 */
	@RequestMapping("memberInfoManagement.memberManagement") 
	public String selectPanelInfoManagement(HttpServletRequest request, Model model) {
		
		String queryString = request.getQueryString();
		
		Map<String, List<String>> queryMap =  null;
		
		int currentPage = 1; 
		String userType = "";
		String panelLevel = "";
		String searchInput = "";
		
		SearchMember searchMember = new SearchMember();
		
		if(queryString != null) { 
			queryMap = Util.splitQuery(queryString);

			if(queryMap.containsKey("currentPage")) {
				currentPage = Integer.parseInt(queryMap.get("currentPage").get(0));
			}
			if(queryMap.containsKey("userType")) {
				userType = queryMap.get("userType").get(0);
				searchMember.setUserType(userType);
			}
			if(queryMap.containsKey("panelLevel")) {
				panelLevel = queryMap.get("panelLevel").get(0);
				searchMember.setPanelLevel(panelLevel);
			}
			if(queryMap.containsKey("searchInput")) {
				searchInput = queryMap.get("searchInput").get(0);
				searchMember.setSearchInput(searchInput);
			}
		}
	  
		int listCount = 0;
		try {
			listCount = as.getListCountPanel(searchMember);
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
			
			searchMember.setPi(pi);
			
			List<AllMember> memberList = as.memberInfoManagement(searchMember); 
			model.addAttribute("memberList", memberList);
			model.addAttribute("pi", pi);
			
			return "memberInfoManagement";
			
		} catch (SelectException e) {
			model.addAttribute("msg", e.getMessage());
			return "redirect:errorPage.me";
		}
		
	}
	
	/**
	 * @Author      : Ungken
	 * @CreateDate  : 2020. 1. 23.
	 * @ModifyDate  : 2020. 1. 23.
	 * @Description : 회원 상세 조회 ajax
	 */
	@PostMapping("selectMember.memberManagement")
	public ModelAndView selectMember(String mno, ModelAndView mv) {
		System.out.println(mno);
		AllMember member = null;
		try {
			member = as.selectMember(Integer.parseInt(mno));
			
			mv.addObject("member", member);
			mv.setViewName("jsonView");
		} catch (SelectException e) {
			e.printStackTrace();
		}
		return mv;
	}
	
	/**
	 * @Author      : Sooo
	 * @CreateDate  : 2020. 1. 28.
	 * @ModifyDate  : 2020. 1. 28.
	 * @Description : 신규 패널 전체 조회 & 검색
	 */
	@RequestMapping("newPanelManagement.memberManagement")
	public String selectNewPanelManagement(HttpServletRequest request, Model model) {
		String queryString = request.getQueryString();
		Map<String, List<String>> queryMap = null;
		
		int currentPage = 1;
		String searchInput = "";
		SearchMember searchMember = new SearchMember();
		
		if(queryString != null) {
			queryMap = Util.splitQuery(queryString);
			if(queryMap.containsKey("currentPage")) {
				currentPage = Integer.parseInt(queryMap.get("currentPage").get(0));
			}
			if(queryMap.containsKey("searchInput")) {
				searchInput = queryMap.get("searchInput").get(0);
				searchMember.setSearchInput(searchInput);
			}
		}
		
		int listCount = 0;
		
		try {
			listCount = as.getListCountNewPanel(searchMember);
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
			searchMember.setPi(pi);
			
			List<AllMember> newPanelList = as.getListNewPanel(searchMember); 
			
			model.addAttribute("newPanelList", newPanelList);
			model.addAttribute("pi", pi);
			
			return "newPanelManagement";
		} catch (SelectException e) {
			model.addAttribute("msg", e.getMessage());
			return "redirect:errorPage.me";
		}
	}
	
	/**
	 * @Author      : Sooo
	 * @CreateDate  : 2020. 1. 28.
	 * @ModifyDate  : 2020. 1. 28.
	 * @Description : 신규 패널 상세보기 ajax
	 */
	@PostMapping("selectNewPanel.memberManagement")
	public ModelAndView selectNewPanel(String mno, ModelAndView mv) {
		AllMember newPanel = null;
		try {
			newPanel = as.selectNewPanelDetail(Integer.parseInt(mno));
			
			mv.addObject("newPanel", newPanel);
			mv.addObject("mno", mno);
			mv.setViewName("jsonView");
		} catch (SelectException e) {
			mv.setViewName("redirect:errorPage.me");
		}
		return mv;
	}
	
	/**
	 * @Author	:hansol
	 * @CreateDate	:2020. 2. 9.
	 * @ModifyDate	:2020. 2. 9.
	 * @Description	:패널이 작성한 ts가져오기
	 */
	@RequestMapping("selectPanelTs.memberManagement")
	public ModelAndView selectPanelTs(ModelAndView mv, String mno, PanelThanksSurvey ps) {
		
		ps.setMno(Integer.parseInt(mno));
		ps.setResearchNo(1);
		List<PanelThanksSurvey> list = as.selectPanelTs(ps);
		
		
		mv.addObject("list",list);
		mv.setViewName("jsonView");
		
		
		return mv;
	}
	
	@PostMapping("newPanelMailing.memberManagement")
	public ModelAndView newPanelMailing(ModelAndView mv, int mno){
		try {
			AllMember newPanel = as.selectNewPanelDetail(mno);
			
			
			//메일 전송 부분 시작
			String setfrom = "yychani94@gmail.com";         
		    String tomail  = newPanel.getUserEmail();     // 받는 사람 이메일
		    String title   = "서브웨이 Thanks Survey 결과입니다.";      // 제목
		    String content = "안녕하세요 " + newPanel.getUserName()+ "님, ThanksSurvey에 참여해주셔서 감사합니다." + "<br>"+
		    		"Thanks Survey 결과 회원님은 패널로 활동하실 수 있습니다." + "<br>"+
		    		"다양한 리서치 참여로  소정의 리워드를 받아가세요.";
		   
		    try {
				MimeMessage message = mailSender.createMimeMessage();
				MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
				 
				messageHelper.setFrom(setfrom);  // 보내는사람 생략하거나 하면 정상작동을 안함
				messageHelper.setTo(tomail);     // 받는사람 이메일
				messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
				messageHelper.setText(content);  // 메일 내용
 
				String contents = "<img src=\"cid:logo\" style='width: 420px;'>" + "<br>" +content; 
				messageHelper.setText(contents, true); 
				
//				FileSystemResource file = new FileSystemResource(new File("C:\\images\\survwayLogo.png")); 
//				messageHelper.addInline("logo", file);

				mailSender.send(message);
				
				int result1 = as.updatePanelLevel(mno);
		    } catch(Exception e){
		      System.out.println(e);
		    }
			//메일 전송 부분 끝
			
			
		} catch (SelectException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		mv.addObject("result",true);
		mv.setViewName("jsonView");
		
		return mv;
	}
	
	@PostMapping("newPanelReferMailing.memberManagement")
	public ModelAndView newPanelReferMailing(ModelAndView mv, int mno, String text ) {
		
		try {
			AllMember newPanel = as.selectNewPanelDetail(mno);
			System.out.println(newPanel);
			
			//메일 전송 부분 시작
			String setfrom = "yychani94@gmail.com";         
		    String tomail  = newPanel.getUserEmail();     // 받는 사람 이메일
		    String title   = "서브웨이 Thanks Survey 결과입니다.";      // 제목
		    String content = "안녕하세요"+newPanel.getUserName()+"님, ThanksSurvey에 참여해주셔서 감사함니다"+"<br>"+
		    					text +" 라는 이유로 thanksSurvey가 반려 되셨습니다."+"<br>"+
		    					"thanksSurvey는 3회까지 재참여가 가능하니 다시 참여해주시기 바랍니다. ";
		   
		    try {
				MimeMessage message = mailSender.createMimeMessage();
				MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
				 
				messageHelper.setFrom(setfrom);  // 보내는사람 생략하거나 하면 정상작동을 안함
				messageHelper.setTo(tomail);     // 받는사람 이메일
				messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
				messageHelper.setText(content);  // 메일 내용
 
				String contents = "<img src=\"cid:logo\" style='width: 420px;'>" + "<br>" +content; 
				messageHelper.setText(contents, true); 
				
//				FileSystemResource file = new FileSystemResource(new File("C:\\images\\survwayLogo.png")); 
//				messageHelper.addInline("logo", file);

				mailSender.send(message);
				
				int result1 = as.deletePanelThanksSurvey(mno);
		    } catch(Exception e){
		      System.out.println(e);
		    }
			//메일 전송 부분 끝
			
			
		} catch (SelectException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		mv.addObject("result",true);
		mv.setViewName("jsonView");
		
		return mv;
	}
	
}
