package bean;

public class FolderBean {
	private String mem_Nickname;
	private String folder_Title;
	private String folder_Content;
	private int folder_Secret;

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

	public int getFolder_Secret() {
		return folder_Secret;
	}

	public void setFolder_Secret(int folder_Secret) {
		this.folder_Secret = folder_Secret;
	}

	public FolderBean() {
		super();
	}
}
