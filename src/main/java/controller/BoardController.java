package controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import bean.BoardCommand;
import bean.BoardMemberBean;
import bean.FolderBean;
import service.BoardService;
import spring.AuthInfo;

@Controller
public class BoardController {
	@Autowired
	BoardService boardService;

	public void setBoardService(BoardService boardService) {
		this.boardService = boardService;
	}
	
	@RequestMapping(value = "/boardEdit", method = RequestMethod.GET)
	public String boardEditGet(Model model, HttpSession session, HttpServletRequest request) {
		int host = ((AuthInfo) session.getAttribute("authInfo")).getMem_num();
		String num = request.getParameter("num");
		FolderBean bean = new FolderBean();
		bean.setMem_Num(host);
		List<FolderBean> list = boardService.getFolder(bean);
		model.addAttribute("title", list);
		BoardMemberBean boardMember = boardService.getBoard(num);
		model.addAttribute("bm", boardMember);
		return "board/board_edit";
	}
	
	@RequestMapping(value = "/boardEdit", method = RequestMethod.POST)
	public String boardEditPost(HttpSession session, BoardCommand bean, HttpServletRequest request) {
		int host = ((AuthInfo) session.getAttribute("authInfo")).getMem_num();
		String num = request.getParameter("board_Num");
		MultipartFile multi = bean.getBoard_File();
		String originalFilename = multi.getOriginalFilename();
		String newFilename = "";
		AuthInfo auth = (AuthInfo) session.getAttribute("authInfo");
		BoardMemberBean bm = new BoardMemberBean();
		bm.setBoard_Num(Integer.parseInt(num));
		bm.setBoard_Secret(bean.getSecretMode());
		bm.setBoard_Content(bean.getBOARD_CONTENT());
		if (!originalFilename.equals("")) {
			newFilename = System.currentTimeMillis() + "_" + originalFilename;

			String root_path = request.getSession().getServletContext().getRealPath("/");
			String path = root_path + newFilename;
			bm.setBoard_File(newFilename);
			try {
				File file = new File(path);
				multi.transferTo(file);
			} catch (IOException e) {
				e.printStackTrace();
			}
			boardService.editBoardy(bm);
		} else {
			boardService.editBoard(bm);
		}
		return "redirect:/mypagePro?num=" + host;
	}
}
