package com.crud;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Repository
public class BoardDAO {
	@Autowired
	JdbcTemplate jdbcTemplate;
	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	public int insertBoard(BoardVO vo){
		String sql = "insert into BOARD (title, writer, content) values("
				+"'"+vo.getTitle()+"'"+","
				+"'"+vo.getWriter()+"'" +","
				+"'"+vo.getContent()+"')";
		return jdbcTemplate.update(sql);
	}

	public int deleteBoard(int seq){
		String sql = "delete from BOARD where seq= "+seq;
		return jdbcTemplate.update(sql);
	}

	public int updateBoard(BoardVO vo){
		String sql = "update BOARD set title ='"+vo.getTitle()+"',"
				+"title ='"+vo.getTitle()+"',"
				+"writer='"+vo.getWriter()+"',"
				+"content='"+vo.getContent()+"' where seq="+vo.getSeq();
		return jdbcTemplate.update(sql);
	}




	class BoardRowMapper implements RowMapper<BoardVO>{
		@Override
		public BoardVO mapRow(ResultSet rs, int rowNum) throws SQLException {
			BoardVO data = new BoardVO();
			data.setSeq(rs.getInt("seq"));
			data.setTitle(rs.getString("title"));
			data.setContent(rs.getString("content"));
			data.setWriter(rs.getString("writer"));
			data.setRegdate(rs.getDate("regdate"));
			return data;
		}
	}

	public BoardVO getBoard(int seq){
		String sql = "select * from BOARD where seq ="+ seq;
		return jdbcTemplate.queryForObject(sql, new BoardRowMapper());
	}

	public List<BoardVO> getBoardList(){
		String sql = "select * from BOARD order by regdate desc";
		return jdbcTemplate.query(sql, new BoardRowMapper());
	}



}

