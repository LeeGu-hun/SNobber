package spring;

import org.springframework.beans.factory.annotation.Autowired;

import dao.MemberDao;
import exception.MemberNotFoundException;

public class MemberInfoPrinter {

	private MemberDao memberDao;

	public void setMemberDao(MemberDao memberDao) {
		System.out.println("MemberInfoPrinter"+ memberDao);
		this.memberDao = memberDao;
	}

	public void memPrint(String email){
		Member mem = memberDao.selectByEmail(email);
		if(mem == null) 
			throw new MemberNotFoundException();
		System.out.println(mem);
	}
	
}
