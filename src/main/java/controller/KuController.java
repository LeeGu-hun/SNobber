package controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import bean.FollowBean;
import bean.FollowSubmitBean;
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
}
