package service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import bean.Find;
import exception.MemberNotFoundException;
import spring.Member;

public class FindIdService {
	@Autowired
	private SqlSession sqlSession;

	@Transactional
	public Member findId(Find find) {
		Member name = sqlSession.selectOne("memberSQL.findNameCheck", find);
		Member email = sqlSession.selectOne("memberSQL.emailCheck", find.getMem_Email());
		if (name == null) {
			throw new MemberNotFoundException("noexist mem_Name " + find.getMem_Name());
		} else if (email == null) {
			throw new MemberNotFoundException("noexist mem_Email " + find.getMem_Email());
		}
		Member findId = new Member(find.getMem_Name(), find.getMem_Email());
		return sqlSession.selectOne("memberSQL.findId", findId);
	}
}
