package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import bean.Find;
import bean.FindIdValidator;
import service.FindIdService;
import spring.Member;
import spring.RegisterRequest;

@Controller
public class FindIdController {
	private FindIdService findIdService;

	public void setFindIdService(FindIdService findIdService) {
		this.findIdService = findIdService;
	}

	@RequestMapping(value = "/find/findId", method = RequestMethod.GET)
	public String handleFindId(RegisterRequest rr) {
		return "find/find_id";
	}

	@RequestMapping(value = "find/idFind", method = RequestMethod.POST)
	public void find_Id(RegisterRequest rr, RedirectAttributes redirectattr, Errors errors, Model model,
			HttpServletRequest request, HttpServletResponse response)
			throws AddressException, MessagingException, IOException {
		new FindIdValidator().validate(rr, errors);
		PrintWriter out = response.getWriter();
		if (errors.hasErrors()) {
			response.setContentType("text/html; charset=UTF-8");
			out.println("<script>alert('등록되지 않은 정보입니다.');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
		}

		Find find = new Find();
		find.setMem_Name(rr.getMem_Name());
		find.setMem_Email(rr.getMem_Email());
		Member mem = findIdService.findId(find);

		String host = "smtp.gmail.com";
		final String id = "ksh180315"; // 보낼아이디
		final String pwd = "htkocumczzvszubi"; // 비밀번호

		String from = "ksh180315@gmail.com"; // 보낼메일
		String to = mem.getMem_Email(); // 받는 이메일

		Properties props = new Properties();
		props.put("mail.smtp.user", "wjdgusfb11");
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.socketFactory.port", "465");
		props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		props.put("mail.smtp.socketFactory.fallback", "false");
		props.put("mail.smtp.port", "465");
		props.put("mail.smtp.starttls.enable", "true");

		String subject = "안녕하세요 SNobber입니다." + mem.getMem_Nickname() + "님의 ID를 알려드립니다";

		String body1 = mem.getMem_Nickname() + "님의 ID는 " + mem.getMem_Id() + "입니다.";
		String body2 = "SNobber에 돌아오셔서 마음껏 즐겨주세요!";

		Session session = Session.getInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(id, pwd);
			}
		});

		try {

			// Create a default MimeMessage object.
			Message message = new MimeMessage(session);

			// Set From: header field of the header.
			message.setFrom(new InternetAddress(from));

			// Set To: header field of the header.
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));

			// Set Subject: header field
			message.setSubject(subject);

			// This mail has 2 part, the BODY and the embedded image
			MimeMultipart multipart = new MimeMultipart("related");

			// first part (the html)
			BodyPart messageBodyPart = new MimeBodyPart();
			// String htmlText = "<H1>Hello</H1><img src=\"cid:image\">";
			String htmlText = "<center><img src=\"cid:image\"><H3>고객센터</H3>"
					+ "<div style='width: 600px; height: 150px; border:1px solid'>안녕하세요 SNobber입니다."
					+ mem.getMem_Nickname() + "님의 ID를 알려드립니다<br>" + "<hr>" + body1 + "<br>" + body2
					+ "<br> <a href='http://192.168.0.62:8080/SNobber'>SNobber로 바로가기</a>" + "</div></center>";
			messageBodyPart.setContent(htmlText, "text/html; charset=UTF-8");
			// add it
			multipart.addBodyPart(messageBodyPart);

			// second part (the image)
			messageBodyPart = new MimeBodyPart();
			DataSource fds = new FileDataSource("D:/classSpring/snn.png");

			messageBodyPart.setDataHandler(new DataHandler(fds));
			messageBodyPart.setHeader("Content-ID", "<image>");

			// add image to the multipart
			multipart.addBodyPart(messageBodyPart);

			// put everything together
			message.setContent(multipart);
			// Send message
			Transport.send(message);

			System.out.println("Sent message successfully....");
		} catch (MessagingException e) {
			throw new RuntimeException(e);
		}
		response.setContentType("text/html; charset=UTF-8");
		out.println("<script>alert('" + mem.getMem_Nickname() + "님의 " + mem.getMem_Email() + "로 ID를 전송했습니다.');");
		out.println("history.back();");
		out.println("</script>");
	}
}