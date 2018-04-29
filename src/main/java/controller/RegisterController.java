package controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import bean.LoginCommand;
import bean.MemberBean;
import bean.RegisterRequestValidator;
import exception.AlreadyExistingMemberException;
import service.MemberRegisterService;
import spring.RegisterRequest;

@Controller
public class RegisterController {
	private MemberRegisterService memberRegisterService;

	public void setMemberRegisterService(MemberRegisterService memberRegisterService) {
		this.memberRegisterService = memberRegisterService;
	}
	
	@RequestMapping(value = "/step1", method = RequestMethod.GET)
	public String step2Get(RegisterRequest rr) {
		return "/register/step1";
	}

	@RequestMapping(value = "/step2", method = RequestMethod.POST)
	public String step3Post(@RequestParam(value = "agree", defaultValue = "false") Boolean agreeVal,RegisterRequest rr, Errors errors, Model model, HttpServletRequest request) {
		if (!agreeVal) {
			return "redirect:step1";
		}
		new RegisterRequestValidator().validate(rr, errors);
		MultipartFile multi = rr.getMem_Photo();
		String originalFilename = multi.getOriginalFilename(); 
		String newFilename = "";
		MemberBean  mem = new MemberBean();
		if (!originalFilename.equals("")) {
			newFilename = System.currentTimeMillis() + "_" 
					+ originalFilename;

			// 파일 업로드 경로
			String root_path = request.getSession()
					.getServletContext().getRealPath("/");
		
			String path = root_path + newFilename;
			mem.setMem_Photo(newFilename);
			if (errors.hasErrors())
				return "register/step1";
			try {
				File file = new File(path);
				multi.transferTo(file);
			}catch (AlreadyExistingMemberException e) {
				if(e.getMessage().indexOf("dup mem_Id") == 0) {
					errors.rejectValue("mem_Id", "duplicate");
				} else if(e.getMessage().indexOf("dup mem_Name") == 0) {
					errors.rejectValue("mem_Name", "duplicate");
				} else if(e.getMessage().indexOf("dup mem_Email ") == 0) {
					errors.rejectValue("mem_Email", "duplicate");
				}
				return "register/step1";
			}catch (IOException e) {
				e.printStackTrace();
			}
		} else {
			mem.setMem_Photo("");
		}
		mem.setMem_Id(rr.getMem_Id());
		mem.setMem_Password(rr.getMem_Password());
		mem.setMem_Nickname(rr.getMem_Name());
		mem.setMem_Email(rr.getMem_Email());
		mem.setMem_Introduce(rr.getMem_Introduce());
		memberRegisterService.regist(mem);
		LoginCommand loginCommand = new LoginCommand();
		loginCommand.setId(mem.getMem_Id());
		model.addAttribute("loginCommand", loginCommand);
		return "register/step3";
	}
}
