package bean;

public class FollowBean {
	private int follow_Num;
	private int mem_Num;
	private int follow_You_Num;
	private String mem_Nickname;
	private String mem_Introduce;
	private int folder_Num;
	private String mem_Photo;
	private int follow;
	
	
	public FollowBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public FollowBean(int mem_Num) {
		this.mem_Num = mem_Num;
		// TODO Auto-generated constructor stub
	}
	public FollowBean(int follow_Num, int mem_Num, int follow_You_Num, String mem_Nickname, String mem_Introduce,
			int folder_Num, String mem_Photo, int follow) {
		super();
		this.follow_Num = follow_Num;
		this.mem_Num = mem_Num;
		this.follow_You_Num = follow_You_Num;
		this.mem_Nickname = mem_Nickname;
		this.mem_Introduce = mem_Introduce;
		this.folder_Num = folder_Num;
		this.mem_Photo = mem_Photo;
		this.follow = follow;
	}
	public int getFollow_Num() {
		return follow_Num;
	}
	public void setFollow_Num(int follow_Num) {
		this.follow_Num = follow_Num;
	}
	public int getMem_Num() {
		return mem_Num;
	}
	public void setMem_Num(int mem_Num) {
		this.mem_Num = mem_Num;
	}
	public int getFollow_You_Num() {
		return follow_You_Num;
	}
	public void setFollow_You_Num(int follow_You_Num) {
		this.follow_You_Num = follow_You_Num;
	}
	public String getMem_Nickname() {
		return mem_Nickname;
	}
	public void setMem_Nickname(String mem_Nickname) {
		this.mem_Nickname = mem_Nickname;
	}
	public String getMem_Introduce() {
		return mem_Introduce;
	}
	public void setMem_Introduce(String mem_Introduce) {
		this.mem_Introduce = mem_Introduce;
	}
	public int getFolder_Num() {
		return folder_Num;
	}
	public void setFolder_Num(int folder_Num) {
		this.folder_Num = folder_Num;
	}
	public String getMem_Photo() {
		return mem_Photo;
	}
	public void setMem_Photo(String mem_Photo) {
		this.mem_Photo = mem_Photo;
	}
	public int getFollow() {
		return follow;
	}
	public void setFollow(int follow) {
		this.follow = follow;
	}
	
	
	
	
}
