package web.ysk.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import web.ysk.vo.ProjectVO;

public interface ProjectDAO {
	//create
	public void create(ProjectVO vo) throws Exception; //projectTable insert method
	public int selectSeqOfProjectTB() throws Exception; 
	public void alterbnoFiletable(int seq) throws Exception; //filetable insert bno = projectTable sequence method
	public void insertFile(Map<String,Object> map) throws Exception;
	
	//update
	public void update(ProjectVO vo) throws Exception; 
	public void updateFile(Map<String, Object> map) throws Exception;
	
	//read
	public int selectRowCount() throws Exception;//default main
	public int selectRowCount(String select,String search) throws Exception;//search main
	public ProjectVO listDetail(int no) throws Exception;
	public void boardHit(int bno) throws Exception; //transaction
	public List<ProjectVO> listSearch() throws Exception; //default main
	public List<ProjectVO> listSearch(String select, String search) throws Exception;//search main
	public List<Map<String, Object>> selectFileList(int bno) throws Exception;
	public Map<String, Object> selectFileInfo(Map<String,Object> map)throws Exception;

	//delete
	public void delete(int bno) throws Exception; 
	public int deleteFiles(int fileno) throws Exception;
}
