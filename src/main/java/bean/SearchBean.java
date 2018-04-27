package bean;

import java.sql.Blob;
import java.sql.Date;

public class SearchBean {
	private int mem_num;
	private String mem_photo;
	private String mem_nickname;
	private String board_content;
	private Date board_date;
	private int board_secret;
	private int board_read_count;
	private Blob board_file;
	private int board_type;
	private String mem_introduce;

	public int getMem_num() {
		return mem_num;
	}

	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
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

	public String getBoard_content() {
		return board_content;
	}

	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}

	public Date getBoard_date() {
		return board_date;
	}

	public void setBoard_date(Date board_date) {
		this.board_date = board_date;
	}

	public int getBoard_secret() {
		return board_secret;
	}

	public void setBoard_secret(int board_secret) {
		this.board_secret = board_secret;
	}

	public int getBoard_read_count() {
		return board_read_count;
	}

	public void setBoard_read_count(int board_read_count) {
		this.board_read_count = board_read_count;
	}

	public Blob getBoard_file() {
		return board_file;
	}

	public void setBoard_file(Blob board_file) {
		this.board_file = board_file;
	}

	public int getBoard_type() {
		return board_type;
	}

	public void setBoard_type(int board_type) {
		this.board_type = board_type;
	}

	public String getMem_introduce() {
		return mem_introduce;
	}

	public void setMem_introduce(String mem_introduce) {
		this.mem_introduce = mem_introduce;
	}
}
