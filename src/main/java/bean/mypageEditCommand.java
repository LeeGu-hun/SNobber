package bean;

import org.springframework.web.multipart.MultipartFile;

public class mypageEditCommand {
	String mem_Nickname, mem_Password, mem_Email, mem_Introduce;
	MultipartFile mem_Photo;

	public mypageEditCommand(String mem_Nickname, String mem_Password, String mem_Email, String mem_Introduce) {
		super();
		this.mem_Nickname = mem_Nickname;
		this.mem_Password = mem_Password;
		this.mem_Email = mem_Email;
		this.mem_Introduce = mem_Introduce;
	}

	public mypageEditCommand() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getMem_Nickname() {
		return mem_Nickname;
	}

	public void setMem_Nickname(String mem_Nickname) {
		this.mem_Nickname = mem_Nickname;
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

	public MultipartFile getMem_Photo() {
		return mem_Photo;
	}

	public void setMem_Photo(MultipartFile mem_Photo) {
		this.mem_Photo = mem_Photo;
	}
	
}
