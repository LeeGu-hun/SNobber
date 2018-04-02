package spring;

public class AuthInfo {
	private String id, email, name, photo, introduce;

	public AuthInfo(String id, String email, String name, String photo, String introduce) {
		this.id = id;this.email = email;this.name = name;this.photo= photo;this.introduce=introduce;
	}

	public String getId() { return id; }
	public String getEmail() { return email; }
	public String getName() { return name; }
	public String getPhoto() {return photo;	}
	public String getIntroduce() {return introduce;	}
}
