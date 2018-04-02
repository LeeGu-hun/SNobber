package bean;

public class LikeBean {
	private int board_Num, mem_Num;
	private String mem_Nickname;
	private int like_Target_Num;
	private int like_Type;
	private int like_On;

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

	public String getMem_Nickname() {
		return mem_Nickname;
	}

	public void setMem_Nickname(String mem_Nickname) {
		this.mem_Nickname = mem_Nickname;
	}

	public int getLike_Target_Num() {
		return like_Target_Num;
	}

	public void setLike_Target_Num(int like_Target_Num) {
		this.like_Target_Num = like_Target_Num;
	}

	public int getLike_Type() {
		return like_Type;
	}

	public void setLike_Type(int like_Type) {
		this.like_Type = like_Type;
	}

	public int getLike_On() {
		return like_On;
	}

	public void setLike_On(int like_On) {
		this.like_On = like_On;
	}

	public LikeBean() {
		super();
	}
}
