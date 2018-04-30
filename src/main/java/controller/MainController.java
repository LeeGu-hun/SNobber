package controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import bean.BoardBean;
import bean.BoardCommand;
import bean.BoardMemberBean;
import bean.FolderBean;
import bean.FolderLikekey;
import bean.FolderListBean;
import bean.FolderUpdateStateBean;
import bean.FolderlikeChangeBean;
import bean.FollowBean;
import bean.FollowFolderBean;
import bean.FollowFolderKeyBean;
import bean.FollowSubmitBean;
import bean.LikeKeyBean;
import bean.ListBean;
import bean.ListBeanScroll;
import bean.LoginCommand;
import bean.MemberBean;
import bean.ReBean;
import bean.SearchKeyBean;
import bean.UpdateStateBean;
import bean.likeChangeBean;
import bean.mypageEditCommand;
import service.BoardService;
import spring.AuthInfo;
import spring.Board;
import spring.Member;

@Controller
public class MainController {
	private BoardService boardService;

	public void setBoardService(BoardService boardService) {
		this.boardService = boardService;
	}

	@RequestMapping("/")
	public String root(LoginCommand loginCommand, @CookieValue(value = "REMEMBER", required = false) Cookie rCookie,
			Model model, HttpSession session) {
		session.setAttribute("test", 0);

		if (rCookie != null) {
			loginCommand.setId(rCookie.getValue());
			loginCommand.setRememberId(true);
		}

		// 폴더 인덱스 리스트
		List<FolderListBean> fList = boardService.folderListInDex();
		model.addAttribute("fList", fList);

		return "login/loginForm";
	}

	@RequestMapping(value = "memberlist")
	public String memberGet(HttpSession session, Model model) {
		List<Member> member = boardService.memberList();
		model.addAttribute("members", member);
		return "member/memberList";
	}

	//////////////////////////// 추가 ///////////////////////////////////
	// 인덱스 파일 리스트 스크롤
	@ResponseBody
	@RequestMapping(value = "/issue_folderScroll", method = RequestMethod.POST)
	public HashMap<String, Object> rootScroll(
			@RequestParam(value = "issue_rowsCount", required = false) int issue_rowsCount, HttpSession session) {
		// int host = ((AuthInfo) session.getAttribute("authInfo")).getMem_num();
		// 폴더 인덱스 리스트
		// int is_rowCount=issue_rowsCount-1;
		List<FolderListBean> fList = boardService.folderListInDexScroll(issue_rowsCount + 1);

		HashMap<String, Object> issuemap = new HashMap<String, Object>();
		List<FolderListBean> issue_allList = boardService.folderListInDexScrollAll();

		for (int w = fList.size() - 1; w < fList.size(); w++) {
			FolderListBean flb = (FolderListBean) fList.get(w);

			String issue_title = flb.getFolder_title();
			int issue_rownum = flb.getRownum();
			int issue_mem_num = flb.getMem_num();
			int issue_fol_num = flb.getFolder_num();
			String issue_mem_nickname = flb.getMem_nickname();
			String issue_mem_photo = flb.getMem_photo();

			issuemap.put("issue_mem_photo", issue_mem_photo);
			issuemap.put("issue_mem_num", issue_mem_num);
			issuemap.put("issue_scrollAddTitle", issue_title);
			issuemap.put("issue_scrollAddRownum", issue_rownum);
			issuemap.put("issue_scrollAddnickname", issue_mem_nickname);
			issuemap.put("issue_scrollAddfoldernum", issue_fol_num);

		}

		issuemap.put("issue_allListsize", issue_allList.size());
		issuemap.put("issue_fListsize", fList.size());
		issuemap.put("issue_rowsCount", issue_rowsCount);

		return issuemap;
	}

	@RequestMapping(value = "mypage/photoEdit")
	public String photoEditGet(HttpSession session, Model model) {
		int host = ((AuthInfo) session.getAttribute("authInfo")).getMem_num();
		Member member = boardService.selectById(host);
		model.addAttribute("member", member);
		return "mypage/photoEdit";
	}

	@RequestMapping(value = "mypage/photoEdit", method = RequestMethod.POST)
	public String photoEditPost(mypageEditCommand command, HttpSession session, HttpServletRequest request,
			Errors errors) {
		int host = ((AuthInfo) session.getAttribute("authInfo")).getMem_num();
		MultipartFile multi = command.getMem_photo();
		String originalFilename = multi.getOriginalFilename();
		String newFilename = "";
		AuthInfo auth = (AuthInfo) session.getAttribute("authInfo");
		Member mem = new Member();
		if (!originalFilename.equals("")) {
			newFilename = System.currentTimeMillis() + "_" + originalFilename;

			String root_path = request.getSession().getServletContext().getRealPath("/");
			String path = root_path + newFilename;
			mem.setMem_Photo(newFilename);
			try {
				File file = new File(path);
				multi.transferTo(file);
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else {
			mem.setMem_Photo("");
		}
		mem.setMem_num(host);
		boardService.photoUpdate(mem);
		return "redirect:/main";
	}

	@RequestMapping("/main")
	public String home(Model model, @ModelAttribute("cmd") BoardCommand boardCommand, HttpSession session,
			@RequestParam(defaultValue = "") String keyword) {
		int host = ((AuthInfo) session.getAttribute("authInfo")).getMem_num();
		FolderBean bean = new FolderBean();
		bean.setMem_Num(host);
		List<FolderBean> folderList = boardService.getFolder(bean);
		model.addAttribute("title", folderList);

		ListBean lb = new ListBean();

		lb.setB_mem_num(host);
		lb.setF_mem_num(host);
		List<BoardBean> list = boardService.boardListTiemLine(lb);

		List<FollowFolderBean> folderfollowList = boardService.myFollowFolder(host);
		model.addAttribute("folderfollowList", folderfollowList);
		List<FolderListBean> fList = boardService.folderListMain(host);
		model.addAttribute("list", list);
		model.addAttribute("fList", fList);
		model.addAttribute("folderfollowList", folderfollowList);
		return "main";
	}

	@RequestMapping(value = "/main", method = RequestMethod.POST)
	public String homePost(HttpSession session, BoardCommand board, HttpServletRequest request) {
		int host = ((AuthInfo) session.getAttribute("authInfo")).getMem_num();
		String name = ((AuthInfo) session.getAttribute("authInfo")).getName();
		MultipartFile multi = board.getBOARD_FILE();
		String originalFilename = multi.getOriginalFilename();
		String newFilename = "";
		Board bb = new Board();
		if (!originalFilename.equals("")) {
			newFilename = System.currentTimeMillis() + "_" + originalFilename;
			String root_path = request.getSession().getServletContext().getRealPath("/");
			String path = root_path + newFilename;
			bb.setBOARD_FILE(newFilename);
			try {
				File file = new File(path);
				multi.transferTo(file);
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else {
			bb.setBOARD_FILE("");
		}
		bb.setMem_Num(host);
		bb.setMem_NickName(name);
		bb.setBOARD_CONTENT(board.getBOARD_CONTENT());
		bb.setFolderMode(board.getFolderMode());
		bb.setWriteMode(board.getWriteMode());
		bb.setSecretMode(board.getSecretMode());

		if (board.getFolderMode().equals("0")) {
			boardService.writeNull(bb);
		} else {
			boardService.write(bb);
		}
		return "redirect:/main";
	}

	// 무한 스크롤~~~~~~~~~~~~~~~~~~
			@ResponseBody
			@RequestMapping(value = "/boardScroll", method = RequestMethod.POST)
			public HashMap<String, Object> boardScroll(HttpSession session,
					@RequestParam(value = "lastbno", required = false) int lastbno,@RequestParam(value = "lastbnoTest", required = false) int lastbnoTest) {
				int host = ((AuthInfo) session.getAttribute("authInfo")).getMem_num();
				ListBeanScroll lbs = new ListBeanScroll();
				/* int row = rowsCount - 1; */
				int lastbnoPlus = lastbnoTest + 1;
				lbs.setB_mem_num(host);
				lbs.setF_mem_num(host);
				lbs.setRowsCount(lastbnoPlus);
				System.out.println("lastbno :"+lastbno);
				ListBean lb = new ListBean();

				lb.setB_mem_num(host);
				lb.setF_mem_num(host);

				List<BoardBean> allList = boardService.showListSize(lb);

				List<BoardBean> list = boardService.boardListScroll(lbs);

				HashMap<String, Object> map = new HashMap<String, Object>();
				map.put("realscrolllastbno",lastbno+1);
				for (int b = lastbno+1 ; b < list.size(); b++) {
					BoardBean bb = (BoardBean) list.get(b);

					String content = bb.getBoard_Content();
					int count=bb.getCount();
					int board_num = bb.getBoard_Num();
					int like_on = bb.getLike_on();
					String mem_nickname = bb.getMem_Nickname();
					int mem_num = bb.getMem_Num();
					String mem_ph=bb.getMem_Photo();
					int a=lastbno++;
					
					System.out.println("파일"+bb.getBoard_File());
					map.put("boarddate"+b, bb.getBoard_Date());	
					
					System.out.println("bb.getBoard_Date():"+bb.getBoard_Date());
					map.put("count"+b, count);	
					map.put("scrollAddFile"+b, bb.getBoard_File());	
					map.put("scrollAddPhoto"+b, mem_ph);
					map.put("scrolllastbno"+b,a);
					map.put("scrollAddCon"+b, content);
					map.put("scrollAddLi"+b, like_on);
					map.put("scrollAddMeN"+b, mem_nickname);
					map.put("scrollAddBoardBum"+b, board_num);
					map.put("scrollAddMeNu"+b, mem_num);
					/*for (String mapkey : map.keySet()){
				        System.out.println("key:"+mapkey+",value:"+map.get(mapkey));
				    }*/


			

				}
				System.out.println("lastbno2 :"+lastbno);
				
				map.put("allList", allList.size());
				map.put("listSize", list.size());
				// map.put("rowsCount", rowsCount);
				map.put("scrollIndex", lastbnoTest);
				return map;
			}

	@ResponseBody
	@RequestMapping(value = "/folderScrollFollow", method = RequestMethod.POST)
	public HashMap<String, Object> followfolderScroll(
			@RequestParam(value = "follow_rowsCount", required = false) int follow_rowsCount, HttpSession session) {
		int host = ((AuthInfo) session.getAttribute("authInfo")).getMem_num();

		FollowFolderKeyBean ffk = new FollowFolderKeyBean();
		int follow_rowsCountPlus = follow_rowsCount + 1;
		ffk.setHost(host);

		ffk.setRown(follow_rowsCountPlus);
		List<FollowFolderBean> followFlist = boardService.myFollowFolderScroll(ffk);
		List<FollowFolderBean> allfollowFlist = boardService.myFollowFolderScrollAll(host);
		HashMap<String, Object> follow_map = new HashMap<String, Object>();

		for (int b = followFlist.size() - 1; b < followFlist.size(); b++) {
			FollowFolderBean bb = (FollowFolderBean) followFlist.get(b);

			String folder_creater = bb.getFolder_creater();
			String folder_title = bb.getFolder_title();

			follow_map.put("scrollAddFolder_creator", folder_creater);
			follow_map.put("scrollAddFolder_title", folder_title);

		}

		follow_map.put("followFlist", followFlist.size());
		follow_map.put("allfollowFlist", allfollowFlist.size());
		follow_map.put("follow_rowsCount", follow_rowsCount);
		return follow_map;
	}

	@RequestMapping(value = "/follow", method = RequestMethod.GET)
	public String following(Model model, HttpSession session) {
		int mem_Num = ((AuthInfo) session.getAttribute("authInfo")).getMem_num();
		FollowBean bean = new FollowBean(mem_Num);
		List<FollowBean> followerBean = boardService.getFollower(bean);
		List<FollowBean> followingBean = boardService.getFollowing(bean);
		model.addAttribute("follower", followerBean);
		model.addAttribute("following", followingBean);
		return "follow/follow";
	}

	@RequestMapping("/followsubmit")
	public String follower(@RequestParam(value = "type", defaultValue = "false") String type,
			@RequestParam(value = "title", defaultValue = "false") String num, HttpSession session) {
		int mem_Num = ((AuthInfo) session.getAttribute("authInfo")).getMem_num();
		int follow_You_Num = Integer.parseInt(num);
		FollowSubmitBean bean = new FollowSubmitBean();
		bean.setMem_Num(mem_Num);
		bean.setFollow_You_Num(follow_You_Num);
		List<FollowSubmitBean> list = null;
		if (type.equals("1")) { // 팔로잉 신청
			boardService.cancle(bean);
			boardService.cancleUpdate(bean);
		} else if (type.equals("2")) { // 팔로워 취소
			boardService.apply(bean);
			boardService.applyUpdate(bean);
		}
		return "redirect:/follow";
	}

	@RequestMapping(value = "/searching", method = RequestMethod.GET)
	public String boardSearchGet() {
		return "serch/searchList";
	}

	@RequestMapping(value = "/searching", method = RequestMethod.POST)
	public String boardSearchPost(@RequestParam(required = false) String[] searchOption,
			@RequestParam(required = false) String keyword, Model model, SearchKeyBean skb) {

		skb.setKeyword(keyword);
		skb.setSearchOption0(searchOption[0]);
		skb.setSearchOption1(searchOption[1]);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyword", keyword);

		int cntboard = 0, cntMember = 0;
		List<BoardBean> boardList = null;
		List<MemberBean> memberList = null;
		try {
			if (searchOption[0].equals("board_content")) {
				boardList = boardService.boardSearchList(skb);
				cntboard = boardService.boardCount(skb);
			} else {
				memberList = boardService.boardSearchList2(skb);
				cntMember = boardService.memberCount(skb);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (searchOption[0].equals("board_content")) {
			map.put("boardList", boardList);
			map.put("cntboard", cntboard);
		} else {
			map.put("memberList", memberList);
			map.put("cntMember", cntMember);
		}
		model.addAttribute("map", map);
		return "serch/searchList";
	}

	@RequestMapping(value = "mypage", method = RequestMethod.GET)
	public String mypage(HttpSession session, Model model) {
		int host = ((AuthInfo) session.getAttribute("authInfo")).getMem_num();
		Member member = boardService.selectById(host);
		model.addAttribute("member", member);
		return "mypage/mypage";
	}

	@RequestMapping(value = "mypage/photo")
	public String photoGet(HttpSession session, Model model) {
		int host = ((AuthInfo) session.getAttribute("authInfo")).getMem_num();
		Member member = boardService.selectById(host);
		model.addAttribute("member", member);
		return "mypage/photo";
	}

	@RequestMapping(value = "mypageEdit", method = RequestMethod.GET)
	public String mypageEditGet(HttpSession session, Model model) {
		int host = ((AuthInfo) session.getAttribute("authInfo")).getMem_num();
		Member member = boardService.selectById(host);
		model.addAttribute("member", member);
		return "mypage/mypageEdit";
	}

	@RequestMapping(value = "mypageEdit", method = RequestMethod.POST)
	public String mypageEditPost(mypageEditCommand command, HttpSession session, Model model,
			HttpServletRequest request) {
		Member mem = new Member();

		int host = ((AuthInfo) session.getAttribute("authInfo")).getMem_num();
		mem.setMem_num(host);
		mem.setMem_Nickname(command.getMem_nickname());
		mem.setMem_Email(command.getMem_email());
		mem.setMem_Password(command.getMem_password());
		mem.setMem_Introduce(command.getMem_introduce());
		AuthInfo auth = (AuthInfo) session.getAttribute("authInfo");
		auth.setName(command.getMem_nickname());
		auth.setEmail(command.getMem_email());
		auth.setIntroduce(command.getMem_introduce());

		boardService.mypageUpdate(mem);
		return "mypage/success";
	}

	@ResponseBody
	@RequestMapping(value = "/boardLikeTest", method = RequestMethod.POST)
	public HashMap<String, Object> boardLikeTest(@RequestParam(value = "board_Num", required = false) int board_Num,
			HttpSession session, @RequestParam(value = "like_on", required = false) int like_on,
			@RequestParam HashMap<String, Object> param, @RequestParam(value = "index") String index) {
		LikeKeyBean lk = new LikeKeyBean();
		likeChangeBean lcb = new likeChangeBean();
		int mem_num = ((AuthInfo) session.getAttribute("authInfo")).getMem_num();
		String mem_nickname = ((AuthInfo) session.getAttribute("authInfo")).getName();
		lk.setBoard_Num(board_Num);
		lk.setLike_Target_Num(board_Num);
		lk.setMem_Nickname(mem_nickname);
		lk.setMem_Num(mem_num);

		lcb.setBoard_Num(board_Num);
		lcb.setMem_Num(mem_num);
		HashMap<String, Object> map = new HashMap<String, Object>();

		if (like_on == 0) {
			boardService.insertLike(lk);
			map.put("test", 0);
			List<UpdateStateBean> updateList = boardService.updateLikeState(lcb);
			map.put("updateList", updateList);

			for (int i = 0; i < updateList.size(); i++) {
				UpdateStateBean bb = (UpdateStateBean) updateList.get(i);
				int count = bb.getCount();
				int like_onNew = bb.getLike_on();
				map.put("count", count);
				map.put("like_onNew", like_onNew);
			}
		} else if (like_on == 2) {
			boardService.reLike(lk);
			map.put("test", 2);
			List<UpdateStateBean> updateList = boardService.updateLikeState(lcb);
			map.put("updateList", updateList.get(0));

			for (int i = 0; i < updateList.size(); i++) {
				UpdateStateBean bb = (UpdateStateBean) updateList.get(i);
				int count = bb.getCount();
				int like_onNew = bb.getLike_on();
				map.put("count", count);
				map.put("like_onNew", like_onNew);
			}

		} else if (like_on == 1) {
			boardService.likeChange1(lcb);
			// map.put("1","1");
			map.put("test", 1);
			List<UpdateStateBean> updateList = boardService.updateLikeState(lcb);
			map.put("updateList", updateList);

			for (int i = 0; i < updateList.size(); i++) {
				UpdateStateBean bb = (UpdateStateBean) updateList.get(i);
				int count = bb.getCount();
				int like_onNew = bb.getLike_on();
				map.put("count", count);
				map.put("like_onNew", like_onNew);
			}
		}
		map.put("board_num", board_Num);
		map.put("index", index);
		return map;
	}

	// 330~ 폴더 라이크로 추가된 부분
	@ResponseBody
	@RequestMapping(value = "/folderLike", method = RequestMethod.POST)
	public HashMap<String, Object> folderLikeIn(@RequestParam(value = "folder_num", required = false) int folder_num,
			HttpSession session, @RequestParam(value = "f_like_on", required = false) int f_like_on,
			@RequestParam(value = "f_index") String f_index) {
		HashMap<String, Object> map = new HashMap<String, Object>();

		int mem_num = ((AuthInfo) session.getAttribute("authInfo")).getMem_num();
		String mem_nickname = ((AuthInfo) session.getAttribute("authInfo")).getName();

		FolderLikekey fk = new FolderLikekey();
		fk.setLike_target_num(folder_num);
		fk.setMem_num(mem_num);
		fk.setMem_nickname(mem_nickname);

		FolderlikeChangeBean flc = new FolderlikeChangeBean();
		flc.setLike_target_num(folder_num);
		flc.setMem_num(mem_num);

		if (f_like_on == 0) {
			boardService.insertFolderLike(fk);
			map.put("folderLike", 0);

			List<FolderUpdateStateBean> fup = boardService.folderLikeupdate(flc);
			map.put("fup", fup);

			for (int i = 0; i < fup.size(); i++) {
				FolderUpdateStateBean bb = (FolderUpdateStateBean) fup.get(i);
				int countF = bb.getCount();
				int like_onNewF = bb.getLike_on();
				map.put("countF", countF);
				map.put("like_onNewF", like_onNewF);
			}

		} else if (f_like_on == 1) {
			boardService.folderlikedelete(flc);
			// map.put("1","1");
			map.put("folderLike", 1);

			List<FolderUpdateStateBean> fup = boardService.folderLikeupdate(flc);
			map.put("fup", fup);

			for (int i = 0; i < fup.size(); i++) {
				FolderUpdateStateBean bb = (FolderUpdateStateBean) fup.get(i);
				int countF = bb.getCount();
				int like_onNewF = bb.getLike_on();
				map.put("countF", countF);
				map.put("like_onNewF", like_onNewF);
			}
		} else if (f_like_on == 2) {
			boardService.folderReLike(flc);
			map.put("folderLike", 2);
			List<FolderUpdateStateBean> fup = boardService.folderLikeupdate(flc);
			map.put("fup", fup);

			for (int i = 0; i < fup.size(); i++) {
				FolderUpdateStateBean bb = (FolderUpdateStateBean) fup.get(i);
				int countF = bb.getCount();
				int like_onNewF = bb.getLike_on();
				map.put("countF", countF);
				map.put("like_onNewF", like_onNewF);
			}
		}
		map.put("folder_num", folder_num);
		map.put("f_index", f_index);
		return map;
	}
}
