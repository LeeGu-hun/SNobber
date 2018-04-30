package bean;

import java.sql.Blob;
import java.util.Date;

public class BoardBean {
	private int board_Num;
	private int mem_Num;
	private String mem_Photo;
	private String mem_Nickname;
	private String board_Content;
	private Date board_Date;
	private int board_Secret;
	private int board_Read_Count;
	private int re_Num;
	private int like_Num;
	private String board_File;
	private int board_Type;
	private int folder_Num;
	private Date sysdate;
	
	
	public Date getSysdate() {
		return sysdate;
	}

	public void setSysdate(Date sysdate) {
		this.sysdate = sysdate;
	}

		//매퍼의 리스트 수정하면서 이부분 추가했습니다   setter,getter포함
		private int like_on;
		private int count;

	public int getFolder_Num() {
		return folder_Num;
	}

	public void setFolder_Num(int folder_Num) {
		this.folder_Num = folder_Num;
	}

	

	public int getLike_on() {
		return like_on;
	}

	public void setLike_on(int like_on) {
		this.like_on = like_on;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public int getBoard_Num() {
		return board_Num;
	}

	public void setBoard_Num(int board_Num) {
		this.board_Num = board_Num;
	}

	public int getMem_Num() {
		return mem_Num;
	}

	public void setMem_Num(int mem_Num) {
		this.mem_Num = mem_Num;
	}

	public String getMem_Photo() {
		return mem_Photo;
	}

	public void setMem_Photo(String mem_Photo) {
		this.mem_Photo = mem_Photo;
	}

	public String getMem_Nickname() {
		return mem_Nickname;
	}

	public void setMem_Nickname(String mem_Nickname) {
		this.mem_Nickname = mem_Nickname;
	}

	public String getBoard_Content() {
		return board_Content;
	}

	public void setBoard_Content(String board_Content) {
		this.board_Content = board_Content;
	}

	public Date getBoard_Date() {
		return board_Date;
	}

	public void setBoard_Date(Date board_Date) {
		this.board_Date = board_Date;
	}

	public int getBoard_Secret() {
		return board_Secret;
	}

	public void setBoard_Secret(int board_Secret) {
		this.board_Secret = board_Secret;
	}

	public int getBoard_Read_Count() {
		return board_Read_Count;
	}

	public void setBoard_Read_Count(int board_Read_Count) {
		this.board_Read_Count = board_Read_Count;
	}

	public int getRe_Num() {
		return re_Num;
	}

	public void setRe_Num(int re_Num) {
		this.re_Num = re_Num;
	}

	public int getLike_Num() {
		return like_Num;
	}

	public void setLike_Num(int like_Num) {
		this.like_Num = like_Num;
	}

	public String getBoard_File() {
		return board_File;
	}

	public void setBoard_File(String board_File) {
		this.board_File = board_File;
	}

	public int getBoard_Type() {
		return board_Type;
	}

	public void setBoard_Type(int board_Type) {
		this.board_Type = board_Type;
	}

	public BoardBean() {
	}
}
