package bean;

import org.springframework.web.multipart.MultipartFile;

import exception.IdPasswordNotMatchingException;

public class MemberBean {
	private String mem_Id, mem_Nickname, mem_Password, mem_Email, mem_Introduce, mem_Photo;
	private int mem_Condition, mem_num;

	public int getMem_num() {
		return mem_num;
	}

	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}

	public MemberBean() {
		super();
	}

	public String getMem_Id() {
		return mem_Id;
	}

	public void setMem_Id(String mem_Id) {
		this.mem_Id = mem_Id;
	}

	public String getMem_Nickname() {
		return mem_Nickname;
	}

	public void setMem_Nickname(String mem_Nickname) {
		this.mem_Nickname = mem_Nickname;
	}

	public void setMem_Photo(String mem_photo) {
		this.mem_Photo = mem_photo;
	}

	public String getMem_Password() {
		return mem_Password;
	}

	public void setMem_Password(String mem_Password) {
		this.mem_Password = mem_Password;
	}

	public String getMem_Email() {
		return mem_Email;
	}

	public void setMem_Email(String mem_Email) {
		this.mem_Email = mem_Email;
	}

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

	public String getMem_Photo() {
		return mem_Photo;
	}

	public void changePassword(String oldPassword, String newPassword) {
		if (!mem_Password.equals(oldPassword))
			throw new IdPasswordNotMatchingException();
		this.mem_Password = newPassword;
	}

	public boolean mathPassword(String password) {
		if (this.mem_Password.equals(password))
			return true;
		else
			return false;
	}

}
