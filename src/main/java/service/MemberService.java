package service;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Service;

import bean.ListCommand;
import spring.Member;

//DAO는 단일 데이터 접근/갱신만 처리
//Service는 여러 DAO를 호출하여 여러번의 데이터 접근/갱신을 하며
//그렇게 읽은 데이터에 대한 비즈니스 로직을 수행하고, 
//그것을 하나의(혹은 여러개의) 트랜잭션으로 묶는다.
//즉, Service가 트랜잭션 단위. 
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

	public Member selectById(Long memId) {
		Member member = sqlSession.selectOne("memberSQL.getById", memId);
		return member;
	}
}
