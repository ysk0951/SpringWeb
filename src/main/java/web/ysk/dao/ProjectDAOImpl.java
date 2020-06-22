package web.ysk.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import web.ysk.vo.ProjectVO;

@Repository
public class ProjectDAOImpl implements ProjectDAO {

	@Inject
	private SqlSession sqlSession;
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
	public ProjectVO listDetail(int no) throws Exception {
		ProjectVO vo = sqlSession.selectOne("boardMapper.selectDetail",no); 
		return vo;
	}
	//게시물 조회 Mybatis
	@Override
	public List<ProjectVO> listSearch() throws Exception{
		return sqlSession.selectList("boardMapper.selectList");
	}
	@Override
	public int listSearchCount() {
		return 0;
	}
	@Override
	public int selectRowCount() throws Exception {
		return sqlSession.selectOne("boardMapper.selectRowCount");
	}
}
