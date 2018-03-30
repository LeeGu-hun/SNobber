package spring;

import java.util.Date;

import exception.IdPasswordNotMatchingException;

public class Member {

	private Long id;
	private String email;
	private String password;
	private String name;
	private Date regdate;

	public Member(String email, String password, String name, Date regdate) {
		this.email = email;
		this.password = password;
		this.name = name;
		this.regdate = regdate;
	}
	public Member() {}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getId() {
		return id;
	}

	public String getEmail() {
		return email;
	}

	public String getPassword() {
		return password;
	}

	public String getName() {
		return name;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void changePassword(String oldPassword, String newPassword) {
		if (!password.equals(oldPassword))
			throw new IdPasswordNotMatchingException();
		this.password = newPassword;
	}
	public boolean mathPassword(String password) {
		if (this.password.equals(password))
			return true;
		else 
			return false;
	}
}
