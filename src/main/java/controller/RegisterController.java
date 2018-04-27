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

	@RequestMapping("/register/step1")
	public String handleStep1() {
		return "register/step1";
	}

	@RequestMapping(value = "/register/step2", method = RequestMethod.GET)
	public String step2Get() {
		return "redirect:/register/step1";
	}

	@RequestMapping(value = "/register/step2", method = RequestMethod.POST)
	public String step2Post(@RequestParam(value = "agree", defaultValue = "false") Boolean agreeVal,
			RegisterRequest rr) {
		if (!agreeVal) {
			return "redirect:step1";
		}
		// model.addAttribute("registerRequest",new RegisterRequest());
		return "register/step2";
	}

	@RequestMapping(value = "/register/step3", method = RequestMethod.POST)
	public String step3Post(RegisterRequest rr, Errors errors, Model model, HttpServletRequest request) {
		new RegisterRequestValidator().validate(rr, errors);
		MultipartFile multi = rr.getMem_Photo();
		String originalFilename = "", newFilename = "";
		if (multi != null) {
			originalFilename = multi.getOriginalFilename();
			// 파일명이 중복되지 않게 파일명에 시간 추가
			newFilename = System.currentTimeMillis() + "_" 
					+ originalFilename;

			// 파일 업로드 경로
			String root_path = request.getSession()
					.getServletContext().getRealPath("/");
		
			String path = root_path + newFilename;
			if (errors.hasErrors())
				return "register/step2";
			try {
				File file = new File(path);
				multi.transferTo(file);
				MemberBean  mem = new MemberBean();
				mem.setMem_Id(rr.getMem_Id());
				mem.setMem_Password(rr.getMem_Password());
				mem.setMem_Nickname(rr.getMem_Name());
				mem.setMem_Email(rr.getMem_Email());
				mem.setMem_Photo(newFilename);
				mem.setMem_Introduce(rr.getMem_Introduce());
				memberRegisterService.regist(mem);
				LoginCommand loginCommand = new LoginCommand();
				loginCommand.setId(mem.getMem_Id());
				model.addAttribute("loginCommand", loginCommand);
			}catch (AlreadyExistingMemberException e) {
				if(e.getMessage().indexOf("dup mem_Id") == 0) {
					errors.rejectValue("mem_Id", "duplicate");
				} else if(e.getMessage().indexOf("dup mem_Name") == 0) {
					errors.rejectValue("mem_Name", "duplicate");
				} else if(e.getMessage().indexOf("dup mem_Email ") == 0) {
					errors.rejectValue("mem_Email", "duplicate");
				}
				return "register/step2";
			}catch (IOException e) {
					e.printStackTrace();
			}
		}
		return "register/step3";
	}
}
