package com.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.common.JDBCUtil;

//Board를 조회, 삽입, 수정, 삭제하는 클래스
public class BoardDAO {

	//jdbc 관련 변수
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private static BoardDAO instance;	//싱글톤 패턴
	
	private BoardDAO() {}	//new 할수 없도록 막음(힙 메모리를 사용안함)
	
	public static BoardDAO getInstance() {
		if(instance == null) {
			instance = new BoardDAO();
		}
		return instance;
	}
	
	//게시글 추가
	public void insertBoard(Board board) {
		try {
			conn = JDBCUtil.getConnection();
			String sql = "INSERT INTO board(name, subject, content, write_date, id) "
				+ "VALUES (?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, board.getName());
			pstmt.setString(2, board.getSubject());
			pstmt.setString(3, board.getContent());
			pstmt.setString(4, board.getWriteDate());
			pstmt.setString(5, board.getId());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt);
		}
	}
	
	//게시판 목록 보기
	public ArrayList<Board> getBoardList(){
		ArrayList<Board> boardList = new ArrayList<>();
		
		try {
			conn = JDBCUtil.getConnection();
			String sql = "SELECT * FROM board ORDER BY num DESC";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				//게시글 1개당 1개의 객체
				Board board = new Board();
				board.setNum(rs.getInt("num"));
				board.setName(rs.getString("name"));
				board.setSubject(rs.getString("subject"));
				board.setContent(rs.getString("content"));
				board.setWriteDate(rs.getString("write_date"));
				board.setHit(rs.getInt("hit"));
				board.setId(rs.getString("id"));
				
				boardList.add(board);	//board 객체를 리스트에 저장함
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt, rs);
		}
		return boardList;
	}
	
	//로그인한 이름 가져오기
	public String getNameByLogin(String id) {
		String name = null;
		try {
			conn = JDBCUtil.getConnection();
			//member 테이블에 연결
			String sql = "SELECT * FROM member WHERE id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				name = rs.getString("name");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt, rs);
		}
		return name;
	}
	
	public Board getBoard(int num) {
		Board board = new Board();
		try {
			conn = JDBCUtil.getConnection();
			String sql = "SELECT * FROM board WHERE num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				//board.setNum(rs.getInt(num));
				board.setName(rs.getString("name"));
				board.setSubject(rs.getString("subject"));
				board.setContent(rs.getString("content"));
				board.setWriteDate(rs.getString("write_date"));
				board.setHit(rs.getInt("hit"));
				board.setId(rs.getString("id"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt, rs);
		}
		return board;
	}
}
