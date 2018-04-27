package controller;

import java.util.List;

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
import exception.MemberNotFoundException;
import service.MemberService;
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

	@RequestMapping("member/detail/{id}")
	public String memberDetail(@PathVariable("id") String memId, Model model) {
		Member member = memberService.selectById(memId);
		model.addAttribute("member", member);
		return "member/memberDetail";
	}
	
	@RequestMapping(value = "/deletemember/{id}", method = RequestMethod.GET)
	public String deleteConGet() {
		return "member/deleteMember";
	}
	
	@RequestMapping(value="deletemember/{id}", method=RequestMethod.POST)
	public String deleteConPost(@PathVariable("id") int memId, Member mem) {
		int host = memId;
			memberService.delete(host);
		return "redirect:/main";
	}
	
	@RequestMapping(value = "/repairmember/{id}", method = RequestMethod.GET)
	public String repairConGet() {
		return "member/repairMember";
	}
	
	@RequestMapping(value="repairmember/{id}", method=RequestMethod.POST)
	public String repairConPost(@PathVariable("id") int memId, Member mem) {
		int host = memId;
			memberService.repair(host);
		return "redirect:/main";
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
