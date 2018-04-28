package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import bean.EditValidator;
import bean.mypageEditCommand;
import service.GoneService;
import spring.AuthInfo;
import spring.Member;

@Controller
public class GoneController {
	private GoneService goneService;

	public void setGoneService(GoneService goneService) {
		this.goneService = goneService;
	}
	
//	//메인 컨트롤러에서 해당부분 수정
//	//@RequestMapping(value = "mypageEdit", method = RequestMethod.POST)
//	public String mypageEditPost(mypageEditCommand command, HttpSession session, HttpServletRequest request, Errors errors) {
//		new EditValidator().validate(command, errors);
//		int host = ((AuthInfo) session.getAttribute("authInfo")).getMem_num();
//		AuthInfo auth = (AuthInfo) session.getAttribute("authInfo");
//		Member mem = new Member();
//		mem.setMem_num(host);
//		mem.setMem_Password(command.getMem_password());
//		mem.setMem_Introduce(command.getMem_introduce());
//		boardService.mypageUpdate(mem);
//		return "redirect:/main";
//	}

}
