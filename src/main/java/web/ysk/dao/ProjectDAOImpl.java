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
		return sqlSession.selectOne("boardMapper.selectDetail",no);
	}
	//게시물 조회 Mybatis
	@Override
	public List<ProjectVO> listSearch() throws Exception{
		return sqlSession.selectList("boardMapper.selectList");
	}
	@Override
	public int selectRowCount() throws Exception {
		return sqlSession.selectOne("boardMapper.selectRowCount");
	}
	@Override
	public void boardHit(int bno) throws Exception {
		sqlSession.update("boardMapper.boardHit",bno);
	}
}
