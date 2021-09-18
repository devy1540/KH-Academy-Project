package com.opera.survway.common.model.vo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;

import javax.mail.internet.MimeMessage;
import java.io.File;

public class EmailTemplate {
	@Autowired
	private JavaMailSender mailSender; // Mail Sender
	
	public void sendEmail(String receive, String inputContents) {
		/*메일 전송 부분 시작*/
		String setfrom = "yychani94@gmail.com";         
	    String tomail  = receive;     // 받는 사람 이메일
	    String title   = "Survway 정회원 인증메일입니다.";      // 제목
	    String content = inputContents;
	   
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
	      System.out.println(e);
	    }
		/*메일 전송 부분 끝*/ 
	}
	
}
