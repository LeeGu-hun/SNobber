package service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bean.FollowBean;
import bean.FollowSubmitBean;
import spring.Board;

@Service
public class KuService {
	@Autowired
	private SqlSession sqlSession;

	public List<FollowBean> getFollower(FollowBean mem_Num) {
		List<FollowBean> list = sqlSession.selectList("kuSQL.follower", mem_Num);
		return list;
	}

	public List<FollowBean> getFollowing(FollowBean mem_Num) {
		List<FollowBean> list = sqlSession.selectList("kuSQL.following", mem_Num);
		return list;
	}

	public void apply(FollowSubmitBean bean) {
		sqlSession.delete("kuSQL.followApply", bean);
	}

	public void cancle(FollowSubmitBean bean) {
		sqlSession.insert("kuSQL.followCancle", bean);
	}

	public void applyUpdate(FollowSubmitBean bean) {
		sqlSession.update("kuSQL.applyUpdate", bean);
	}

	public void cancleUpdate(FollowSubmitBean bean) {
		sqlSession.update("kuSQL.cancleUpdate", bean);
	}
	
}
