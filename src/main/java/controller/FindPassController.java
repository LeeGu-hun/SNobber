package controller;

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
	public String find_Pass(RegisterRequest rr, RedirectAttributes redirectattr, Errors errors, Model model) {
		new FindPassValidator().validate(rr, errors);
		if (errors.hasErrors())
			return "find/find_pass";
		try {
			Find find = new Find();
			find.setMem_Id(rr.getMem_Id());
			find.setMem_Name(rr.getMem_Name());
			find.setMem_Email(rr.getMem_Email());
			Member mem = findPassService.findPass(find);
			model.addAttribute("find", mem);
		} catch (MemberNotFoundException e) {
			if(e.getMessage().indexOf("noexist mem_Id ") == 0) {
				errors.rejectValue("mem_Id", "noexist");
			} else if(e.getMessage().indexOf("noexist mem_Name") == 0) {
				errors.rejectValue("mem_Name", "noexist");
			} else if(e.getMessage().indexOf("noexist mem_Email ") == 0) {
				errors.rejectValue("mem_Email", "noexist");
			} 
			return "find/find_pass";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "find/pass_find";
	}
}