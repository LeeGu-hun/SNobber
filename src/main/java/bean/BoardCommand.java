package bean;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class BoardCommand {
	private String BOARD_NAME;
	private String BOARD_PASS;
	private String BOARD_SUBJECT;
	private String BOARD_CONTENT;
	private MultipartFile BOARD_FILE;
//	private List<MultipartFile> files; //파일 여러개 할때 사용
	public BoardCommand() {
	}

	public BoardCommand(String bOARD_NAME, String bOARD_PASS, String bOARD_SUBJECT, String bOARD_CONTENT,
			MultipartFile bOARD_FILE) {
		super();
		BOARD_NAME = bOARD_NAME;
		BOARD_PASS = bOARD_PASS;
		BOARD_SUBJECT = bOARD_SUBJECT;
		BOARD_CONTENT = bOARD_CONTENT;
		BOARD_FILE = bOARD_FILE;
	}

	public String getBOARD_NAME() {
		return BOARD_NAME;
	}

	public void setBOARD_NAME(String bOARD_NAME) {
		BOARD_NAME = bOARD_NAME;
	}

	public String getBOARD_PASS() {
		return BOARD_PASS;
	}

	public void setBOARD_PASS(String bOARD_PASS) {
		BOARD_PASS = bOARD_PASS;
	}

	public String getBOARD_SUBJECT() {
		return BOARD_SUBJECT;
	}

	public void setBOARD_SUBJECT(String bOARD_SUBJECT) {
		BOARD_SUBJECT = bOARD_SUBJECT;
	}

	public String getBOARD_CONTENT() {
		return BOARD_CONTENT;
	}

	public void setBOARD_CONTENT(String bOARD_CONTENT) {
		BOARD_CONTENT = bOARD_CONTENT;
	}

	public MultipartFile getBOARD_FILE() {
		return BOARD_FILE;
	}

	public void setBOARD_FILE(MultipartFile bOARD_FILE) {
		BOARD_FILE = bOARD_FILE;
	}
}
