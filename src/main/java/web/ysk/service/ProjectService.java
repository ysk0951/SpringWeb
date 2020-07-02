package web.ysk.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import web.ysk.vo.ProjectVO;

public interface ProjectService {
	//create
	public void create(ProjectVO vo) throws Exception; //
	public void alterbnoFiletable(int seq) throws Exception;
	public void submitNewData(ProjectVO vo,MultipartHttpServletRequest mpRequest) throws Exception;
	
	//update
	public void update(ProjectVO vo) throws Exception; //
	public void modifyData(ProjectVO vo, MultipartHttpServletRequest mpRequest)throws Exception;
	
	//read
	public int selectRowCount()throws Exception; //default main
	public int selectRowCount(String select,String search) throws Exception;//search main
	public ProjectVO listDetail(int no) throws Exception;
	public List<ProjectVO> listSearch() throws Exception; //default main
	public List<ProjectVO> listSearch(String select,String search) throws Exception; //search main
	public List<Map<String, Object>> selectFileList(int bno) throws Exception;;
	public Map<String,Object> selectFileInfo(Map<String,Object> map) throws Exception;

	//delete
	public void delete(int num) throws Exception; // 
	
}
