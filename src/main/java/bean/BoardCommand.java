package bean;

import org.springframework.web.multipart.MultipartFile;

public class BoardCommand {
	private int mem_Num;
	private String BOARD_CONTENT;
	private String writeMode;
	private String folderMode;
	private MultipartFile board_File;
	private int secretMode;

	public int getSecretMode() {
		return secretMode;
	}

	public void setSecretMode(int secretMode) {
		this.secretMode = secretMode;
	}

	// private List<MultipartFile> files; //파일 여러개 할때 사용
	public BoardCommand() {
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

	public MultipartFile getBoard_File() {
		return board_File;
	}

	public void setBoard_File(MultipartFile board_File) {
		this.board_File = board_File;
	}
}
