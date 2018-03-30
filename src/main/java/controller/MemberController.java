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
	public String memberDetail(@PathVariable("id") Long memId, Model model) {
		Member member = memberService.selectById(memId);
		model.addAttribute("member", member);
		return "member/memberDetail";
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
