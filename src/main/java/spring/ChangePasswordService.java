package spring;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import exception.MemberNotFoundException;

public class ChangePasswordService {

	@Autowired
	private SqlSession sqlSession;

	@Transactional
	public void changePassword(String id, String oldPwd, String newPwd, String email, String nickname, String photo, String introduce) {
		Member member = sqlSession.selectOne("memberSQL.memberUpdate", id);
		if (member == null)
			throw new MemberNotFoundException();
		
		member.changePassword(oldPwd, newPwd);
	}
}
