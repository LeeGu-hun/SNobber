package bean;

import java.util.Date;

public class ReplayBean {
	private int mem_Num;
	private String mem_Nickname;
	private int board_Num;
	private Date re_Date;
	private String re_Content;

	public int getMem_Num() {
		return mem_Num;
	}

	public void setMem_Num(int mem_Num) {
		this.mem_Num = mem_Num;
	}

	public String getMem_Nickname() {
		return mem_Nickname;
	}

	public void setMem_Nickname(String mem_Nickname) {
		this.mem_Nickname = mem_Nickname;
	}

	public int getBoard_Num() {
		return board_Num;
	}

	public void setBoard_Num(int board_Num) {
		this.board_Num = board_Num;
	}

	public Date getRe_Date() {
		return re_Date;
	}

	public void setRe_Date(Date re_Date) {
		this.re_Date = re_Date;
	}

	public String getRe_Content() {
		return re_Content;
	}

	public void setRe_Content(String re_Content) {
		this.re_Content = re_Content;
	}

	public ReplayBean() {
		super();
	}
}
