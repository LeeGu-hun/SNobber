package service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import bean.MemberBean;
import exception.AlreadyExistingMemberException;
import spring.Member;
import spring.RegisterRequest;

@Service
public class MemberRegisterService {

	@Autowired
	private SqlSession sqlSession;

	@Transactional
	public void regist(RegisterRequest req) {
		Member member = sqlSession.selectOne("memberSQL.loginCheck", req.getMem_Id());
		if (member != null) {
			throw new AlreadyExistingMemberException("dup id " + req.getMem_Id());
		}

		Member newMem = new Member(req.getMem_Id(), req.getMem_Name(), req.getMem_Password(), req.getMem_Email(),
				req.getMem_Photo(), req.getMem_Introduce());
		sqlSession.insert("memberSQL.memberInsert", newMem);
	}
}
