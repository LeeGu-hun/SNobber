package spring;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;

import dao.MemberDao;

public class MemberListPrinter {

	private MemberDao memberDao;

	public void setMemberDao(MemberDao memberDao) {
		this.memberDao = memberDao;
	}

	public void printAll() {
		Collection<Member> members = memberDao.selectAll();
		for (Member m : members) {
			System.out.println(m);
		}
	}
}
