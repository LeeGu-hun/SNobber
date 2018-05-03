package controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import bean.ChangePwdCommand;
import bean.ChangePwdCommandValidator;
import exception.IdPasswordNotMatchingException;
import spring.AuthInfo;
import spring.ChangePasswordService;

@Controller
@RequestMapping("/edit/changePassword")
public class ChangePwdController {
	private ChangePasswordService changePasswordService;

	public void setChangePasswordService(ChangePasswordService changePasswordService) {
		this.changePasswordService = changePasswordService;
	}

	@RequestMapping(method = RequestMethod.GET)
	public String form(@ModelAttribute("command") ChangePwdCommand pwdCmd) {
		return "edit/changePwdForm";
	}

	@RequestMapping(method = RequestMethod.POST)
	public String submit(@ModelAttribute("command") ChangePwdCommand pwdCmd, Errors errors, HttpSession session) {
		new ChangePwdCommandValidator().validate(pwdCmd, errors);
		if (errors.hasErrors())
			return "edit/changePwdForm";
		AuthInfo auth = (AuthInfo) session.getAttribute("authInfo");
		try {
			changePasswordService.changePassword(auth.getId(), pwdCmd.getCurrentPassword(), pwdCmd.getNewPassword(),
					auth.getName(), auth.getEmail(), auth.getPhoto(), auth.getIntroduce());
		} catch (IdPasswordNotMatchingException e) {
			errors.rejectValue("currentPassword", "notMatching");
			return "edit/changePwdForm";
		}
		return "edit/changedPwd";
	}
}
