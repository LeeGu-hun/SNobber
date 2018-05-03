package service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import bean.Find;
import exception.MemberNotFoundException;
import spring.Member;

public class FindPassService {
	@Autowired
	private SqlSession sqlSession;

	@Transactional
	public Member findPass(Find find) {
		Member id = sqlSession.selectOne("memberSQL.loginCheck", find.getMem_Id());
		Member name = sqlSession.selectOne("memberSQL.findCheck", find);
		Member email = sqlSession.selectOne("memberSQL.findEmailCheck", find);
		if (id == null) {
			throw new MemberNotFoundException("noexist mem_Id " + find.getMem_Id());
		} else if (name == null) {
			throw new MemberNotFoundException("noexist mem_Name " + find.getMem_Name());
		} else if (email == null) {
			throw new MemberNotFoundException("noexist mem_Email " + find.getMem_Email());
		}
		Member findpass = new Member(find.getMem_Id(), find.getMem_Name(), find.getMem_Email());
		return sqlSession.selectOne("memberSQL.findPass", findpass);
	}
}
