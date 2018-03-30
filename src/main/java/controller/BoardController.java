package controller;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import bean.BoardBean;
import bean.BoardCommand;
import service.BoardService;
import spring.AuthInfo;
import spring.RegisterRequest;

@Controller
public class BoardController {
	@Autowired
	private BoardService boardService;

	public void setBoardService(BoardService boardService) {
		this.boardService = boardService;
	}

	@RequestMapping("/BoardDetail/{id}")
	public String boardDetail(@PathVariable("id") Long bId, Model model) {
		BoardBean board = boardService.boardView(bId);
		model.addAttribute("board", board);
		String a = Long.toString(bId);
		int num = Integer.parseInt(a);
		board.setBOARD_NUM(num);
		boardService.readCnt(board);
		return "board/qna_board_view";
	}

	@RequestMapping(value = "/BoardWrite", method = RequestMethod.GET)
	public String boardWriteGet() {
		return "board/qna_board_write";
	}

	@RequestMapping(value = "/BoardWrite", method = RequestMethod.POST)
	public String boardWritePost(HttpSession session, BoardCommand board, HttpServletRequest request) {
		System.out.println(board.getBOARD_FILE().toString());
		MultipartFile multi = board.getBOARD_FILE();
		// 파일이 여러개 인경우 업로드 파일리스트
		// List<MultipartFile> files = board.getBOARD_FILE();

		String originalFileName = multi.getOriginalFilename(), newFileName = "";
		BoardBean bb = new BoardBean();
		if (!originalFileName.equals("")) {
			// originalFileName = multi.getOriginalFilename();
			// 파일명이 중복 되지 않게 파일명에 시간추가
			newFileName = System.currentTimeMillis() + "_" + originalFileName;
			// 파일 업로드 경로
			String root_path = request.getSession().getServletContext().getRealPath("/");
			String attach_path = "upload/";
			String path = root_path + attach_path + newFileName;
			bb.setBOARD_FILE(newFileName);
			try {
				File file = new File(path);
				multi.transferTo(file);
			} catch (Exception e) {
			}
		} else {
			bb.setBOARD_FILE("");
		}
		AuthInfo auth = (AuthInfo) session.getAttribute("authInfo");

		bb.setBOARD_NAME(auth.getName());
		bb.setBOARD_PASS(board.getBOARD_PASS());
		bb.setBOARD_SUBJECT(board.getBOARD_SUBJECT());
		bb.setBOARD_CONTENT(board.getBOARD_CONTENT());
		bb.setHOST(auth.getId());
		bb.setWRITER(auth.getId());
		boardService.boardInsert(bb);
		return "redirect:/main";
	}

	@RequestMapping(value = "/BoardDelete/{id}", method = RequestMethod.GET)
	public String boardDeleteGet(@PathVariable("id") Long bId) {
		return "board/qna_board_delete";
	}

	@RequestMapping(value = "/BoardDelete/{id}", method = RequestMethod.POST)
	public String boardDeletePost(@PathVariable("id") Long bId) {
		boardService.boardDelete(bId);

		return "redirect:/main";
	}

	@RequestMapping(value = "/BoardReply/{id}", method = RequestMethod.GET)
	public String boardReplyGet(@PathVariable("id") Long bId, Model model) {
		BoardBean board = boardService.boardView(bId);
		model.addAttribute("board", board);
		return "board/qna_board_reply";
	}

	@RequestMapping(value = "/BoardReply/{id}", method = RequestMethod.POST)
	public String boardReplyPost(@PathVariable("id") Long bId, BoardCommand board, HttpSession session) {
		AuthInfo auth = (AuthInfo) session.getAttribute("authInfo");
		BoardBean bb = new BoardBean();
		BoardBean bean = boardService.boardView(bId);
		int lev = bean.getBOARD_RE_LEV(), seq = bean.getBOARD_RE_SEQ();
		bb.setBOARD_RE_REF(bean.getBOARD_RE_REF());
		bb.setBOARD_RE_LEV(lev);
		bb.setBOARD_RE_SEQ(seq);
		boardService.boardUpdateReply(bb);
		lev++;
		seq++;

		bb.setBOARD_NAME(bean.getBOARD_NAME());
		bb.setBOARD_PASS(bean.getBOARD_PASS());
		bb.setBOARD_FILE(bean.getBOARD_FILE());
		bb.setBOARD_SUBJECT(board.getBOARD_SUBJECT());
		bb.setBOARD_CONTENT(board.getBOARD_CONTENT());
		bb.setBOARD_RE_LEV(lev);
		bb.setBOARD_RE_SEQ(seq);
		bb.setHOST(auth.getId());
		bb.setWRITER(auth.getId());
		if (bb.getBOARD_FILE() == null) {
			bb.setBOARD_FILE("");
		}
		boardService.boardReply(bb);
		return "redirect:/main";
	}

	@RequestMapping(value = "/BoardModify/{id}", method = RequestMethod.GET)
	public String boardModifyGet(@PathVariable("id") Long bId, Model model) {
		BoardBean board = boardService.boardView(bId);
		model.addAttribute("board", board);
		return "board/qna_board_modify";
	}

	@RequestMapping(value = "/BoardModify/{id}", method = RequestMethod.POST)
	public String boardModifyPost(BoardCommand board, @PathVariable("id") Long bId) {
		BoardBean bb = new BoardBean();
		String a = Long.toString(bId);
		int num = Integer.parseInt(a);
		bb.setBOARD_NUM(num);
		bb.setBOARD_SUBJECT(board.getBOARD_SUBJECT());
		bb.setBOARD_CONTENT(board.getBOARD_CONTENT());
		boardService.boardUpdate(bb);
		return "redirect:/main";
	}
}
