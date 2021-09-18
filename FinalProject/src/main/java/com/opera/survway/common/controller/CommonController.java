package com.opera.survway.common.controller;

import com.opera.survway.common.model.service.CommonService;
import com.opera.survway.panel.model.vo.PanelMember;
import org.apache.http.HttpHost;
import org.apache.http.HttpResponse;
import org.apache.http.auth.AuthScope;
import org.apache.http.auth.UsernamePasswordCredentials;
import org.apache.http.client.AuthCache;
import org.apache.http.client.CredentialsProvider;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.protocol.HttpClientContext;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.auth.BasicScheme;
import org.apache.http.impl.client.BasicAuthCache;
import org.apache.http.impl.client.BasicCredentialsProvider;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;

@Controller
public class CommonController {
	private int rand = 0;

	@Autowired
	private CommonService cs;
	
	/**
	 * @Author      : Ungken
	 * @CreateDate  : 2020. 1. 22.
	 * @ModifyDate  : 2020. 1. 22.
	 * @Description : 아이디 중복확인
	 */
	@PostMapping("duplicationIdCheck.me")
	public ModelAndView duplicationIdCheck(String userId, ModelAndView mv) {
		
		boolean isDuplicated = cs.duplicationIdCheck(userId);
		
		mv.addObject("isDuplicated", isDuplicated);
		mv.setViewName("jsonView");
		
		return mv;
	}
	
	/**
	 * @Author      : Ungken
	 * @CreateDate  : 2020. 1. 22.
	 * @ModifyDate  : 2020. 1. 22.
	 * @Description : 이메일 중복확인
	 */
	@PostMapping("duplicationEmailCheck.me")
	public ModelAndView duplicationEmailCheck(String userEmail, ModelAndView mv) {
		
		boolean isDuplicated = cs.duplicationEmailCheck(userEmail);
		
		mv.addObject("isDuplicated", isDuplicated);
		mv.setViewName("jsonView");
		
		return mv;
	}
	
	/**
	 * @Author      : Ungken
	 * @CreateDate  : 2020. 1. 22.
	 * @ModifyDate  : 2020. 1. 22.
	 * @Description : 휴대폰 인증
	 */
	@ResponseBody 
	@RequestMapping("sendSms.me") 
	public String sendSms(String receiver) { 
		// 6자리 인증 코드 생성 
		rand = (int) (Math.random() * 899999) + 100000; // 인증 코드를 데이터베이스에 저장하는 코드는 생략했습니다. 
		// 문자 보내기 
		String hostname = "api.bluehouselab.com"; 
		String url = "https://" + hostname + "/smscenter/v1.0/sendsms";
		
		CredentialsProvider credsProvider = new BasicCredentialsProvider(); 
		credsProvider.setCredentials(new AuthScope(hostname, 443, AuthScope.ANY_REALM), // 청기와랩에 등록한 Application Id 와 API key 를 입력합니다. 
				new UsernamePasswordCredentials("Opera_survway", "241753a43c6d11eab3ca0cc47a1fcfae")); 
		AuthCache authCache = new BasicAuthCache(); authCache.put(new HttpHost(hostname, 443, "https"), 
				new BasicScheme()); 
		HttpClientContext context = HttpClientContext.create(); 
		context.setCredentialsProvider(credsProvider); 
		context.setAuthCache(authCache); 
		CloseableHttpClient client = HttpClientBuilder.create().build();
		try { 
			HttpPost httpPost = new HttpPost(url); 
			
			httpPost.setHeader("Content-type", "application/json; charset=utf-8"); //문자에 대한 정보 
			String json = "{\"sender\":\"01055348519\",\"receivers\":[\"" + receiver + "\"],\"content\":\"Survway 인증번호 : " + rand + "\"}";
			System.out.println("rand : " + rand);
			StringEntity se = new StringEntity(json, "UTF-8"); httpPost.setEntity(se); 
			HttpResponse httpResponse = client.execute(httpPost, context); 
			
			InputStream inputStream = httpResponse.getEntity().getContent(); 
			if (inputStream != null) { 
				BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(inputStream)); 
				String line = ""; 
				
				while ((line = bufferedReader.readLine()) != null) {
					System.out.println(line);
					/*
					 * if(line.equals("No receivers")) { return "false"; }
					 */ 
					// 테스트시에는 주석
				}
				inputStream.close(); 
				return "true"; 
			}
		} catch (Exception e) { 
			System.err.println("Error: " + e.getLocalizedMessage()); 
			return "false"; 
		} finally { 
			try {
				client.close();
			} catch (IOException e) {
				e.printStackTrace();
			} 
		} 
		return "false";
	}
	
	/**
	 * @Author      : Ungken
	 * @CreateDate  : 2020. 1. 22.
	 * @ModifyDate  : 2020. 1. 22.
	 * @Description : 휴대폰 인증번호 확인
	 */
	@ResponseBody 
	@RequestMapping("smsCheck.me") 
	public String smsCheck(String code) {
		String saveCode = Integer.toString(rand);//데이터베이스에 저장된 코드 불러오기 
		if(code.equals(saveCode)) { 
			return "ok"; 
		}else { 
			return "no"; 
		} 
	}
	
	/**
	 * @Author      : Ungken
	 * @CreateDate  : 2020. 1. 23.
	 * @ModifyDate  : 2020. 1. 23.
	 * @Description :  정회원 인증(이메일 버튼 경로)
	 */
	@PostMapping("signupCertification.me")
	public String SignupComplete(String userId) {
		
		cs.certificationMember(userId);
		
		return "common/signUpComplete";
	}
	
	@RequestMapping("errorPage.me")
	public String forwardErrorPage() {
		return "common/errorPage";
	}

	/**
	 * @Author      : yhj
	 * @CreateDate  : 2020. 1. 24.
	 * @ModifyDate  : 2020. 1. 24.
	 * @Description : ajax 비밀번호 체크
	 */
	@PostMapping("checkPasswordAjax.me")
	public ModelAndView checkPasswordModal(String userId, String ajaxPwd, ModelAndView mv) {
		
		boolean isEqual = cs.checkPasswordModal(userId, ajaxPwd);
		System.out.println(userId);
		System.out.println(ajaxPwd);
		mv.addObject("isEqual", isEqual);
		mv.setViewName("jsonView");
		
		return mv;
	}
	
	/**
	 * @Author      : Ungken
	 * @CreateDate  : 2020. 2. 6.
	 * @ModifyDate  : 2020. 2. 6.
	 * @Description : 계좌번호 업데이트
	 */
	@PostMapping("updateAccount.me")
	public ModelAndView updateAccount(ModelAndView mv, String bankCode, String bankAccount, String mno, HttpSession session) {
		
		PanelMember loginUser = new PanelMember();
		loginUser.setMno(Integer.parseInt(mno));
		loginUser.setWithdrawAccount(bankCode + "/" + bankAccount);
		
		boolean isUpdate = cs.updateAccount(loginUser);
		session.removeAttribute("loginUser");
		mv.addObject("isUpdate", isUpdate);
		mv.setViewName("jsonView");
		return mv;
	}
}

