package com.opera.survway.corporation.controller;

import com.opera.survway.common.model.vo.OperaFileNamePolicy;
import com.opera.survway.common.model.vo.UploadFile;
import com.opera.survway.corporation.model.service.CorpService;
import com.opera.survway.corporation.model.vo.CorpMember;
import com.opera.survway.exception.LoginException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.net.InetAddress;
import java.net.UnknownHostException;

@Controller
public class CorpController {
	@Autowired
	private CorpService cs;
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	@Autowired
	private JavaMailSender mailSender; // Mail Sender
	
	@PostMapping("corpSignup.me")
	public String corpSignup(Model model, CorpMember cm, MultipartFile corpPicture, HttpServletRequest request) {
		InetAddress inet;
		String svrIp = "";
		try {
			inet = InetAddress.getLocalHost();
			svrIp = inet.getHostAddress();
		} catch (UnknownHostException e1) {
			e1.printStackTrace();
		}
		
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\uploadFiles";
		
		String originFileName = corpPicture.getOriginalFilename();
		String ext = originFileName.substring(originFileName.lastIndexOf("."));
		String saveFile = OperaFileNamePolicy.getRandomString() + ext;
		
		UploadFile uploadFile = new UploadFile();
		uploadFile.setOriginName(cm.getCompanyName() + "_사업자등록증" + ext);
		uploadFile.setChangeName(saveFile);
		uploadFile.setFilePath(savePath);
		try {
			corpPicture.transferTo(new File(savePath + "\\" + saveFile));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		String encPassword =passwordEncoder.encode(cm.getUserPwd());
	    cm.setUserPwd(encPassword);
		
		try {
			cs.insertCorp(cm, uploadFile);
			
			/*메일 전송 부분 시작*/
			String setfrom = "yychani94@gmail.com";         
		    String tomail  = cm.getUserEmail();     // 받는 사람 이메일
		    String title   = "Survway 정회원(기업) 인증메일입니다.";      // 제목
		    String content = "<form action='http://" + svrIp + ":8001/survway/signupCertification.me' method='post'> <p> 서브웨이 리서치(기업)에 가입해 주신 것을 진심으로 감사드립니다.<br> 아래의 버튼을 클릭하시면 정회원 인증이 되어 리서치를 작성하실 수 있습니다. </p> <input type='hidden' name='userId' value='" + cm.getUserId() + "'><button type='submit' style='width: 370px; cursor: pointer; height: 70px; border: 0;  background: #00679A; color: white; font-size: 20pt; margin-top: 10px;'>정회원 인증하기</button> </form>";    // 내용
		   
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
		    } catch(Exception e){
		    	e.printStackTrace();
		    }
			/*메일 전송 부분 끝*/
			
				return "redirect:corpSignup3.corp";
		
	  	} catch (LoginException e) { request.setAttribute("msg", e.getMessage());
	  		return "panelLogin.panel"; 
	  	}
	}
}
