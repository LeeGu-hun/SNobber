package bean;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

public class EditValidator implements Validator {
	private static final String emailRegExp = "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@"
			+ "[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";
	private Pattern emailpattern;

	public EditValidator() {
		emailpattern = Pattern.compile(emailRegExp);
	}

	@Override
	public boolean supports(Class<?> arg0) {
		return mypageEditCommand.class.isAssignableFrom(arg0);
	}

	@Override
	public void validate(Object target, Errors errors) {
		mypageEditCommand medit = (mypageEditCommand) target;
		if (medit.getMem_Email() == null || medit.getMem_Email().trim().isEmpty()) {
			errors.rejectValue("mem_Email", "required");
		} else {
			Matcher matcher = emailpattern.matcher(medit.getMem_Email());
			if (!matcher.matches()) {
				errors.rejectValue("mem_Email", "bademail");
			}
		}
		ValidationUtils.rejectIfEmpty(errors, "mem_Password", "required");
	}

}
