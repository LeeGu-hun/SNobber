package spring;

import java.sql.Blob;
import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class Board {
	private int mem_Num;
	private String BOARD_CONTENT;
	private String writeMode;
	private String folderMode;
	private String BOARD_FILE;
	private int secretMode;
	private String mem_NickName;

	public Board(int mem_Num, String bOARD_CONTENT, String writeMode, String folderMode, String bOARD_FILE,
			int secretMode) {
		super();
		this.mem_Num = mem_Num;
		BOARD_CONTENT = bOARD_CONTENT;
		this.writeMode = writeMode;
		this.folderMode = folderMode;
		BOARD_FILE = bOARD_FILE;
		this.secretMode = secretMode;
	}

	public Board() {

	}

	public String getMem_NickName() {
		return mem_NickName;
	}

	public void setMem_NickName(String mem_NickName) {
		this.mem_NickName = mem_NickName;
	}

	public int getSecretMode() {
		return secretMode;
	}

	public void setSecretMode(int secretMode) {
		this.secretMode = secretMode;
	}

	public int getMem_Num() {
		return mem_Num;
	}

	public void setMem_Num(int mem_Num) {
		this.mem_Num = mem_Num;
	}

	public String getBOARD_CONTENT() {
		return BOARD_CONTENT;
	}

	public void setBOARD_CONTENT(String bOARD_CONTENT) {
		BOARD_CONTENT = bOARD_CONTENT;
	}

	public String getWriteMode() {
		return writeMode;
	}

	public void setWriteMode(String writeMode) {
		this.writeMode = writeMode;
	}

	public String getFolderMode() {
		return folderMode;
	}

	public void setFolderMode(String folderMode) {
		this.folderMode = folderMode;
	}

	public String getBOARD_FILE() {
		return BOARD_FILE;
	}

	public void setBOARD_FILE(String bOARD_FILE) {
		BOARD_FILE = bOARD_FILE;
	}
}