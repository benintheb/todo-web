package kr.or.connect.todo.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.or.connect.todo.dto.TodoDto;

class DriverLoad {
	public Connection dbConn() throws SQLException, ClassNotFoundException {
        Connection conn = null;
        Class.forName("com.mysql.jdbc.Driver");
        String dbUrl = "jdbc:mysql://localhost:3306/connectdb?serverTimezone=Asia/Seoul&useSSL=false";
        String dbUser = "connectuser";
        String dbPasswd = "connect123!@#";
        conn = DriverManager.getConnection(dbUrl, dbUser, dbPasswd);
        return conn;
    }
}

public class TodoDao {
	public List<TodoDto> getTodos() {
		List<TodoDto> list = new ArrayList<>();

		DriverLoad dl = new DriverLoad();

		String sql = "SELECT id, title, name, sequence, type, regdate FROM todo ORDER BY regdate asc";
		try (Connection conn = dl.dbConn();
				PreparedStatement ps = conn.prepareStatement(sql)) {
			
			try (ResultSet rs = ps.executeQuery()) {

				while (rs.next()) {
					long id = rs.getLong("id");
					String title = rs.getString("title");
					String name = rs.getString("name");
					int sequence = rs.getInt("sequence");
					String type = rs.getString("type");
					String regdate = rs.getString("regdate");
					TodoDto todo = new TodoDto(id, title, name, sequence, type, regdate);
					list.add(todo);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return list;
	}
	
	public int addTodo(String title, String name, Integer sequence) {
		int insertCount = 0;

		DriverLoad dl = new DriverLoad();

		String sql = "INSERT TODO(title, name, sequence) VALUES(?, ?, ?)";

		try (Connection conn = dl.dbConn();
				PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setString(1, title);
			ps.setString(2, name);
			ps.setInt(3, sequence);

			insertCount = ps.executeUpdate();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return insertCount;
	}
	
	public int updateTodo(String type, Long id) {
		int updated = 0;

		DriverLoad dl = new DriverLoad();
		
		String sql = "UPDATE todo SET type = ? WHERE id = ?";

		try (Connection conn = dl.dbConn();
				PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setString(1, type);
			ps.setLong(2, id);

			updated = ps.executeUpdate();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return updated;
	}
}
