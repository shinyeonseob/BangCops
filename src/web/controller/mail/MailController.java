package web.controller.mail;

import java.io.IOException;
import java.util.Properties;
import java.util.Random;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.NoSuchProviderException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.MailAuth;
import web.dto.BUser;
import web.service.face.MemberService;
import web.service.impl.MemberServiceImpl;

@WebServlet("/send")
public class MailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private MemberService memberService = new MemberServiceImpl();


	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		BUser bUser = memberService.getbUser(req);
		

		Random random = new Random();
		int ranno = random.nextInt(8999) + 1000;
		
		// FROM
		final String FROM = "bangcops@gmail.com"; // <<------------------------------수정하세요
		final String FROMNAME = "방캅스"; // <<------------------------------수정하세요

		// TO
		final String TO = req.getParameter("UserID"); // <<------------------------------수정하세요

		System.out.println(TO);
		// 메일 제목
		final String SUBJECT = "방캅스 이메일 인증번호"; // <<------------------------------수정하세요

		// 메일 본문
		final String BODY = String.join(
				"<h1>구글 SMTP Email Test</h1>",
				"<p>javax.mail을 이용한 구글 smtp 이메일 전송 테스트</p>" ,
				"<p>다음 인증번호를 입력하세요</p>" ,

				 Integer.toString(ranno));// <<------------------------------수정하세요

		
		// 인증 객체
		Authenticator auth = new MailAuth("bangcops@gmail.com", "khacademy"); // <<------------------------------수정하세요
	
		
		
		// 연결 설정
		Properties props = System.getProperties();
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.port", "587");
		
		// 메일 세션 객체 생성
		Session session = Session.getDefaultInstance(props, auth);

		// 메시지 생성
		MimeMessage msg = new MimeMessage(session);
		try {
			msg.setFrom(new InternetAddress(FROM, FROMNAME));
			msg.setRecipient(Message.RecipientType.TO, new InternetAddress(TO));
			msg.setSubject(SUBJECT);
			msg.setContent(BODY, "text/html;charset=utf-8");

			System.out.println("Sending...");

			//메시지 보내기
			Transport.send(msg);
			
			System.out.println("Email sent!");

			req.setAttribute("bUser", bUser);
			req.setAttribute("ranno", ranno);
			System.out.println(bUser);
			System.out.println(ranno);
			
			req.getRequestDispatcher("/WEB-INF/views/member/join_mail.jsp").forward(req, resp);
		} catch (NoSuchProviderException e) {
			e.printStackTrace();
			
		} catch (MessagingException e) {
			e.printStackTrace();
			
			System.out.println("The email was not sent.");
			System.out.println("Error message: " + e.getMessage());
			
		} 			
	}
}
