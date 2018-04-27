package service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.SessionAttributes;

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
import bean.MemberBean;
import bean.ReBean;
import bean.SearchKeyBean;
import bean.UpdateStateBean;
import bean.likeChangeBean;
import spring.Board;
import spring.Member;

@Service
public class BoardService {
	@Autowired
	private SqlSession sqlSession;

	public List<BoardBean> boardListTiemLine(ListBean lb) {
		List<BoardBean> list = sqlSession.selectList("boardSQL.boardList", lb);
		return list;
	}

	public List<Member> memberList() {
		List<Member> results = sqlSession.selectList("memberSQL.getMemberList");
		return results;
	}
	public List<BoardBean> boardListScroll(ListBeanScroll lb) {

		List<BoardBean> list = sqlSession.selectList("boardSQL.boardListScroll", lb);
		return list;
	}

	public List<BoardBean> showListSize(ListBean lb) {

		List<BoardBean> list = sqlSession.selectList("boardSQL.showListSize", lb);
		return list;
	}

	public List<BoardBean> boardSearchList(SearchKeyBean skb) throws Exception {
		List<BoardBean> list = sqlSession.selectList("boardSQL.searchBoard", skb);
		return list;
	}

	public List<MemberBean> boardSearchList2(SearchKeyBean skb) throws Exception {
		List<MemberBean> list = sqlSession.selectList("boardSQL.searchMember", skb);
		return list;
	}

	public int boardCount(SearchKeyBean skb) {
		int cntb = sqlSession.selectOne("boardSQL.count", skb);
		return cntb;
	}

	public int memberCount(SearchKeyBean skb) {
		int cntm = sqlSession.selectOne("boardSQL.countMem", skb);
		return cntm;
	}

	public Member selectById(int memId) {
		String str = Integer.toString(memId);

		Member member = sqlSession.selectOne("memberSQL.getById", str);
		return member;
	}

	public List<FollowBean> getFollower(FollowBean mem_Num) {
		List<FollowBean> list = sqlSession.selectList("memberSQL.follower", mem_Num);
		return list;
	}

	public List<FollowBean> getFollowing(FollowBean mem_Num) {
		List<FollowBean> list = sqlSession.selectList("memberSQL.following", mem_Num);
		return list;
	}

	public void apply(FollowSubmitBean bean) {
		sqlSession.delete("memberSQL.followApply", bean);
	}

	public void cancle(FollowSubmitBean bean) {
		sqlSession.insert("memberSQL.followCancle", bean);
	}

	public void applyUpdate(FollowSubmitBean bean) {
		sqlSession.update("memberSQL.applyUpdate", bean);
	}

	public void cancleUpdate(FollowSubmitBean bean) {
		sqlSession.update("memberSQL.cancleUpdate", bean);
	}

	public List<BoardBean> mypageSNS(int num) {
		String str = Integer.toString(num);
		List<BoardBean> list = sqlSession.selectList("boardSQL.mypageSNS", num);
		return list;
	}

	public List<BoardBean> mypageProBoard(int num) {
		String str = Integer.toString(num);
		List<BoardBean> list = sqlSession.selectList("boardSQL.mypageProBoard", num);
		return list;
	}

	public List<BoardBean> mypageProBoardNam(int num) {
		String str = Integer.toString(num);
		List<BoardBean> list = sqlSession.selectList("boardSQL.mypageProBoardNam", num);
		return list;
	}

	public List<BoardMemberBean> BoardMemberBean(String num) {
		List<BoardMemberBean> list = sqlSession.selectList("boardSQL.BoardMemberBean", num);
		return list;
	}

	public List<ReBean> reBean(String num) {
		List<ReBean> list = sqlSession.selectList("boardSQL.reBean", num);
		return list;
	}

	public int boardLikeNum(String num) {
		int in = sqlSession.selectOne("boardSQL.boardLikeNum", num);
		return in;
	}

	public List<likeChangeBean> boardLike(String num) {
		List<likeChangeBean> list = sqlSession.selectList("boardSQL.boardLike", num);
		return list;
	}

	public List<BoardBean> mypagePro(int num) {
		String str = Integer.toString(num);
		List<BoardBean> list = sqlSession.selectList("boardSQL.mypagePro", num);
		return list;
	}

	public List<BoardBean> mypageProNam(int num) {
		String str = Integer.toString(num);
		List<BoardBean> list = sqlSession.selectList("boardSQL.mypageProNam", num);
		return list;
	}

	public List<FolderBean> mypageFolder(int num, String title, int secret) {
		FolderBean bean = new FolderBean();
		bean.setMem_Num(num);
		bean.setFolder_Title(title);
		bean.setFolder_secret(secret);
		sqlSession.insert("boardSQL.mypageFolder", bean);
		List<FolderBean> list = sqlSession.selectList("boardSQL.mypageFolderView", title);
		return list;
	}

	public void folderDelete(String num) {
		sqlSession.delete("boardSQL.folderDelete", num);
	}

	public void mypageBoardDelete(String num) {
		sqlSession.delete("boardSQL.mypageBoardDelete", num);
	}

	public void folderFollow(FollowBean bean) {
		sqlSession.insert("boardSQL.folderFollow", bean);
	}

	public void folderLikeke(LikeKeyBean bean) {
		sqlSession.insert("boardSQL.folderLikeke", bean);
	}

	public List<BoardBean> FolderPage(BoardBean num) {
		List<BoardBean> list = sqlSession.selectList("boardSQL.folderPage", num);
		return list;
	}

	public String folderName(String num) {
		String str = sqlSession.selectOne("boardSQL.folderName", num);
		return str;
	}

	public List<BoardBean> mypageWritingView(String num) {
		List<BoardBean> list = sqlSession.selectList("boardSQL.mypageWritingView", num);
		return list;
	}

	public void boardReadCount(String num) {
		sqlSession.update("boardSQL.boardReadCount", num);
	}

	public void mypageRe(ReBean bean) {
		sqlSession.insert("boardSQL.mypageRe", bean);
	}

	public void deleteRe(String num) {
		sqlSession.delete("boardSQL.deleteRe", num);
	}

	public void modifyRe(String num) {
		sqlSession.update("boardSQL.modifyRe", num);
	}

	public void mypageUpdate(Member mem) {
		sqlSession.update("memberSQL.memberUpdate", mem);
	}

	public void photoUpdate(Member mem) {
		sqlSession.update("memberSQL.photoUpdate", mem);
	}

	// 라이크 입력1
	public void insertLike(LikeKeyBean lk) {
		insertLikeOne(lk);
		sqlSession.update("boardSQL.likeTwo", lk);

	}

	// 라이크 입력2
	public void insertLikeOne(LikeKeyBean lk) {
		sqlSession.insert("boardSQL.likeOne", lk);
	}

	public void reLike(LikeKeyBean lk) {
		sqlSession.update("boardSQL.reLike", lk);
	}

	// 라이크 취소
	public void likeChange1(likeChangeBean lk) {
		sqlSession.update("boardSQL.likeChange1", lk);
	}

	// 에이젝스 실행 후 라이크 상태랑 카운트 업데이트,
	public List<UpdateStateBean> updateLikeState(likeChangeBean lcb) {
		List<UpdateStateBean> list = sqlSession.selectList("boardSQL.likeUpdate", lcb);
		return list;
	}

	// 130~폴더 리스트, 라이크
	public List<FolderListBean> folderListMain(int host) {

		List<FolderListBean> fList = sqlSession.selectList("boardSQL.folderListMain", host);
		return fList;
	}

	// 인덱스 페이지 + 스크롤 230~248
	public List<FolderListBean> folderListInDex() {

		List<FolderListBean> fList = sqlSession.selectList("boardSQL.folderListInDex");
		return fList;
	}

	public List<FolderListBean> folderListInDexScroll(int rows) {

		List<FolderListBean> fList = sqlSession.selectList("boardSQL.folderListInDexScroll", rows);
		return fList;
	}

	public List<FolderListBean> folderListInDexScrollAll() {

		List<FolderListBean> fList = sqlSession.selectList("boardSQL.folderListInDexScrollAll");
		return fList;
	}

	public void insertFolderLike(FolderLikekey flk) {

		sqlSession.insert("boardSQL.folderLike", flk);
	}

	public List<FolderUpdateStateBean> folderLikeupdate(FolderlikeChangeBean flc) {
		List<FolderUpdateStateBean> list = sqlSession.selectList("boardSQL.folderlikeUpdate", flc);
		return list;
	}

	public void folderlikedelete(FolderlikeChangeBean lcb) {
		sqlSession.update("boardSQL.folderlikeChange", lcb);
	}

	public void folderReLike(FolderlikeChangeBean lcb) {
		sqlSession.update("boardSQL.folderReLike", lcb);
	}

	public List<FollowFolderBean> myFollowFolder(int host) {
		List<FollowFolderBean> fl = sqlSession.selectList("boardSQL.myFollowFolder", host);
		return fl;
	}

	// 팔로우 폴더 스크롤
	public List<FollowFolderBean> myFollowFolderScroll(FollowFolderKeyBean ffk) {
		List<FollowFolderBean> fl = sqlSession.selectList("boardSQL.myFollowFolderScroll", ffk);
		return fl;
	}

	public List<FollowFolderBean> myFollowFolderScrollAll(int host) {
		List<FollowFolderBean> fl = sqlSession.selectList("boardSQL.myFollowFolderScrollAll", host);
		return fl;
	}

	public List<FolderBean> getFolder(FolderBean bean) {
		List<FolderBean> list = sqlSession.selectList("boardSQL.getFolder", bean);
		return list;
	}

	public void write(Board board) {
		sqlSession.insert("boardSQL.write", board);
	}

	public void writeNull(Board board) {
		sqlSession.insert("boardSQL.writeNull", board);
	}

	public BoardMemberBean getBoard(String num) {
		BoardMemberBean bean = sqlSession.selectOne("boardSQL.getBoard", num);
		return bean;
	}

	public void editBoard(BoardMemberBean bm) {
		sqlSession.update("boardSQL.editBoard", bm);
	}
}
