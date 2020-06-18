package web.ysk.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import web.ysk.vo.ProjectVO;

@Repository
public class ProjectDAOImpl implements ProjectDAO {

//	sigleton DB
	private static ProjectDAOImpl Instance = new ProjectDAOImpl();
	private ProjectDAOImpl() {
	}
	public static ProjectDAOImpl getInstance() {
		return Instance;
	}
	@Override
	public void create(ProjectVO vo) throws Exception {
	}
	@Override
	public void update(ProjectVO vo) throws Exception {

	}
	@Override
	public void delete(int bno) throws Exception {
	}
	@Override
	public ProjectVO listDetail(int no) {
		System.out.println("LOG :  DAOIMPL : ListDetail");
		String driver = "oracle.jdbc.driver.OracleDriver";
//		String url = "jdbc:oracle:thin:@192.168.0.252:1521:ORCL";
		String HomeToGrobalURL = "jdbc:oracle:thin:@nullmaster.iptime.org:3000:ORCL";
		Connection conn = null;
		PreparedStatement ppst = null;
		ResultSet rs = null;
		ProjectVO vo = null;
		int numForSQL = no;
		
		try {
			Class.forName(driver);
//			conn = DriverManager.getConnection(url,"java06", "java06");
			conn = DriverManager.getConnection(HomeToGrobalURL, "java06", "java06");
			ppst = conn.prepareStatement("SELECT * FROM PROJECT_TBL pt WHERE NUM = ?");
			ppst.setInt(1, numForSQL);
			//ppst.set~~
			rs = ppst.executeQuery();
			if (rs.next()) {
				do {
					vo = new ProjectVO();
					vo.setNum(numForSQL);
					vo.setProjectName(rs.getString("PROJECTNAME"));
					vo.setContent(rs.getString("CONTENT"));
					vo.setRegdate(rs.getTimestamp("REGDATE"));
					vo.setViewcnt(rs.getInt("VIEWCNT"));
				} while (rs.next());
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {if (rs != null)rs.close();} catch (Exception e2) {e2.printStackTrace();}
			try {if (ppst != null)ppst.close();} catch (Exception e3) {e3.printStackTrace();}
			try {if (conn != null)conn.close();} catch (Exception e4) {e4.printStackTrace();}
		}
		return vo;
	}

	@Override
	public List<ProjectVO> listSearch() {
		System.out.println("LOG :  DAOIMPL : ListSearch");
		String driver = "oracle.jdbc.driver.OracleDriver";
//		String url = "jdbc:oracle:thin:@192.168.0.252:1521:ORCL";
		String HomeToGrobalURL = "jdbc:oracle:thin:@nullmaster.iptime.org:3000:ORCL";
		Connection conn = null;
		PreparedStatement ppst = null;
		ResultSet rs = null;
		List<ProjectVO> list = null;

		try {
			Class.forName(driver);
//			conn = DriverManager.getConnection(url,"java06", "java06");
			conn = DriverManager.getConnection(HomeToGrobalURL, "java06", "java06");
			ppst = conn.prepareStatement("select * from PROJECT_TBL");
			//집에서 접속하는것 작성
//		ppst.set~~
			rs = ppst.executeQuery();
			list = new ArrayList<ProjectVO>();
			if (rs.next()) {
				do {
					ProjectVO vo = new ProjectVO();
					vo.setNum(rs.getInt("NUM"));
					vo.setProjectName(rs.getString("PROJECTNAME"));
					vo.setContent(rs.getString("CONTENT"));
					vo.setRegdate(rs.getTimestamp("REGDATE"));
					vo.setViewcnt(rs.getInt("VIEWCNT"));
					list.add(vo);
				} while (rs.next());
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {if (rs != null)rs.close();} catch (Exception e2) {e2.printStackTrace();}
			try {if (ppst != null)ppst.close();} catch (Exception e3) {e3.printStackTrace();}
			try {if (conn != null)conn.close();} catch (Exception e4) {e4.printStackTrace();}
		}
		return list;
	}
	@Override
	public int listSearchCount() {
		return 0;
	}
	
	public int selectRowCount() {
		System.out.println("LOG :  DAOIMPL : selectRowCount");
		String driver = "oracle.jdbc.driver.OracleDriver";
//		String url = "jdbc:oracle:thin:@192.168.0.252:1521:ORCL";
		String HomeToGrobalURL = "jdbc:oracle:thin:@nullmaster.iptime.org:3000:ORCL";
		Connection conn = null;
		PreparedStatement ppst = null;
		ResultSet rs = null;
		int selectRowCount = 0;
		try {
			Class.forName(driver);
//			conn = DriverManager.getConnection(url,"java06", "java06");
			conn = DriverManager.getConnection(HomeToGrobalURL, "java06", "java06");
			ppst = conn.prepareStatement("SELECT COUNT(*) FROM PROJECT_TBL pt");
			//집에서 접속하는것 작성
//		ppst.set~~
			rs = ppst.executeQuery();
			if (rs.next()) {
				do {
					//갯수받기
					selectRowCount = rs.getInt("COUNT(*)");
				} while (rs.next());
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {if (rs != null)rs.close();} catch (Exception e2) {e2.printStackTrace();}
			try {if (ppst != null)ppst.close();} catch (Exception e3) {e3.printStackTrace();}
			try {if (conn != null)conn.close();} catch (Exception e4) {e4.printStackTrace();}
		}
		return selectRowCount;
	}
}
