package spring;

public class AuthInfo {
	private String id, email, name, photo, introduce;
	private int mem_num, mem_condition;

	public AuthInfo(String id, String email, String name, String photo, String introduce, int mem_num,
			int mem_condition) {
		this.id = id;
		this.email = email;
		this.name = name;
		this.photo = photo;
		this.introduce = introduce;
		this.mem_num = mem_num;
		this.mem_condition = mem_condition;
	}

	public AuthInfo() {
	}

	public int getMem_num() {
		return mem_num;
	}

	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}

	public int getMem_condition() {
		return mem_condition;
	}

	public void setMem_condition(int mem_condition) {
		this.mem_condition = mem_condition;
	}

	public void setId(String id) {
		this.id = id;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}

	public String getId() {
		return id;
	}

	public String getEmail() {
		return email;
	}

	public String getName() {
		return name;
	}

	public String getPhoto() {
		return photo;
	}

	public String getIntroduce() {
		return introduce;
	}
}
