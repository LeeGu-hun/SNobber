package service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import exception.IdPasswordNotMatchingException;
import exception.MemberNotFoundException;
import exception.MemberStopException;
import spring.AuthInfo;
import spring.Member;

@Service
public class AuthService {
	@Autowired
	private SqlSession sqlSession;
	
	@SuppressWarnings("unused")
	public AuthInfo authenticate(String id, String password) {
		Member m = sqlSession.selectOne("memberSQL.loginCheck", id);
		if(m == null) { 
			throw new MemberNotFoundException("noexist mem_Id " + id);
		}else if(m.getMem_Condition() == 2) {
			throw new MemberStopException("stop mem_Id" + id);
		}else if(!m.mathPassword(password))
			throw new IdPasswordNotMatchingException();
		return new AuthInfo(m.getMem_Id(), m.getMem_Email(), m.getMem_Nickname(),
				m.getMem_Photo(), m.getMem_Introduce(),m.getMem_num(),m.getMem_Condition());
	}
}
