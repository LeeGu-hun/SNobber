package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.TypeMismatchException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import bean.ListCommand;
import bean.MemberBean;
import exception.MemberNotFoundException;
import service.MemberService;
import spring.AuthInfo;
import spring.Member;

@Controller
public class MemberController {
	private MemberService memberService;

	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}

	@RequestMapping("member/list")
	public String memberList(Model model, @ModelAttribute("cmd") ListCommand listCommand) {
		List<Member> members = memberService.selectByRegdate(listCommand);
		model.addAttribute("members", members);
		return "member/memberList";
	}

	@RequestMapping("memberdetail/{id}")
	public String memberDetail(@PathVariable("id") String memId, Model model) {
		Member member = memberService.selectById(memId);
		model.addAttribute("member", member);
		return "member/memberDetail";
	}

	@RequestMapping("deletemember/{id}")
	public String memberDelete(@PathVariable("id") String memId, Model model) {
		Member member = memberService.selectById(memId);
		model.addAttribute("member", member);
		return "member/memberDetail";
	}

	@RequestMapping(value = "memberlist/deletemem")
	public String deleteConGet(Member mem, HttpServletRequest request) {
		String name = request.getParameter("name");
		System.out.println(name);
		memberService.delete(name);
		return "redirect:/memberlist";
	}

	@RequestMapping(value = "memberdetail/stopmem")
	public String deleteConPost(MemberBean mem) {
		int host = mem.getMem_num();
		memberService.stop(host);
		return "redirect:/memberlist";
	}

	@RequestMapping(value = "/stopmember/{id}", method = RequestMethod.GET)
	public String stopConGet(@PathVariable("id") String memId, Model model) {
		Member member = memberService.selectById(memId);
		model.addAttribute("member", member);
		return "member/stopMember";
	}

	@RequestMapping(value = "/repairmember/{id}", method = RequestMethod.GET)
	public String repairConGet(@PathVariable("id") String memId, Model model) {
		Member member = memberService.selectById(memId);
		model.addAttribute("member", member);
		return "member/repairMember";
	}

	@RequestMapping(value = "memberdetail/repairmem")
	public String repairConPost(MemberBean mem) {
		int host = mem.getMem_num();
		memberService.repair(host);
		return "redirect:/memberlist";
	}

	@RequestMapping(value = "outmem")
	public String outCon(HttpSession session) {
		int host = ((AuthInfo) session.getAttribute("authInfo")).getMem_num();
		memberService.delete(host);
		return "redirect:/logout";
	}

	@ExceptionHandler(TypeMismatchException.class)
	public String handleTypeMismatchException() {
		return "member/invalidId";
	}

	@ExceptionHandler(MemberNotFoundException.class)
	public String handleMemberNotFoundException() {
		return "member/noMember";
	}

	@ExceptionHandler(EmptyResultDataAccessException.class)
	public String handleEmptyResultDataAccessException() {
		return "member/noMember";
	}

}
