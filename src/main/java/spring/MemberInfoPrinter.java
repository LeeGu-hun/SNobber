package spring;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import exception.MemberNotFoundException;

public class MemberInfoPrinter {

	@Autowired
	private SqlSession sqlSession;

	@Transactional
	public void memPrint(RegisterRequest rs){
		Member mem = (Member) sqlSession.selectOne("memberSQL.getById", rs.getMem_Id());
		if(mem == null) 
			throw new MemberNotFoundException();
		System.out.println(mem);
	}
	
}
