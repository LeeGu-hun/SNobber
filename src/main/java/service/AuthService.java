package service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import exception.IdPasswordNotMatchingException;
import exception.MemberNotFoundException;
import spring.AuthInfo;
import spring.Member;

@Service
public class AuthService {

	@Autowired
	private SqlSession sqlSession;
	
	public AuthInfo authenticate(String id, String password) {
		Member m = sqlSession.selectOne("memberSQL.loginCheck", id);
		if(m == null) 
			throw new MemberNotFoundException();
		if(!m.mathPassword(password))
			throw new IdPasswordNotMatchingException();
		return new AuthInfo(m.getMem_Id(), m.getMem_Email(), m.getMem_Nickname(),
				m.getMem_Photo(), m.getMem_Introduce());
	}
}
