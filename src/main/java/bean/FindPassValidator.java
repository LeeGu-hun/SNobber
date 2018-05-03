package bean;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import spring.RegisterRequest;

public class FindPassValidator implements Validator {
	private Pattern pattern;
	private Matcher matcher;
	String regexp = "^[_a-z0-9-]+(.[_a-z0-9-]+)*@(?:\\w+\\.)+\\w+$"; // 이메일 정규 표현식

	public FindPassValidator() {
		pattern = Pattern.compile(regexp);
	}

	@Override
	public boolean supports(Class<?> clazz) {
		return RegisterRequest.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		RegisterRequest register = (RegisterRequest) target;
		// 이메일이 올바른 형식인지 검사
		matcher = pattern.matcher(register.getMem_Email());
		if (register.getMem_Email() == null || register.getMem_Email().trim().isEmpty()) {
			errors.rejectValue("mem_Email", "required");
		} else if (!matcher.matches()) { // 사용자가 입력한 이메일이 정규표현식에 매치 되지않는다면
			errors.rejectValue("mem_Email", "bademail");
		}
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "mem_Name", "required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "mem_Id", "required");

	}
}
