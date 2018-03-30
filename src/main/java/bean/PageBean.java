package bean;

public class PageBean {
	private int start, end;
	private String searchOption, keyword;
	private Long host;
	
	public PageBean() { }
	
	public PageBean(int start, int end, String searchOption, String keyword, Long host) {
		super();
		this.start = start;
		this.end = end;
		this.searchOption = searchOption;
		this.keyword = keyword;
		this.host = host;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}

	public String getSearchOption() {
		return searchOption;
	}

	public void setSearchOption(String searchOption) {
		this.searchOption = searchOption;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public Long getHost() {
		return host;
	}

	public void setHost(Long host) {
		this.host = host;
	}
	
}
