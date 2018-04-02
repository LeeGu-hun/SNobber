package service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bean.BoardBean;
import bean.BoardCommand;
import bean.PageBean;
import exception.BoardNotFoundException;

@Service
public class BoardService {
	@Autowired
	private SqlSession sqlSession;

	public BoardBean boardView(Long num) {
		// 보드 맵퍼에 셀렉트 값 하나일때 셀렉트 원 보드맵퍼 네임 보드sql의 보드뷰
		BoardBean board = sqlSession.selectOne("boardSQL.boardView", num);
		if (board == null)
			throw new BoardNotFoundException();
		return board;
	}

	public List<BoardBean> boardList(BoardCommand boardCommand, String name) {
		boardCommand.setBOARD_NAME(name);
		List<BoardBean> board = sqlSession.selectList("boardSQL.boardList", boardCommand);
		if (board == null)
			throw new BoardNotFoundException();
		return board;
	}

	public void boardInsert(BoardBean bb) {
		sqlSession.insert("boardSQL.boardInsert", bb);
	}

	public void boardDelete(Long id) {
		sqlSession.delete("boardSQL.boardDelete", id);
	}

	public void boardUpdate(BoardBean board) {
		sqlSession.update("boardSQL.boardUpdate", board);
	}

	public void boardUpdateReply(BoardBean bb) {
		sqlSession.update("boardSQL.boardUpdateReply", bb);
	}

	public void boardReply(BoardBean bb) {
		sqlSession.insert("boardSQL.boardReply", bb);
	}

	public void readCnt(BoardBean bb) {
		sqlSession.update("boardSQL.boardRedCnt", bb);
	}

	public int boardCount(String searchOption, String keyword, String host) {
		PageBean pb = new PageBean(0, 0, searchOption, keyword, host);
		int count = sqlSession.selectOne("boardSQL.boardCnt",pb);
		return count;
	}

	public List<BoardBean> boardList(int start, int end, String searchOption, String keyword, String host) {
		PageBean pb = new PageBean(start, end, searchOption, keyword, host);
		List<BoardBean> boards = sqlSession.selectList("boardSQL.boardList", pb);
		return boards;
	}
}
