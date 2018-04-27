package bean;

import java.util.Date;

public class ReBean {
	private String re_Content, mem_Photo, mem_Nickname;
	private int mem_Num, target_Num, re_Num;
	private Date re_Date;
	public ReBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ReBean(String re_Content, String mem_Photo, String mem_Nickname, int mem_Num, int target_Num, int re_Num,
			Date re_Date) {
		super();
		this.re_Content = re_Content;
		this.mem_Photo = mem_Photo;
		this.mem_Nickname = mem_Nickname;
		this.mem_Num = mem_Num;
		this.target_Num = target_Num;
		this.re_Num = re_Num;
		this.re_Date = re_Date;
	}
	public String getRe_Content() {
		return re_Content;
	}
	public void setRe_Content(String re_Content) {
		this.re_Content = re_Content;
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
	public int getMem_Num() {
		return mem_Num;
	}
	public void setMem_Num(int mem_Num) {
		this.mem_Num = mem_Num;
	}
	public int getTarget_Num() {
		return target_Num;
	}
	public void setTarget_Num(int target_Num) {
		this.target_Num = target_Num;
	}
	public int getRe_Num() {
		return re_Num;
	}
	public void setRe_Num(int re_Num) {
		this.re_Num = re_Num;
	}
	public Date getRe_Date() {
		return re_Date;
	}
	public void setRe_Date(Date re_Date) {
		this.re_Date = re_Date;
	}
		
}
