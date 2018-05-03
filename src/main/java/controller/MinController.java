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
import service.MinService;
import spring.AuthInfo;
import spring.Member;

@Controller
public class MinController {
	private MinService minService;

	public void setMinService(MinService minService) {
		this.minService = minService;
	}

	@RequestMapping(value = "mypagePro") // 留덉씠�럹�씠吏� 泥� 李�
	public String mypagePro(HttpSession session, Model model, HttpServletRequest request) throws IOException {
		int host = ((AuthInfo) session.getAttribute("authInfo")).getMem_num();

		if (request.getParameter("num") != null) {
			int pageNum = Integer.parseInt(request.getParameter("num"));
			FollowBean erBean = null;
			FollowBean ingBean = null;

			model.addAttribute("host", host);
			Member member = minService.selectById(pageNum);
			model.addAttribute("member", member);

			if (host == pageNum) { // �궡 �럹�씠吏�濡� 媛��뒗嫄�
				List<BoardBean> folder = minService.mypagePro(pageNum);
				model.addAttribute("folder", folder);
				List<BoardBean> boardProBoard = minService.mypageProBoard(pageNum);
				model.addAttribute("boardProBoard", boardProBoard);

				erBean = new FollowBean(host);
				ingBean = new FollowBean(host);
			} else if (host != pageNum) { // 남의 페이지에 갔을때
				erBean = new FollowBean(pageNum);
				ingBean = new FollowBean(pageNum);
				List<FolderBean> folder = minService.mypageProNam(pageNum);
				for (int i = 0; i < folder.size(); i++) {
					FolderBean bean = new FolderBean();
					bean.setMem_Num(host);
					bean.setFolder_Num(folder.get(i).getFolder_Num());

					// 라이크 테이블로 접근해서 해당 행이 있는지 검열
					List<FolderBean> listLastBean = minService.mypageFolderNum(bean);
					if (listLastBean.size() == 1) {
						folder.get(i).setLike_on(1);
					} else {
						folder.get(i).setLike_on(0);
					}

					List<FolderBean> followChck = minService.followChck(bean);
					if (followChck.size() == 1) {
						folder.get(i).setFollow_on(1);
					} else {
						folder.get(i).setFollow_on(0);
					}
				}

				model.addAttribute("folder", folder);

				FollowBean bean = new FollowBean();
				bean.setMem_Num(host);
				bean.setFollow_You_Num(pageNum);
				String follow = minService.getFollow(bean);
				// 남글 가져오기
				if (follow == null || follow.equals("2")) {
					List<BoardBean> boardProBoard = minService.notFollowPro(pageNum);
					model.addAttribute("boardProBoard", boardProBoard);
				} else {
					List<BoardBean> boardProBoard = minService.mypageProBoardNam(pageNum);
					model.addAttribute("boardProBoard", boardProBoard);
				}
				model.addAttribute("follow", follow);
			}
			List<FollowBean> followerBean = minService.getFollower(erBean);
			List<FollowBean> followingBean = minService.getFollowing(ingBean);
			model.addAttribute("follower", followerBean);
			model.addAttribute("following", followingBean);
			return "mypage/mypagePro";
		}
		return "./main";
	}

	@RequestMapping(value = "mypageSNS") // sns�겢由� �떆
	public String mypageSns(HttpSession session, Model model, HttpServletRequest request) throws IOException {
		int pageNum = Integer.parseInt(request.getParameter("num"));
		int host = ((AuthInfo) session.getAttribute("authInfo")).getMem_num();
		model.addAttribute("host", host);
		Member member = minService.selectById(pageNum);
		model.addAttribute("member", member);

		FollowBean erBean = null;
		FollowBean ingBean = null;
		if (pageNum == host) {
			erBean = new FollowBean(host);
			ingBean = new FollowBean(host);
			List<BoardBean> boardSNS = minService.mypageSNS(pageNum);
			model.addAttribute("boardSNS", boardSNS);
		} else {
			FollowBean bean = new FollowBean();
			bean.setMem_Num(host);
			bean.setFollow_You_Num(pageNum);
			String follow = minService.getFollow(bean);
			model.addAttribute("follow", follow);
			if (follow == null || follow.equals("2")) {
				List<BoardBean> boardSNS = minService.notFollowSNS(pageNum);
				model.addAttribute("boardSNS", boardSNS);
			} else {
				List<BoardBean> boardSNS = minService.mypageSNS(pageNum);
				model.addAttribute("boardSNS", boardSNS);
			}
			erBean = new FollowBean(pageNum);
			ingBean = new FollowBean(pageNum);
		}
		List<FollowBean> followerBean = minService.getFollower(erBean);
		List<FollowBean> followingBean = minService.getFollowing(ingBean);
		model.addAttribute("follower", followerBean);
		model.addAttribute("following", followingBean);
		return "mypage/mypageSNS";
	}

	@RequestMapping(value = "mypageFolder", method = RequestMethod.GET) // �뤃�뜑 李쎌쑝濡� �씠�룞
	public String mypageFolder(HttpSession session, Model model, HttpServletRequest request,
			HttpServletResponse response) throws IOException {

		if (session.equals(null)) {
			response.setContentType("text/html; charset=UTF-8");

			PrintWriter out = response.getWriter();

			out.println("<script>alert('濡쒓렇�씤�씠 �븘�슂�빀�땲�떎'); " + "location.href='/';</script>");

			out.flush();
		}
		int host = ((AuthInfo) session.getAttribute("authInfo")).getMem_num();
		model.addAttribute("host", host);

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

	@RequestMapping(value = "mypageWritingView") // 占쏙옙 占쏙옙占쏙옙
	public String mypageWritionView(HttpSession session, Model model, HttpServletRequest request) throws IOException {
		int host = ((AuthInfo) session.getAttribute("authInfo")).getMem_num();
		String num = request.getParameter("num");
		minService.boardReadCount(num);
		model.addAttribute("host", host);
		List<BoardMemberBean> boardMember = minService.BoardMemberBean(num);
		model.addAttribute("bm", boardMember);
		int likeNum = minService.boardLikeNum(num);
		model.addAttribute("likeNum", likeNum);
		List<ReBean> re = minService.reBean(num);
		model.addAttribute("re", re);

		likeChangeBean likeBean = new likeChangeBean();
		likeBean.setBoard_Num(Integer.parseInt(num));
		likeBean.setMem_Num(host);

		String like = minService.boardLike(likeBean);
		model.addAttribute("like", like);
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

	@RequestMapping(value = "modifyRe")
	public String modifyRe(HttpSession session, Model model, HttpServletRequest request) throws IOException {
		int host = ((AuthInfo) session.getAttribute("authInfo")).getMem_num();
		String num = request.getParameter("num");

		minService.modifyRe(num);

		return "./main";
	}

	@RequestMapping(value = "deleteRe")
	public String deleteRe(HttpSession session, Model model, HttpServletRequest request) throws IOException {
		int host = ((AuthInfo) session.getAttribute("authInfo")).getMem_num();
		String num = request.getParameter("num");

		minService.deleteRe(num);

		return "./main";
	}

	@RequestMapping(value = "mypageBoardDelete")
	public String mypageBoardDelete(HttpSession session, Model model, HttpServletRequest request) throws IOException {
		int host = ((AuthInfo) session.getAttribute("authInfo")).getMem_num();
		String num = request.getParameter("num");

		minService.mypageBoardDelete(num);

		return "./main";
	}

	@RequestMapping(value = "mypageFolderCreate", method = { RequestMethod.GET, RequestMethod.POST }) // 占쏙옙占쏙옙 占쏙옙占쏙옙占�
	public String mypageFolderCreate(HttpSession session, Model model, HttpServletRequest request) throws IOException {
		int host = ((AuthInfo) session.getAttribute("authInfo")).getMem_num();
		String name = ((AuthInfo) session.getAttribute("authInfo")).getName();
		String id = request.getParameter("id");

		if (id.equals("folder_create_btn")) {
			int num = 0;
			String title = request.getParameter("title");
			String secret = request.getParameter("secret");

			if (secret.equals("占쏙옙占쏙옙")) {
				secret = "1";
				num = Integer.parseInt(secret);
			} else if (secret.equals("占쏙옙占쏙옙占�")) {
				secret = "2";
				num = Integer.parseInt(secret);
			}
			minService.mypageFolder(host, title, num, name);

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

		FolderBean Fbean = new FolderBean();
		Fbean.setMem_Num(host);
		Fbean.setFolder_Num(folderNum);
		List<FolderBean> listLastBean = minService.followChck(Fbean);

		bean.setMem_Num(host);
		bean.setFolder_Num(folderNum);

		if (listLastBean.size() == 0) {
			if (id != null) {
				minService.folderFollow(bean);
				// 없다면 추가
			}
		} else {
			minService.folderFollowDelete(bean);
			// 있다면 삭제
		}
		return "./main";
	}

	@RequestMapping(value = "mypageFolderLike", method = { RequestMethod.GET, RequestMethod.POST })
	public String mypageFolderLike(HttpSession session, Model model, HttpServletRequest request) throws IOException {

		int host = ((AuthInfo) session.getAttribute("authInfo")).getMem_num();
		LikeKeyBean bean = new LikeKeyBean();

		String id = request.getParameter("id");
		int folderNum = Integer.parseInt(request.getParameter("num"));

		FolderBean Fbean = new FolderBean();
		Fbean.setMem_Num(host);
		Fbean.setFolder_Num(folderNum);
		List<FolderBean> listLastBean = minService.mypageFolderNum(Fbean);

		bean.setMem_Num(host);
		bean.setLike_Target_Num(folderNum);

		if (listLastBean.size() == 0) {
			if (id != null) {
				minService.folderLikeke(bean);
				// 없다면 추가
			}
		} else {
			minService.folderlikekeDelete(bean);
			// 있다면 삭제
		}
		return "./main";
	}
}
