package service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bean.BoardBean;
import bean.BoardMemberBean;
import bean.FolderBean;
import bean.FollowBean;
import bean.LikeKeyBean;
import bean.ReBean;
import bean.likeChangeBean;
import spring.Member;

@Service
public class MinService {
	@Autowired
	private SqlSession sqlSession;

	public Member selectById(int memId) {
		String str = Integer.toString(memId);
		Member member = sqlSession.selectOne("memberSQL.getById", str);
		return member;
	}

	public List<BoardBean> mypageSNS(int num) {
		List<BoardBean> list = sqlSession.selectList("minSQL.mypageSNS", num);
		return list;
	}

	public List<BoardBean> mypageProBoard(int num) {
		String str = Integer.toString(num);
		List<BoardBean> list = sqlSession.selectList("minSQL.mypageProBoard", num);
		return list;
	}

	public List<BoardBean> mypageProBoardNam(int num) {
		List<BoardBean> list = sqlSession.selectList("minSQL.mypageProBoardNam", num);
		return list;
	}

	public List<BoardMemberBean> BoardMemberBean(String num) {
		List<BoardMemberBean> list = sqlSession.selectList("minSQL.BoardMemberBean", num);
		return list;
	}

	public List<ReBean> reBean(String num) {
		List<ReBean> list = sqlSession.selectList("minSQL.reBean", num);
		return list;
	}

	public int boardLikeNum(String num) {
		int in = sqlSession.selectOne("minSQL.boardLikeNum", num);
		return in;
	}

	public String boardLike(likeChangeBean num) {
		String result = sqlSession.selectOne("minSQL.boardLike", num);
		return result;
	}

	public List<BoardBean> mypagePro(int num) {
		String str = Integer.toString(num);
		List<BoardBean> list = sqlSession.selectList("minSQL.mypagePro", num);
		return list;
	}

	public List<FolderBean> mypageProNam(int num) {
		String str = Integer.toString(num);
		List<FolderBean> list = sqlSession.selectList("minSQL.mypageProNam", num);
		return list;
	}

	public List<FolderBean> mypageFolderNum(FolderBean bean) {
		List<FolderBean> list = sqlSession.selectList("minSQL.mypageFolderNum", bean);
		return list;
	}

	public void mypageFolder(int num, String title, int secret, String name) {
		FolderBean bean = new FolderBean();
		bean.setMem_Num(num);
		bean.setFolder_Title(title);
		bean.setFolder_secret(secret);
		bean.setMem_Nickname(name);
		sqlSession.insert("minSQL.mypageFolder", bean);
	}

	public void folderDelete(String num) {
		sqlSession.delete("minSQL.folderDelete", num);
	}

	public void mypageBoardDelete(String num) {
		sqlSession.delete("minSQL.mypageBoardDelete", num);
	}

	public void folderFollow(FollowBean bean) {
		sqlSession.insert("minSQL.folderFollow", bean);
	}

	public List<FolderBean> followChck(FolderBean bean) {
		List<FolderBean> list = sqlSession.selectList("minSQL.followChck", bean);
		return list;
	}

	public void folderFollowDelete(FollowBean bean) {
		sqlSession.delete("minSQL.folderFollowDelete", bean);
	}

	public void folderLikeke(LikeKeyBean bean) {
		sqlSession.insert("minSQL.folderLikeke", bean);
	}

	public void folderlikekeDelete(LikeKeyBean bean) {
		sqlSession.delete("minSQL.folderlikekeDelete", bean);
	}

	public List<BoardBean> FolderPage(BoardBean num) {
		List<BoardBean> list = sqlSession.selectList("minSQL.folderPage", num);
		return list;
	}

	public FolderBean folderName(String num) {
		FolderBean bean = sqlSession.selectOne("minSQL.folderName", num);
		return bean;
	}

	public List<BoardBean> mypageWritingView(String num) {
		List<BoardBean> list = sqlSession.selectList("minSQL.mypageWritingView", num);
		return list;
	}

	public void boardReadCount(String num) {
		sqlSession.update("minSQL.boardReadCount", num);
	}

	public void mypageRe(ReBean bean) {
		sqlSession.insert("minSQL.mypageRe", bean);
	}

	public void deleteRe(String num) {
		sqlSession.delete("minSQL.deleteRe", num);
	}

	public void modifyRe(String num) {
		sqlSession.update("minSQL.modifyRe", num);
	}

	public void mypageUpdate(Member mem) {
		sqlSession.update("memberSQL.memberUpdate", mem);
	}

	public void photoUpdate(Member mem) {
		sqlSession.update("memberSQL.photoUpdate", mem);
	}

	public String getFollow(FollowBean bean) {
		String result = sqlSession.selectOne("minSQL.getFollow", bean);
		return result;
	}

	public List<FollowBean> getFollower(FollowBean mem_Num) {
		List<FollowBean> list = sqlSession.selectList("kuSQL.follower", mem_Num);
		return list;
	}

	public List<FollowBean> getFollowing(FollowBean mem_Num) {
		List<FollowBean> list = sqlSession.selectList("kuSQL.following", mem_Num);
		return list;
	}

	public List<BoardBean> notFollowPro(int pageNum) {
		List<BoardBean> list = sqlSession.selectList("minSQL.notFollowPro", pageNum);
		return list;
	}

	public List<BoardBean> notFollowSNS(int pageNum) {
		List<BoardBean> list = sqlSession.selectList("minSQL.notFollowSNS", pageNum);
		return list;
	}
}
