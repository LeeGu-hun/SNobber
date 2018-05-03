package service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bean.ListCommand;
import spring.Member;

@Service
public class MemberService {

	@Autowired
	private SqlSession sqlSession;

	public List<Member> selectByRegdate(ListCommand listCommand) {
		Date from = listCommand.getFrom();
		Date to = listCommand.getTo();
		SimpleDateFormat dt = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		Calendar cal = Calendar.getInstance();
		int year, month, day;
		String from_s = "", to_s = "";

		Date fromWord = (from == null) ? new Date() : from;
		cal.setTime(fromWord);
		year = cal.get(cal.YEAR);
		month = cal.get(cal.MONTH) + 1;
		day = (from == null) ? 1 : cal.get(cal.DATE);
		from_s = year + "-" + month + "-" + day + " 00:00:00.0";

		Date toWord = (to == null) ? new Date() : to;
		cal.setTime(toWord);
		year = cal.get(cal.YEAR);
		month = cal.get(cal.MONTH) + 1;
		day = cal.get(cal.DATE);
		to_s = year + "-" + month + "-" + day + " 23:59:59.0";

		try {
			from = dt.parse(from_s);
			to = dt.parse(to_s);
		} catch (ParseException e) {
		}
		listCommand.setFrom(from);
		listCommand.setTo(to);
		List<Member> results = sqlSession.selectList("memberSQL.getByRegdateList", listCommand);
		return results;
	}

	public Member selectById(String memId) {
		Member member = sqlSession.selectOne("memberSQL.selectById", memId);
		return member;
	}

	public int host(String memId) {
		int host = sqlSession.selectOne("memberSQL.getHost", memId);
		return host;
	}

	public void stop(int host) {
		sqlSession.update("memberSQL.memberStop", host);
	}

	public void repair(int host) {
		sqlSession.update("memberSQL.memberRepair", host);
	}

	public void delete(int host) {
		sqlSession.delete("memberSQL.memberDelete", host);
	}

	public void delete(String name) {
		sqlSession.delete("memberSQL.adminDelete", name);
	}
}
