package spring;

import java.util.Collection;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

public class MemberListPrinter {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Transactional
	public void printAll() {
		Collection<Member> members = sqlSession.selectList("memberSQL.getMemberList");
		for (Member m : members) {
			System.out.println(m);
		}
	}
}
