package friend;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class FriendDao {
	private static FriendDao instance;
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;

	String driver = "com.mysql.cj.jdbc.Driver";
	String user = "root";
	String pass = "1111";
	String dbURL = "jdbc:mysql://localhost:3306/friend";
	
	private FriendDao() {
		try {
			Class.forName(driver);
			System.out.println("MySQL 드라이버 검색 성공...");
			
			conn = DriverManager.getConnection(dbURL, user, pass);
			System.out.println("MySQL 연결 성공...\n");
		}
		catch (ClassNotFoundException e) {
			System.out.println("MySQL 드라이버 검색 오류");
		}
		catch (SQLException e) {
			System.out.println("MySQL 연결 객체 생성 실패" + e);
		}
	}
	
	public static FriendDao getInstance() {
		if (instance == null)
			instance = new FriendDao();
		return instance;
	}
	
	public Friend select(String id) {
		Friend friend = new Friend();
		try {
			pstmt = conn.prepareStatement("SELECT * FROM custmer01 where id=?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				friend.setId(rs.getString("id"));
				friend.setPw(rs.getString("password"));
				friend.setName(rs.getString("name"));
				friend.setAge(rs.getString("age"));
				friend.setJob(rs.getString("job"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return friend;
	}
	
	public List<Friend> selectAll() {
		List<Friend> list = new ArrayList<Friend>();
		
		try {
			pstmt = conn.prepareStatement("SELECT * FROM custmer01");
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				Friend friend = new Friend();
				friend.setId(rs.getString("id"));
				friend.setPw(rs.getString("password"));
				friend.setName(rs.getString("name"));
				friend.setAge(rs.getString("age"));
				friend.setJob(rs.getString("job"));
				list.add(friend);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public int insert(Friend friend) {
		int result = 0;
		try {
			pstmt = conn.prepareStatement("insert into custmer01 values(?,?,?,?,?)");
			pstmt.setString(1, friend.getId());
			pstmt.setString(2, friend.getPw());
			pstmt.setString(3, friend.getName());
			pstmt.setString(4, friend.getAge());
			pstmt.setString(5, friend.getJob());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public int update(Friend friend) {
		int result = 0;
		try {
			pstmt = conn.prepareStatement("update custmer01 set password = ?, age = ?, job = ? where id = ?");
			pstmt.setString(1, friend.getPw());
			pstmt.setString(2, friend.getAge());
			pstmt.setString(3, friend.getJob());
			pstmt.setString(4, friend.getId());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public int delete(String id) {
		int result = 0;
		try {
			pstmt = conn.prepareStatement("delete from custmer01 where id = ?");
			pstmt.setString(1, id);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public boolean idCheck(String id) {
		boolean useable = true;
		try {
			pstmt = conn.prepareStatement("SELECT * FROM custmer01 where id=?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				useable = false;
				return useable;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return useable;
	}
}