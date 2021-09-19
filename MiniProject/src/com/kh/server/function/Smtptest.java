package com.kh.server.function;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class Smtptest {
	public static void gmailSend(String email, String tmpPwd) {
		String user = "wonkyong1022@gmail.com";
		String password = "wonwoo0922";
		
		  Properties prop = new Properties();
	        prop.put("mail.smtp.host", "smtp.gmail.com"); 
	        prop.put("mail.smtp.port", 465); 
	        prop.put("mail.smtp.auth", "true"); 
	        prop.put("mail.smtp.ssl.enable", "true"); 
	        prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");
	        
	        Session session = Session.getDefaultInstance(prop, new javax.mail.Authenticator() {
	            protected PasswordAuthentication getPasswordAuthentication() {
	                return new PasswordAuthentication(user, password);
	            }
	        });

	        try {
	            MimeMessage message = new MimeMessage(session);
	            message.setFrom(new InternetAddress(user));

	            //수신자메일주소
	            message.addRecipient(Message.RecipientType.TO, new InternetAddress(email)); 

	            // Subject
	            message.setSubject("KH치마인드"); //메일 제목을 입력

	            // Text
	            message.setText("임시 비밀번호는 < " + tmpPwd + " > 입니다.\n설정창에서 반드시 비밀번호를 변경해주시기 바랍니다.");    //메일 내용을 입력
	            // send the message
	            Transport.send(message); ////전송
	            System.out.println("message sent successfully...");
	        } catch (AddressException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        } catch (MessagingException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        }
	}
	
	/*public static void main(String[] args) {
		gmailSend("gurwns1540@gmail.com", "123");
	}*/
}