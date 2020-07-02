package web.ysk.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import web.ysk.vo.ProjectVO;

@Repository
public class ProjectDAOImpl implements ProjectDAO {

	@Inject
	private SqlSession sqlSession;
	@Override
	public void create(ProjectVO vo) throws Exception {
		sqlSession.insert("boardMapper.insert",vo);
	}
	@Override
	public void update(ProjectVO vo) throws Exception {
		//구현중
		sqlSession.update("boardMapper.update",vo);
	}
	@Override
	public void delete(int num) throws Exception {
		sqlSession.delete("boardMapper.delete",num);
		sqlSession.delete("boardMapper.deleteFile",num);
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
	public List<ProjectVO> listSearch(String select,String search) throws Exception{
		Map<String,String> map  = new HashMap<String, String>();
		map.put("select", select);
		map.put("search", search);
		return sqlSession.selectList("boardMapper.selectListSearch",map);
	}
	@Override
	public int selectRowCount() throws Exception {
		return sqlSession.selectOne("boardMapper.selectRowCount");
	}
	@Override
	public int selectRowCount(String select,String search) throws Exception {
		Map<String,String> map = new HashMap<String,String>();
		map.put("select", select);
		map.put("search",search);
		return sqlSession.selectOne("boardMapper.selectRowCountSearch",map);
	}
	@Override
	public void boardHit(int bno) throws Exception {
		sqlSession.update("boardMapper.boardHit",bno);
	}
	@Override
	public void insertFile(Map<String, Object> map) throws Exception {
		sqlSession.insert("boardMapper.insertFile", map);
	}
	@Override
	public List<Map<String,Object>> selectFileList(int bno) throws Exception {
		return  sqlSession.selectList("boardMapper.selectFileList", bno);
	}
	@Override
	public int selectSeqOfProjectTB() throws Exception {
		return sqlSession.selectOne("boardMapper.selectSeqOfProjectTB");
	}
	@Override
	public void alterbnoFiletable(int seq) throws Exception {
		sqlSession.update("boardMapper.alterbnoFiletable",seq);
	}
	@Override
	public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception {
		return sqlSession.selectOne("boardMapper.selectFileInfo",map);
	}
	@Override
	public void updateFile(Map<String, Object> map)throws Exception {
		//MODIFY
		sqlSession.update("boardMapper.updateFile", map);
	} 
	@Override
	public int deleteFiles(int num) throws Exception {
		sqlSession.delete("boardMapper.deleteFilebycheck",num);
		return 0;
	} 
}  
 