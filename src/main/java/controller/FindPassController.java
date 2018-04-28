package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
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
import bean.FindPassValidator;
import exception.MemberNotFoundException;
import service.FindIdService;
import service.FindPassService;
import spring.Member;
import spring.RegisterRequest;

@Controller
public class FindPassController {
	private FindPassService findPassService;

	public void setFindPassService(FindPassService findPassService) {
		this.findPassService = findPassService;
	}

	@RequestMapping(value = "/find/findPass")
	public String handleFindPass(RegisterRequest rr) {
		return "find/find_pass";
	}

	@RequestMapping(value = "find/passFind", method = RequestMethod.POST)
	public void find_Pass(RegisterRequest rr, RedirectAttributes redirectattr, Errors errors, Model model,HttpServletRequest request,HttpServletResponse response) throws AddressException, MessagingException, IOException{
		new FindPassValidator().validate(rr, errors);
		if (errors.hasErrors()) {
			response.setContentType("text/html; charset=UTF-8");		 
			PrintWriter out = response.getWriter();		 
			out.println("<script>alert('등록되지 않은 정보입니다.');");
			out.println("history.back();"); 
			out.println("</script>"); 
			out.close();
		}
			
			try {
			Find find = new Find();
			find.setMem_Id(rr.getMem_Id());
			find.setMem_Name(rr.getMem_Name());
			find.setMem_Email(rr.getMem_Email());
			Member mem = findPassService.findPass(find);
			System.out.println(mem.getMem_Email());
			System.out.println(mem.getMem_Nickname());
			
			
			
			
			
	String host = "smtp.gmail.com";

			

			final String id = "ksh180315";

			final String pwd = "htkocumczzvszubi";

			int port = 465;

			

			String recipient = "ksh180315@gmail.com";
			String to = mem.getMem_Email();
			//System.out.println(mem.getMem_Email()+mem.getMem_Nickname()+mem.getMem_Id());
			String subject = "안녕하세요 SNobber입니다. 비밀번호를 알려드립니다";

			String body = "안녕하세요! "+mem.getMem_Nickname()+"님의 비밀번호는 "+mem.getMem_Password()+"입니다.\n"
					+"SNobber에 돌아오셔서 마음 껏 즐겨주세요! :D";

			

			Properties props = System.getProperties();

			props.put("mail.smtp.host", host); 

			props.put("mail.smtp.port", port); 

			props.put("mail.smtp.auth", "true"); 

			props.put("mail.smtp.ssl.enable", "true"); 

			props.put("mail.smtp.ssl.trust", host);



			Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() { 

				String un = id; 

				String pw = pwd; 

				

				protected javax.mail.PasswordAuthentication getPasswordAuthentication() { 

					return new javax.mail.PasswordAuthentication(un, pw); 

				} 

			}); 

			session.setDebug(true); //for debug



			Message mimeMessage = new MimeMessage(session); //MimeMessage 생성 

			mimeMessage.setFrom(new InternetAddress(recipient)); //발신자 셋팅 , 보내는 사람의 이메일주소를 한번 더 입력합니다. 이때는 이메일 풀 주소를 다 작성해주세요. 

			mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(to)); //수신자셋팅 //.TO 외에 .CC(참조) .BCC(숨은참조) 도 있음 

			mimeMessage.setSubject(subject); //제목셋팅 

			mimeMessage.setText(body); //내용셋팅 

			Transport.send(mimeMessage); //javax.mail.Transport.send() 이용
			
			response.setContentType("text/html; charset=UTF-8");
			 
			PrintWriter out = response.getWriter();
			 
			out.println("<script>alert('이메일이 안전하게 보내졌습니다.');");
			out.println("location.href = '/SNobber';</script>"); 
			out.close();
	
			
			//model.addAttribute("find", mem);
		} catch (MemberNotFoundException e) {
			if(e.getMessage().indexOf("noexist mem_Id ") == 0) {
				errors.rejectValue("mem_Id", "noexist");
			} else if(e.getMessage().indexOf("noexist mem_Name") == 0) {
				errors.rejectValue("mem_Name", "noexist");
			} else if(e.getMessage().indexOf("noexist mem_Email ") == 0) {
				errors.rejectValue("mem_Email", "noexist");
			} 
			
			response.setContentType("text/html; charset=UTF-8");		 
			PrintWriter out = response.getWriter();		 
			out.println("<script>alert('등록되지 않은 정보입니다.');");
			out.println("history.back();"); 
			out.println("</script>"); 
			out.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	
	}
}