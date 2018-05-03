package service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import bean.MemberBean;
import exception.AlreadyExistingMemberException;
import spring.Member;

@Service
public class MemberRegisterService {

	@Autowired
	private SqlSession sqlSession;

	@Transactional
	public void regist(MemberBean mem) {
		Member member = sqlSession.selectOne("memberSQL.loginCheck", mem.getMem_Id());
		Member name = sqlSession.selectOne("memberSQL.nameCheck", mem.getMem_Nickname());
		Member email = sqlSession.selectOne("memberSQL.emailCheck", mem.getMem_Email());
		if (member != null) {
			throw new AlreadyExistingMemberException("dup mem_Id" + mem.getMem_Id());
		} else if (name != null) {
			throw new AlreadyExistingMemberException("dup mem_Name" + mem.getMem_Nickname());
		} else if (email != null) {
			throw new AlreadyExistingMemberException("dup mem_Email" + mem.getMem_Email());
		}

		Member newMem = new Member(mem.getMem_Id(), mem.getMem_Nickname(), mem.getMem_Password(), mem.getMem_Email(),
				mem.getMem_Photo(), mem.getMem_Introduce());
		sqlSession.insert("memberSQL.memberInsert", newMem);
		sqlSession.insert("memberSQL.boardBasic", mem);
	}
}
