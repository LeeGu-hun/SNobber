package bean;

import org.springframework.web.multipart.MultipartFile;

public class mypageEditCommand {
	String mem_nickname, mem_password, mem_email, mem_introduce;
	MultipartFile mem_photo;

	
	
	public mypageEditCommand(String mem_nickname, String mem_password, String mem_email, String mem_introduce) {
		super();
		this.mem_nickname = mem_nickname;
		this.mem_password = mem_password;
		this.mem_email = mem_email;
		this.mem_introduce = mem_introduce;
	}

	public mypageEditCommand() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getMem_nickname() {
		return mem_nickname;
	}

	public void setMem_nickname(String mem_nickname) {
		this.mem_nickname = mem_nickname;
	}

	public String getMem_password() {
		return mem_password;
	}

	public void setMem_password(String mem_password) {
		this.mem_password = mem_password;
	}

	public String getMem_email() {
		return mem_email;
	}

	public void setMem_email(String mem_email) {
		this.mem_email = mem_email;
	}

	public MultipartFile getMem_photo() {
		return mem_photo;
	}

	public void setMem_photo(MultipartFile mem_photo) {
		this.mem_photo = mem_photo;
	}

	public String getMem_introduce() {
		return mem_introduce;
	}

	public void setMem_introduce(String mem_introduce) {
		this.mem_introduce = mem_introduce;
	}
	
	
}
