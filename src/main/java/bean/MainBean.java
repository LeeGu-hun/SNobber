package bean;

import java.util.List;

public class MainBean {
	private List<BoardBean> list;
	private int count;
	private String searchOption;
	private String keyword;

	public MainBean(List<BoardBean> list, int count, String searchOption, String keyword) {
		super();
		this.list = list;
		this.count = count;
		this.searchOption = searchOption;
		this.keyword = keyword;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public MainBean() {
	}

	public List<BoardBean> getList() {
		return list;
	}

	public void setList(List<BoardBean> list) {
		this.list = list;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public String getSearchOption() {
		return searchOption;
	}

	public void setSearchOption(String searchOption) {
		this.searchOption = searchOption;
	}

}
