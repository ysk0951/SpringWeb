package web.ysk.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import web.ysk.vo.ProjectVO;

public interface ProjectDAO {
	public void create(ProjectVO vo) throws Exception; 
	public void alterbnoFiletable(int seq) throws Exception;
	public void update(ProjectVO vo) throws Exception; 
	public void updateFile(Map<String, Object> map) throws Exception;
	public void delete(int bno) throws Exception; 
	public ProjectVO listDetail(int no) throws Exception;
	public void boardHit(int bno) throws Exception;
	public int selectRowCount() throws Exception;
	public List<ProjectVO> listSearch() throws Exception;
	public void insertFile(Map<String,Object> map) throws Exception;
	//첨부파일조회
	public List<Map<String, Object>> selectFileList(int bno) throws Exception;
	public int selectSeqOfProjectTB() throws Exception;
	public Map<String, Object> selectFileInfo(Map<String,Object> map)throws Exception;
}
