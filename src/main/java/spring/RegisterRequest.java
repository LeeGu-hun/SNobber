package spring;

import org.springframework.web.multipart.MultipartFile;

public class RegisterRequest {

	private String mem_Id;
	private String mem_Password;
	private String mem_ConfirmPassword;
	private String mem_Name;
	private String mem_Email;
	private MultipartFile mem_Photo;
	private String mem_Introduce;
	private int mem_Condition;

	public String getMem_Introduce() {
		return mem_Introduce;
	}

	public void setMem_Introduce(String mem_Introduce) {
		this.mem_Introduce = mem_Introduce;
	}

	public int getMem_Condition() {
		return mem_Condition;
	}

	public void setMem_Condition(int mem_Condition) {
		this.mem_Condition = mem_Condition;
	}

	public String getMem_Id() {
		return mem_Id;
	}

	public void setMem_Id(String mem_Id) {
		this.mem_Id = mem_Id;
	}

	public String getMem_Password() {
		return mem_Password;
	}

	public void setMem_Password(String mem_Password) {
		this.mem_Password = mem_Password;
	}

	public String getMem_ConfirmPassword() {
		return mem_ConfirmPassword;
	}

	public void setMem_ConfirmPassword(String mem_ConfirmPassword) {
		this.mem_ConfirmPassword = mem_ConfirmPassword;
	}

	public String getMem_Name() {
		return mem_Name;
	}

	public void setMem_Name(String mem_Name) {
		this.mem_Name = mem_Name;
	}

	public String getMem_Email() {
		return mem_Email;
	}

	public void setMem_Email(String mem_Email) {
		this.mem_Email = mem_Email;
	}

	public MultipartFile getMem_Photo() {
		return mem_Photo;
	}

	public void setMem_Photo(MultipartFile mem_Photo) {
		this.mem_Photo = mem_Photo;
	}

	public boolean isPasswordEqualToConfirmPassword() {
		return mem_Password.equals(mem_ConfirmPassword);
	}
}
