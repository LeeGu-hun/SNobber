package bean;

public class Find {
	private String mem_Id;
	private String mem_Name;
	private String mem_Email;

	public Find(String mem_Id, String mem_Name, String mem_Email) {
		super();
		this.mem_Id = mem_Id;
		this.mem_Name = mem_Name;
		this.mem_Email = mem_Email;
	}

	public Find(String mem_Name, String mem_Email) {
		super();
		this.mem_Name = mem_Name;
		this.mem_Email = mem_Email;
	}

	public Find() {
		super();
	}

	public String getMem_Id() {
		return mem_Id;
	}

	public void setMem_Id(String mem_Id) {
		this.mem_Id = mem_Id;
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
}
