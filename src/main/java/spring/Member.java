package spring;

import exception.IdPasswordNotMatchingException;

public class Member {

	private String mem_Id;
	private String mem_Nickname;
	private String mem_Password;
	private String mem_Email;
	private String mem_Photo;
	private String mem_Introduce;
	private int mem_num;
	private int mem_Condition;

	public Member(String mem_Id, String mem_Nickname, String mem_Password, String mem_Email, String mem_Photo,
			String mem_Introduce) {
		super();
		this.mem_Id = mem_Id;
		this.mem_Nickname = mem_Nickname;
		this.mem_Password = mem_Password;
		this.mem_Email = mem_Email;
		this.mem_Photo = mem_Photo;
		this.mem_Introduce = mem_Introduce;
	}

	public Member(String mem_Email) {
		super();
		this.mem_Email = mem_Email;
	}

	public Member(String mem_Nickname, String mem_Email) {
		super();
		this.mem_Nickname = mem_Nickname;
		this.mem_Email = mem_Email;
	}

	public Member(String mem_Id, String mem_Nickname, String mem_Email) {
		super();
		this.mem_Id = mem_Id;
		this.mem_Nickname = mem_Nickname;
		this.mem_Email = mem_Email;
	}

	public Member(String mem_Nickname, String mem_Password, String mem_Email, String mem_Introduce, int mem_num) {
		super();
		this.mem_Nickname = mem_Nickname;
		this.mem_Password = mem_Password;
		this.mem_Email = mem_Email;
		this.mem_Introduce = mem_Introduce;
		this.mem_num = mem_num;
	}

	public Member() {
	}

	public int getMem_num() {
		return mem_num;
	}

	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}

	public String getMem_Id() {
		return mem_Id;
	}

	public void setMem_Id(String mem_Id) {
		this.mem_Id = mem_Id;
	}

	public String getMem_Email() {
		return mem_Email;
	}

	public void setMem_Email(String mem_Email) {
		this.mem_Email = mem_Email;
	}

	public String getMem_Password() {
		return mem_Password;
	}

	public void setMem_Password(String mem_Password) {
		this.mem_Password = mem_Password;
	}

	public String getMem_Nickname() {
		return mem_Nickname;
	}

	public void setMem_Nickname(String mem_Nickname) {
		this.mem_Nickname = mem_Nickname;
	}

	public String getMem_Photo() {
		return mem_Photo;
	}

	public void setMem_Photo(String mem_Photo) {
		this.mem_Photo = mem_Photo;
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
