package web.ysk.service;

import java.util.List;

import org.springframework.stereotype.Repository;

import web.ysk.vo.ProjectVO;

public interface ProjectService {
	public void create(ProjectVO vo) throws Exception; // 
	public void update(ProjectVO vo) throws Exception; //
	public void delete(int num) throws Exception; // 
	public List<ProjectVO> listSearch(); // 
	public int listSearchCount(); //
	public ProjectVO listDetail(int no);
	public int selectRowCount()throws Exception;
	public int selectRowCountMybatis()throws Exception;
	public List<ProjectVO> listSearchMybatis() throws Exception;
}
