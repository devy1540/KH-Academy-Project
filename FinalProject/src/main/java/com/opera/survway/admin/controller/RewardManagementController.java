package com.opera.survway.admin.controller;

import com.opera.survway.admin.model.service.AdminService;
import com.opera.survway.admin.model.vo.PanelRewardHistory;
import com.opera.survway.common.model.vo.PageInfo;
import com.opera.survway.common.model.vo.Pagination;
import com.opera.survway.common.model.vo.Util;
import com.opera.survway.exception.SelectException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

@Controller
public class RewardManagementController {
	
	@Autowired
	private AdminService as;
	
	/**
	 * @Author      : Ungken
	 * @CreateDate  : 2020. 1. 24.
	 * @ModifyDate  : 2020. 1. 24.
	 * @Description : 패널 캐시아웃 신청 이력 조회
	 */
	@RequestMapping("manageCashoutApplication.reward")
	public String selectPanelCashoutApplication(HttpServletRequest request, Model model) {
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
			listCount = as.getListCountPanelCashoutApplicant();
			
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
			
			
			List<PanelRewardHistory> panelRewardHistoryList = as.panelCashoutApplication(pi); 
			
			model.addAttribute("panelRewardHistoryList", panelRewardHistoryList);
			model.addAttribute("pi", pi);
			
			return "manageCashoutApplications";
			
		} catch (SelectException e) {
			model.addAttribute("msg", e.getMessage());
			return "redirect:errorPage.me";
		}
	}
	
	@PostMapping("cashoutOnePeople.reward")
	public ModelAndView cashoutOnePeople(@RequestParam("cnoArr") List<String> cnoArr, ModelAndView mv) {
//		System.out.println(mnoArr);
		
		boolean isCashout = as.cashoutPeople(cnoArr);
		
		mv.addObject("isCashout", isCashout);
		mv.setViewName("jsonView");
		return mv;
	}
	
	@RequestMapping("manageCashoutComplete.reward")
	public String manageCashoutComplete(HttpServletRequest request, Model model) {
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
			listCount = as.getListCountManageCashoutComplete();
			
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
			
			
			List<PanelRewardHistory> rewardCompleteHistoryList = as.manageCashoutComplete(pi); 

			model.addAttribute("rewardCompleteHistoryList", rewardCompleteHistoryList);
			model.addAttribute("pi", pi);
			
			return "manageCashoutComplete";
			
		} catch (SelectException e) {
			model.addAttribute("msg", e.getMessage());
			return "redirect:errorPage.me";
		}
	}
}
