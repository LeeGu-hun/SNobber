package bean;

public class MemberBean {
	int mem_id;
	String mem_Name,mem_password,mem_Email;
	String mem_Introduce;
	int mem_Condition;
	
	public MemberBean() {
		super();
	}

	public MemberBean(int mem_id, String mem_Name, String mem_password, String mem_Email, String mem_Introduce,
			int mem_Condition) {
		super();
		this.mem_id = mem_id;
		this.mem_Name = mem_Name;
		this.mem_password = mem_password;
		this.mem_Email = mem_Email;
		this.mem_Introduce = mem_Introduce;
		this.mem_Condition = mem_Condition;
	}

	public int getMem_id() {
		return mem_id;
	}

	public void setMem_id(int mem_id) {
		this.mem_id = mem_id;
	}

	public String getMem_Name() {
		return mem_Name;
	}

	public void setMem_Name(String mem_Name) {
		this.mem_Name = mem_Name;
	}

	public String getMem_password() {
		return mem_password;
	}

	public void setMem_password(String mem_password) {
		this.mem_password = mem_password;
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
}
