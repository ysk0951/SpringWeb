package web.ysk.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import web.ysk.vo.ProjectVO;

public interface ProjectService {
	public void create(ProjectVO vo) throws Exception; // 
	public void update(ProjectVO vo) throws Exception; //
	public void delete(int num) throws Exception; // 
	public List<ProjectVO> listSearch() throws Exception; // 
	public ProjectVO listDetail(int no) throws Exception;
	public int selectRowCount()throws Exception; //default main
	public int selectRowCount(String select,String search) throws Exception;//search main
	public void submitNewData(ProjectVO vo,MultipartHttpServletRequest mpRequest) throws Exception;
	public List<Map<String, Object>> selectFileList(int bno) throws Exception;;
	public void alterbnoFiletable(int seq) throws Exception;
	public Map<String,Object> selectFileInfo(Map<String,Object> map) throws Exception;
	public void modifyData(ProjectVO vo, MultipartHttpServletRequest mpRequest)throws Exception;
	
}
