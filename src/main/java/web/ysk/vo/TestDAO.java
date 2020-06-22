package web.ysk.vo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class TestDAO {

	public List<TestDTO> selectAll() {
		
		//context.xml에 설정한 ConnectionPool 사용
		Context ctx =null;
		Context env =null;;
		DataSource ds=null;;
		Connection conn=null;;
		PreparedStatement pstmt=null;;
		ResultSet rs = null;
		List<TestDTO> list = null; // 느슨한 코딩 - 다형성
		TestDTO dto = null;
		
		try {
			//data
			list = new ArrayList<TestDTO>();
			//tomcat context에 접근
			ctx = (Context) new InitialContext();
			//환경설정을 담기
			env = (Context)ctx.lookup("java:comp/env");
			//jdbc/orcl이라고 name속성 지정한 Resource Tag 찾아서 DataSource에 담기
			ds = (DataSource)env.lookup("jdbc/orcl");
			//connection
			conn = ds.getConnection();
			String sql = "select * from test";
			pstmt = conn.prepareStatement(sql);
			rs =  pstmt.executeQuery();
			while(rs.next()) {
				dto = new TestDTO();
				dto.setId(rs.getString("id"));		
				dto.setPw(rs.getString("pw"));
				dto.setAge(rs.getInt("age"));
				dto.setReg(rs.getTimestamp("reg"));
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(rs!=null)try {rs.close();} catch (SQLException e) {e.printStackTrace();}
			if(pstmt!=null)try {pstmt.close();}catch (SQLException e) {e.printStackTrace();}
			if(conn!=null)try {conn.close();}catch (SQLException e) {e.printStackTrace();}
		}
		return list;
	}
}
