package bean;

public class FolderBean {
	private int folder_Num, mem_Num, folder_secret;
	private String mem_Nickname, folder_Title, folder_Content;
	
	public FolderBean() {
		super();
		// TODO Auto-generated constructor stub
	}

	public FolderBean(int folder_Num, int mem_Num, int folder_secret, String mem_Nickname, String folder_Title,
			String folder_Content) {
		super();
		this.folder_Num = folder_Num;
		this.mem_Num = mem_Num;
		this.folder_secret = folder_secret;
		this.mem_Nickname = mem_Nickname;
		this.folder_Title = folder_Title;
		this.folder_Content = folder_Content;
	}

	public int getFolder_Num() {
		return folder_Num;
	}

	public void setFolder_Num(int folder_Num) {
		this.folder_Num = folder_Num;
	}

	public int getMem_Num() {
		return mem_Num;
	}

	public void setMem_Num(int mem_Num) {
		this.mem_Num = mem_Num;
	}

	public int getFolder_secret() {
		return folder_secret;
	}

	public void setFolder_secret(int folder_secret) {
		this.folder_secret = folder_secret;
	}

	public String getMem_Nickname() {
		return mem_Nickname;
	}

	public void setMem_Nickname(String mem_Nickname) {
		this.mem_Nickname = mem_Nickname;
	}

	public String getFolder_Title() {
		return folder_Title;
	}

	public void setFolder_Title(String folder_Title) {
		this.folder_Title = folder_Title;
	}

	public String getFolder_Content() {
		return folder_Content;
	}

	public void setFolder_Content(String folder_Content) {
		this.folder_Content = folder_Content;
	}
	
	
	
}
