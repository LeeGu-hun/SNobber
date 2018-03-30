package controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import bean.BoardBean;
import bean.BoardCommand;
import bean.LoginCommand;
import bean.MainBean;
import bean.Paging;
import service.BoardService;
import spring.AuthInfo;

@Controller
public class MainController {
	private BoardService boardService;

	public void setBoardService(BoardService boardService) {
		this.boardService = boardService;
	}

	@RequestMapping("/")
	public String root(LoginCommand loginCommand, @CookieValue(value = "REMEMBER", required = false) Cookie rCookie) {
		if (rCookie != null) {
			loginCommand.setEmail(rCookie.getValue());
			loginCommand.setRememberEmail(true);
		}
		return "lo";
	}

	@RequestMapping("/main")
	public String home(Model model, @ModelAttribute("cmd") BoardCommand boardCommand, HttpSession session,
			@RequestParam(defaultValue = "all") String searchOption, @RequestParam(defaultValue = "") String keyword,
			@RequestParam(defaultValue = "1") int curPage) {
		Long host = ((AuthInfo) session.getAttribute("authInfo")).getId();
		List<BoardBean> list = null;
		int count = boardService.boardCount(searchOption, keyword, host);
		Paging paging = new Paging();
		paging.setPageNo(curPage); // get방식의 parameter값으로 반은 page변수, 현재 페이지 번호
		paging.setPageSize(10); // 한페이지에 불러낼 게시물의 개수 지정
		paging.setTotalCount(count);
		int start = paging.getPageBegin();
		int end = paging.getPageEnd();

		try {
			list = boardService.boardList(start, end, searchOption, keyword, host);
		} catch (Exception e) {
		}

		MainBean bean = new MainBean();
		bean.setList(list);
		bean.setCount(count);
		bean.setSearchOption(searchOption);
		bean.setKeyword(keyword);
		model.addAttribute("bean", bean);
		model.addAttribute("paging", paging);
		return "main";
	}
}
