package bean;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import spring.RegisterRequest;

public class RegisterRequestValidator implements Validator {
	private static final String emailRegExp = "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@"
			+ "[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";
	private static final String idRegExp = "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*";
	private Pattern idpattern, emailpattern;

	public RegisterRequestValidator() {
		idpattern = Pattern.compile(idRegExp);
		emailpattern = Pattern.compile(emailRegExp);
	}

	@Override
	public boolean supports(Class<?> arg0) {
		return RegisterRequest.class.isAssignableFrom(arg0);
	}

	@Override
	public void validate(Object target, Errors errors) {
		RegisterRequest regReq = (RegisterRequest) target;
		if (regReq.getMem_Id() == null || regReq.getMem_Id().trim().isEmpty()) {
			errors.rejectValue("mem_Id", "required");
		} else {
			Matcher matcher = idpattern.matcher(regReq.getMem_Id());
			if (!matcher.matches()) {
				errors.rejectValue("mem_Id", "bad");
			}
		}
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "mem_Name", "required");
		ValidationUtils.rejectIfEmpty(errors, "mem_Password", "required");
		ValidationUtils.rejectIfEmpty(errors, "mem_ConfirmPassword", "required");
		if (!regReq.getMem_Password().isEmpty()) {
			if (!regReq.isPasswordEqualToConfirmPassword()) {
				errors.rejectValue("mem_ConfirmPassword", "nomatch");
			}
		}
	}

}
