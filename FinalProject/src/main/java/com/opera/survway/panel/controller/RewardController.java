package com.opera.survway.panel.controller;

import com.opera.survway.common.model.vo.PageInfo;
import com.opera.survway.common.model.vo.Pagination;
import com.opera.survway.exception.RewardException;
import com.opera.survway.panel.model.service.PanelService;
import com.opera.survway.panel.model.vo.PanelMember;
import com.opera.survway.panel.model.vo.Reward;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class RewardController {
	
	@Autowired
	private PanelService ps;
	
	/**
	 * @Author	:hansol
	 * @CreateDate	:2020. 1. 27.
	 * @ModifyDate	:2020. 1. 27.
	 * @Description	:리워드 적립내역
	 */
	@RequestMapping("myRewardDetail_saved.myPage")
	public String showMyRewardDetail_saved(HttpSession session, Model model,Reward rd) {
		PanelMember panelMember = (PanelMember)session.getAttribute("loginUser");
		int mno = panelMember.getMno();
		rd.setMno(mno);
		int listCount = 0;
		int currentPage =1;
		
		try {
			listCount = ps.getListCountRewardSaved(rd);
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
			rd.setPi(pi);
			List<Reward> list = ps.showMyRewardDetailSaved(rd);
			
			
			
			model.addAttribute("list",list);
			model.addAttribute("pi",pi);
		} catch (RewardException e) {
			session.setAttribute("msg", e.getMessage());
		}
		
		
		return "myRewardDetail_saved";
	}
	
	/**
	 * @Author	:hansol
	 * @CreateDate	:2020. 1. 28.
	 * @ModifyDate	:2020. 1. 28.
	 * @Description	:리워드 사용내역
	 */
	@RequestMapping("myRewardDetail_used.myPage")
	public String showMyRewardDetail_used(HttpSession session, Model model, Reward r) {
		PanelMember panelMember = (PanelMember)session.getAttribute("loginUser");
		int mno = panelMember.getMno();
		int listCount = 0;
		int currentPage =1;
		
		r.setMno(mno);
		try {
			listCount = ps.getListCountRewardUsed(r);
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
			r.setPi(pi);
			
			List<Reward> list = ps.showRewardDetailUsed(r);
			
			model.addAttribute("list", list);
			model.addAttribute("pi",pi);
		} catch (RewardException e) {
			session.setAttribute("msg", e.getMessage());
		}
		
		return "myRewardDetail_used";
	}
	
	
	@RequestMapping("myRewardCashOut.myPage")
	public String getPanelReward(HttpSession session, Model model, Reward r) {
		PanelMember panelMember = (PanelMember) session.getAttribute("loginUser");
		int mno = panelMember.getMno();
		
		
		
		try {
			Reward reward = ps.getPanelReward(mno);
			model.addAttribute("Reward",reward);
		} catch (RewardException e) {
			
			e.printStackTrace();
		}
		
		return "myRewardCashOut";
	}
	
	/**
	 * @Author	:hansol
	 * @CreateDate	:2020. 1. 31.
	 * @ModifyDate	:2020. 1. 31.
	 * @Description	:캐시아웃 신청
	 */
	@RequestMapping("applyRewardCashOut.myPage")
	public ModelAndView applyRewardCashOut(HttpSession session, Reward r, String cash,ModelAndView mv) {
		PanelMember panelMember = (PanelMember) session.getAttribute("loginUser");
		int mno = panelMember.getMno();
		int cashout = Integer.parseInt(cash);
		
		if(cashout == 10000) {
			cashout =1;
		}else if(cashout == 20000) {
			cashout =2;
		}else if(cashout == 30000) {
			cashout =3;
		}else if(cashout == 40000) {
			cashout =4;
		}else if(cashout == 50000) {
			cashout =5;
		}
		
		r.setMno(mno);
		r.setCashoutNo(cashout);
		int num=0;
		String changeAmount ="-"+cash;
		
		r.setChangeAmount(changeAmount);
		
		try {
			
			num = ps.insertCashOutHistory(r);
			mv.addObject("num",num);
			mv.setViewName("jsonView");//ModelAndView를 setViewName("jsonView");라고 지정을 하면 ajax로 사용할 수 있다.
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		
		
		return mv;
	}
	
	@RequestMapping("myRewardMain.myPage")
	public String showMyRewardMain(HttpSession session, Reward r, Model model) {
		PanelMember panelMember = new PanelMember();
		if(session.getAttribute("loginUser") != null) {
			panelMember = (PanelMember)session.getAttribute("loginUser");
		}else {
			return "redirect:panelResult.panel?message=notLoginAccess";
		}
		int mno = panelMember.getMno();
		r.setMno(mno);
			int useReward = ps.useRewardList(r);
			int nowMyReward = ps.nowMyReward(r);
			
			int totalReward = useReward+nowMyReward;
			model.addAttribute("useReward",useReward);
			model.addAttribute("nowMyReward",nowMyReward);
			model.addAttribute("totalReward",totalReward);
			
		return "myRewardMain";
	}
}






