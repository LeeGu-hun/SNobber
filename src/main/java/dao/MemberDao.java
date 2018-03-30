package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;

import spring.Member;

public class MemberDao {

	private JdbcTemplate jdbcTemplate;

	public MemberDao(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	public Member selectByEmail(String email) {
		List<Member> results = jdbcTemplate.query("select * from MEMBERS where EMAIL = ?", new RowMapper<Member>() {
			@Override
			public Member mapRow(ResultSet rs, int rowNum) throws SQLException {
				System.out.println("selectByEmail");
				Member member = new Member(rs.getString("EMAIL"), rs.getString("PASSWORD"), rs.getString("NAME"),
						rs.getTimestamp("REGDATE"));
				member.setId(rs.getLong("ID"));
				return member;
			}
		}, email);

		return results.isEmpty() ? null : results.get(0);
	}

	public Member selectById(Long memId) {
		Member member = jdbcTemplate.queryForObject(
				"select * from MEMBERS where id = ?",
				new RowMapper<Member>() {
			@Override
			public Member mapRow(ResultSet rs, int rowNum) throws SQLException {
				Member member = new Member(rs.getString("EMAIL"), rs.getString("PASSWORD"), rs.getString("NAME"),
						rs.getTimestamp("REGDATE"));
				member.setId(rs.getLong("ID"));
				return member;
			}
		}, memId);
		System.out.println("selectById");
		return member;
	}
	
	public void insert(final Member member) {
		KeyHolder keyHolder = new GeneratedKeyHolder();
		jdbcTemplate.update(new PreparedStatementCreator() {
			@Override
			public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
				PreparedStatement pstmt = con.prepareStatement(
						"insert into MEMBERS values (members_id_seq.nextval,?, ?, ?, sysdate)",
						new String[] { "ID" });
				pstmt.setString(1, member.getEmail());
				pstmt.setString(2, member.getPassword());
				pstmt.setString(3, member.getName());
				//pstmt.setTimestamp(4, new Timestamp(member.getRegdate().getTime()));
				
				return pstmt;
			}
		}, keyHolder);
		Number keyValue = keyHolder.getKey();
		member.setId(keyValue.longValue());
		System.out.println("insert");
	}

	public void update(Member member) {
		jdbcTemplate.update("update MEMBERS set NAME = ?, PASSWORD = ? where EMAIL = ?", member.getName(),
				member.getPassword(), member.getEmail());
		System.out.println("update");
	}

	public List<Member> selectAll() {
		List<Member> results = jdbcTemplate.query("select * from MEMBERS", new RowMapper<Member>() {
			@Override
			public Member mapRow(ResultSet rs, int rowNum) throws SQLException {
				Member member = new Member(rs.getString("EMAIL"), rs.getString("PASSWORD"), rs.getString("NAME"),
						rs.getTimestamp("REGDATE"));
				member.setId(rs.getLong("ID"));
				return member;
			}
		});
		System.out.println("selectAll");
		return results;
	}

	public List<Member> selectByRegdate(Date from, Date to) {
		String sql = "select * from MEMBERS where regdate "
				+ "between ? and ? order by regdate desc ";
		SimpleDateFormat dt = 
				new SimpleDateFormat("yyyy-MM-dd hh:mm:ss"); 
		Calendar cal = Calendar.getInstance();
		int year, month, day;
		String from_s="", to_s="";
		
		Date fromWord = (from == null)?new Date():from;
		cal.setTime(fromWord);
		year = cal.get(cal.YEAR);
		month = cal.get(cal.MONTH) + 1 ;
		day= (from == null)?1:cal.get(cal.DATE);
		from_s = year+"-"+month+"-"+day+" 00:00:00.0";

		Date toWord = (to == null)?new Date():to;
		cal.setTime(toWord);
		year = cal.get (cal.YEAR);
		month = cal.get (cal.MONTH) + 1 ;
		day= cal.get(cal.DATE);
		to_s = year+"-"+month+"-"+day+" 23:59:59.0";
		
		try { 
			from = dt.parse(from_s);
			to = dt.parse(to_s);
		} catch (ParseException e) { } 
		List<Member> results = jdbcTemplate.query(sql, 
				new RowMapper<Member>() {
			@Override
			public Member mapRow(ResultSet rs, int rowNum) 
					throws SQLException {
				Member member = new Member(rs.getString("EMAIL"), 
						rs.getString("PASSWORD"), 
						rs.getString("NAME"),
						rs.getTimestamp("REGDATE"));
				member.setId(rs.getLong("ID"));
				return member;
			}
		}, from, to);
		System.out.println("selectbyregdate");
		return results;
	}

	public int count() {
		Integer count = jdbcTemplate.queryForObject("select count(*) from MEMBERS", Integer.class);
		return count;
	}

}
