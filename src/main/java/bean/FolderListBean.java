package bean;

public class FolderListBean {

	private String folder_title, mem_nickname, mem_photo;
	private int folder_num, mem_num, count, like_on, rownum;

	public int getRownum() {
		return rownum;
	}

	public String getMem_photo() {
		return mem_photo;
	}

	public void setMem_photo(String mem_photo) {
		this.mem_photo = mem_photo;
	}

	public String getMem_nickname() {
		return mem_nickname;
	}

	public void setMem_nickname(String mem_nickname) {
		this.mem_nickname = mem_nickname;
	}

	public void setRownum(int rownum) {
		this.rownum = rownum;
	}

	public int getLike_on() {
		return like_on;
	}

	public void setLike_on(int like_on) {
		this.like_on = like_on;
	}

	public String getFolder_title() {
		return folder_title;
	}

	public void setFolder_title(String folder_title) {
		this.folder_title = folder_title;
	}

	public int getFolder_num() {
		return folder_num;
	}

	public void setFolder_num(int folder_num) {
		this.folder_num = folder_num;
	}

	public int getMem_num() {
		return mem_num;
	}

	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

}
