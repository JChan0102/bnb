package com.bit.bnb.user.service;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class MailSendService {

	@Autowired
	private JavaMailSender mailSender;
	
	// 이메일 계정 인증메일 보내기 메서드
	@Transactional
	public void mailSendWithUserKey(String email, String name, String userKey) {
			
		MimeMessage mail = mailSender.createMimeMessage();
			
		String htmlStr = "<h2>안녕하세요, " + name + "님!</h2>"
						  + "이메일 계정을 인증받으시려면 아래의 링크를 클릭해주세요!"
						  + "(혹시 잘못 전달된 메일이라면 이 이메일을 무시하셔도 됩니다) <br><br>"
						  + "<a href=\"http://localhost/bnb/userKeyConfirm?"
						  + "userId=" + email + "&userKey=" + userKey + "\">BITBNB 가기</a>";
			
		try {
			mail.setSubject("[본인인증] BITBNB 회원가입 인증메일입니다", "utf-8");
			mail.setText(htmlStr, "utf-8", "html");
			mail.addRecipient(RecipientType.TO, new InternetAddress(email));
			mailSender.send(mail);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}
		
		
	// 비밀번호 찾기 이메일 전송
	public void mailSendSearchPw(String email, String name, String userKey) {
		MimeMessage mail = mailSender.createMimeMessage();
		
		String htmlStr = "<h2>안녕하세요, " + name + "님!</h2>"
						  + "비밀번호 재설정을 요청하셨습니다.<br>"
						  + "(혹시 잘못 전달된 메일이라면 이 이메일을 무시하셔도 됩니다) <br>"
						  + "아래의 링크를 이용해 비밀번호를 재설정하세요.<br>"
						  + "<a href=\"http://localhost/bnb/user/updatePw?"
						  + "userId=" + email + "&userKey=" + userKey + "\">비밀번호 재설정하기</a>";
			
		try {
			mail.setSubject("[BITBNB]비밀번호를 재설정하세요", "utf-8");
			mail.setText(htmlStr, "utf-8", "html");
			mail.addRecipient(RecipientType.TO, new InternetAddress(email));
			mailSender.send(mail);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}
	
}
