package bean;

public class LoginCommand {
	private String id, password, name;
	private boolean rememberId;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public boolean isRememberId() {
		return rememberId;
	}

	public void setRememberId(boolean rememberId) {
		this.rememberId = rememberId;
	}
}
