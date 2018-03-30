package service;

import java.util.Date;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import exception.AlreadyExistingMemberException;
import spring.Member;
import spring.RegisterRequest;

@Service
public class MemberRegisterService {
	
	@Autowired
	private SqlSession sqlSession;

	@Transactional
	public void regist(RegisterRequest req) {
		Member member = sqlSession.selectOne("memberSQL.loginCheck", req.getEmail());
		if (member != null) {
			throw new AlreadyExistingMemberException("dup email " + req.getEmail());
		}
		Member newMember = new Member(
				req.getEmail(), req.getPassword(), req.getName(),
				new Date());
		sqlSession.insert("memberSQL.memberInsert",newMember);
	}
}
