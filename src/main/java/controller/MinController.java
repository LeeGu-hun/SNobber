package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import bean.BoardBean;
import bean.BoardMemberBean;
import bean.FolderBean;
import bean.FollowBean;
import bean.LikeKeyBean;
import bean.ReBean;
import bean.likeChangeBean;
import bean.mypageEditCommand;
import service.MinService;
import spring.AuthInfo;
import spring.Member;

@Controller
public class MinController {
	private MinService minService;

	public void setMinService(MinService minService) {
		this.minService = minService;
	}
	
	@RequestMapping(value = "mypagePro") // 마이페이지 첫 창
	public String mypagePro(HttpSession session, Model model, HttpServletRequest request) throws IOException {
		int host = ((AuthInfo) session.getAttribute("authInfo")).getMem_num();
		if (request.getParameter("num") != null) {
			int pageNum = Integer.parseInt(request.getParameter("num"));

			model.addAttribute("host", host);
			Member member = minService.selectById(pageNum);
			model.addAttribute("member", member);
			if (host == pageNum) { // 내 페이지로 가는거
				List<BoardBean> folder = minService.mypagePro(pageNum);
				model.addAttribute("folder", folder);
				List<BoardBean> boardProBoard = minService.mypageProBoard(pageNum);
				model.addAttribute("boardProBoard", boardProBoard);
			} else if (host != pageNum) { // 남 페이지에 갔을 때
				List<BoardBean> folder = minService.mypageProNam(pageNum);
				model.addAttribute("folder", folder);
				
				List<BoardBean> boardProBoard = minService.mypageProBoardNam(pageNum);
				model.addAttribute("boardProBoard", boardProBoard);
			}

			return "mypage/mypagePro";
		}
		return "./main";
	}

	
	@RequestMapping(value = "mypageSNS") // sns클릭 시
	public String mypageSns(HttpSession session, Model model, HttpServletRequest request) throws IOException {
		int pageNum = Integer.parseInt(request.getParameter("num"));
		int host = ((AuthInfo) session.getAttribute("authInfo")).getMem_num();
		model.addAttribute("host", host);
		Member member = minService.selectById(pageNum);
		model.addAttribute("member", member);
		List<BoardBean> boardSNS = minService.mypageSNS(pageNum);
		model.addAttribute("boardSNS", boardSNS);

		return "mypage/mypageSNS";
	}
	
	@RequestMapping(value = "mypageFolder", method = RequestMethod.GET) // 폴더 창으로 이동
	public String mypageFolder(HttpSession session, Model model, HttpServletRequest request,
			HttpServletResponse response) throws IOException {

		if (session.equals(null)) {
			response.setContentType("text/html; charset=UTF-8");

			PrintWriter out = response.getWriter();

			out.println("<script>alert('로그인이 필요합니다'); " + "location.href='/';</script>");

			out.flush();
		}
		// int host = ((AuthInfo) session.getAttribute("authInfo")).getMem_num();

		String num1 = request.getParameter("num");
		int num = Integer.parseInt(num1);
		BoardBean bean = new BoardBean();
		bean.setFolder_Num(num);
		List<BoardBean> board = minService.FolderPage(bean);
		model.addAttribute("board", board);

		FolderBean folderName = minService.folderName(num1);
		model.addAttribute("folderName", folderName);

		return "mypage/mypageFolder";
	}

	@RequestMapping(value = "mypageWritingView") // �� ����
	public String mypageWritionView(HttpSession session, Model model, HttpServletRequest request) throws IOException {
		int host = ((AuthInfo) session.getAttribute("authInfo")).getMem_num();
		String num = request.getParameter("num");
		// num 은 보드의 넘버임

		// List<BoardBean> board = minService.mypageWritingView(num1);
		// model.addAttribute("board", board);
		//조회수 증가 쿼리
		minService.boardReadCount(num);
		model.addAttribute("host", host);
		List<BoardMemberBean> boardMember = minService.BoardMemberBean(num);
		model.addAttribute("bm", boardMember);
		int likeNum = minService.boardLikeNum(num);
		model.addAttribute("likeNum", likeNum);
		List<ReBean> re = minService.reBean(num);
		model.addAttribute("re", re);
		List<likeChangeBean> like = minService.boardLike(num);
		// 좋아요 회원의 정보 가지고 오는거

		return "mypage/mypageWritingView";
	}

	@RequestMapping(value = "mypageRe")
	public String mypageRe(HttpSession session, Model model, HttpServletRequest request) throws IOException {
		int host = ((AuthInfo) session.getAttribute("authInfo")).getMem_num();
		String Content = request.getParameter("Content");
		int num = Integer.parseInt(request.getParameter("num"));
		ReBean bean = new ReBean();
		bean.setRe_Content(Content);
		bean.setMem_Num(host);
		bean.setTarget_Num(num);

		minService.mypageRe(bean);
		return "./main";
	}
	@RequestMapping(value="modifyRe")
	public String modifyRe(HttpSession session, Model model, HttpServletRequest request) throws IOException {
		int host = ((AuthInfo) session.getAttribute("authInfo")).getMem_num();
		String num = request.getParameter("num");
		
		minService.modifyRe(num);
		
		return "./main";
	}
	@RequestMapping(value="deleteRe")
	public String deleteRe(HttpSession session, Model model, HttpServletRequest request) throws IOException {
		int host = ((AuthInfo) session.getAttribute("authInfo")).getMem_num();
		String num = request.getParameter("num");
		
		minService.deleteRe(num);
		
		return "./main";
	}
	@RequestMapping(value="mypageBoardDelete")
	public String mypageBoardDelete(HttpSession session, Model model, HttpServletRequest request) throws IOException {
		int host = ((AuthInfo) session.getAttribute("authInfo")).getMem_num();
		String num = request.getParameter("num");
		
		minService.mypageBoardDelete(num);
		
		return "./main";
	}

	@RequestMapping(value = "mypageFolderCreate", method = { RequestMethod.GET, RequestMethod.POST }) // ���� �����
	public String mypageFolderCreate(HttpSession session, Model model, HttpServletRequest request) throws IOException {
		int host = ((AuthInfo) session.getAttribute("authInfo")).getMem_num();
		String id = request.getParameter("id");

		if (id.equals("folder_create_btn")) {
			int num = 0;
			String title = request.getParameter("title");
			String secret = request.getParameter("secret");

			if (secret.equals("����")) {
				secret = "1";
				num = Integer.parseInt(secret);
			} else if (secret.equals("�����")) {
				secret = "2";
				num = Integer.parseInt(secret);
			}
			List<FolderBean> list = minService.mypageFolder(host, title, num);
			int folderNum = list.get(0).getFolder_Num();

		}
		return "main";
	}

	@RequestMapping(value = "mypageFolderDelete")
	public String mypageFolderDelete(HttpSession session, Model model, HttpServletRequest request) throws IOException {
		int host = ((AuthInfo) session.getAttribute("authInfo")).getMem_num();

		String id = request.getParameter("id");
		String folderNum = request.getParameter("num");

		if (id != null) {
			minService.folderDelete(folderNum);
		}
		return "./main";
	}

	@RequestMapping(value = "mypageFolderFollow", method = { RequestMethod.GET, RequestMethod.POST })
	public String mypageFolderFollow(HttpSession session, Model model, HttpServletRequest request) throws IOException {
		int host = ((AuthInfo) session.getAttribute("authInfo")).getMem_num();

		FollowBean bean = new FollowBean();

		String id = request.getParameter("id");
		int folderNum = Integer.parseInt(request.getParameter("num"));

		bean.setMem_Num(host);
		bean.setFolder_Num(folderNum);

		if (id != null) {
			minService.folderFollow(bean);
		}
		return "./main";
	}

	@RequestMapping(value = "mypageFolderLike", method = { RequestMethod.GET, RequestMethod.POST })
	public String mypageFolderLike(HttpSession session, Model model, HttpServletRequest request) throws IOException {

		int host = ((AuthInfo) session.getAttribute("authInfo")).getMem_num();
		LikeKeyBean bean = new LikeKeyBean();

		String id = request.getParameter("id");
		int folderNum = Integer.parseInt(request.getParameter("num"));

		bean.setMem_Num(host);
		bean.setLike_Target_Num(folderNum);

		if (id != null) {
			minService.folderLikeke(bean);
		}

		return "./main";
	}
	
}
