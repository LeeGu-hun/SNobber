package controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import bean.LoginCommand;
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
		System.out.println("스텝1");
		return "register/step1";
	}

	@RequestMapping(value = "/register/step2", method = RequestMethod.GET)
	public String step2Get() {
		System.out.println("step2겟");
		return "redirect:/register/step1";
	}

	@RequestMapping(value = "/register/step2", method = RequestMethod.POST)
	public String step2Post(@RequestParam(value = "agree", defaultValue = "false") Boolean agreeVal,
			RegisterRequest rr) {
		System.out.println("스텝2포스트");
		if (!agreeVal) {
			return "redirect:step1";
		}
		// model.addAttribute("registerRequest",new RegisterRequest());
		return "register/step2";
	}

	@RequestMapping(value = "/register/step3", method = RequestMethod.POST)
	public String step3Post(RegisterRequest rr, Errors errors, Model model) {
		System.out.println("스텝3포스트");
		new RegisterRequestValidator().validate(rr, errors);
		if (errors.hasErrors())
			return "register/step2";
		try {
			memberRegisterService.regist(rr);
		} catch (AlreadyExistingMemberException e) {
			errors.rejectValue("email", "duplicate");
			return "register/step2";
		}
		LoginCommand loginCommand = new LoginCommand();
		loginCommand.setEmail(rr.getEmail());
		model.addAttribute("loginCommand", loginCommand);
		return "register/step3";
	}
}
