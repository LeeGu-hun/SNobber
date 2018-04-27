package bean;

import java.util.Date;

public class BoardMemberBean {
	private String mem_Nickname, board_Content, mem_Id;
	private int board_Num, mem_Num, board_Secret, board_Type;
	private Date board_Date;
	private String board_File, mem_photo;

	public BoardMemberBean() {
		super();
		// TODO Auto-generated constructor stub
	}

	public BoardMemberBean(String mem_Nickname, String board_Content, String mem_Id, int board_Num, int mem_Num,
			int board_Secret, int board_Type, Date board_Date, String board_File, String mem_photo) {
		super();
		this.mem_Nickname = mem_Nickname;
		this.board_Content = board_Content;
		this.mem_Id = mem_Id;
		this.board_Num = board_Num;
		this.mem_Num = mem_Num;
		this.board_Secret = board_Secret;
		this.board_Type = board_Type;
		this.board_Date = board_Date;
		this.board_File = board_File;
		this.mem_photo = mem_photo;
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

	public String getMem_Id() {
		return mem_Id;
	}

	public void setMem_Id(String mem_Id) {
		this.mem_Id = mem_Id;
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

	public int getBoard_Secret() {
		return board_Secret;
	}

	public void setBoard_Secret(int board_Secret) {
		this.board_Secret = board_Secret;
	}

	public int getBoard_Type() {
		return board_Type;
	}

	public void setBoard_Type(int board_Type) {
		this.board_Type = board_Type;
	}

	public Date getBoard_Date() {
		return board_Date;
	}

	public void setBoard_Date(Date board_Date) {
		this.board_Date = board_Date;
	}

	public String getBoard_File() {
		return board_File;
	}

	public void setBoard_File(String board_File) {
		this.board_File = board_File;
	}

	public String getMem_photo() {
		return mem_photo;
	}

	public void setMem_photo(String mem_photo) {
		this.mem_photo = mem_photo;
	}
}
