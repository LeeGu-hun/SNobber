package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import bean.FollowBean;
import bean.LikeKeyBean;
import service.KuService;
import spring.AuthInfo;

@Controller
public class KuController {
	private KuService kuService;

	public void setKuService(KuService kuService) {
		this.kuService = kuService;
	}

	@RequestMapping(value = "/follower", method = RequestMethod.GET)
	public String follower(Model model, HttpSession session) {
		int mem_Num = ((AuthInfo) session.getAttribute("authInfo")).getMem_num();
		FollowBean bean = new FollowBean(mem_Num);
		List<FollowBean> followerBean = kuService.getFollower(bean);
		model.addAttribute("follower", followerBean);
		return "follow/follower";
	}

	@RequestMapping(value = "/following", method = RequestMethod.GET)
	public String follow(Model model, HttpSession session) {
		int mem_Num = ((AuthInfo) session.getAttribute("authInfo")).getMem_num();
		FollowBean bean = new FollowBean(mem_Num);
		List<FollowBean> followingBean = kuService.getFollowing(bean);
		model.addAttribute("following", followingBean);
		return "follow/following";
	}

	@RequestMapping("/likeAdd")
	public void likeAdd(HttpServletRequest request, HttpSession session) {
		int host = ((AuthInfo) session.getAttribute("authInfo")).getMem_num();
		String name = ((AuthInfo) session.getAttribute("authInfo")).getName();
		int num = Integer.parseInt(request.getParameter("num"));
		LikeKeyBean bean = new LikeKeyBean();
		bean.setMem_Num(host);
		bean.setBoard_Num(num);
		bean.setLike_Target_Num(num);
		bean.setMem_Nickname(name);
		kuService.addLike(bean);
	}

	@RequestMapping("/likeDelete")
	public void likeDelete(HttpServletRequest request, HttpSession session) {
		int host = ((AuthInfo) session.getAttribute("authInfo")).getMem_num();
		String name = ((AuthInfo) session.getAttribute("authInfo")).getName();
		int num = Integer.parseInt(request.getParameter("num"));
		LikeKeyBean bean = new LikeKeyBean();
		bean.setMem_Num(host);
		bean.setBoard_Num(num);
		bean.setLike_Target_Num(num);
		bean.setMem_Nickname(name);
		kuService.deleteLike(bean);
	}
}
