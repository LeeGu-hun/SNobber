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
public class FindIdController {
	private FindIdService findIdService;

	public void setFindIdService(FindIdService findIdService) {
		this.findIdService = findIdService;
	}

	@RequestMapping(value = "/find/findId")
	public String handleFindId(RegisterRequest rr) {
		return "find/find_id";
	}

	@RequestMapping(value = "find/idFind", method = RequestMethod.POST)
	public String find_Id(RegisterRequest rr, RedirectAttributes redirectattr, Errors errors, Model model) {
		new FindIdValidator().validate(rr, errors);
		if (errors.hasErrors())
			return "find/find_id";
		try {
			Find find = new Find();
			find.setMem_Name(rr.getMem_Name());
			find.setMem_Email(rr.getMem_Email());
			Member mem = findIdService.findId(find);
			model.addAttribute("find", mem);
		} catch (MemberNotFoundException e) {
			if(e.getMessage().indexOf("noexist mem_Name") == 0) {
				errors.rejectValue("mem_Name", "noexist");
			} else if(e.getMessage().indexOf("noexist mem_Email ") == 0) {
				errors.rejectValue("mem_Email", "noexist");
			}
			return "find/find_id";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "find/id_find";
	}
}