package web.ysk.service;

import java.util.List;

import org.springframework.stereotype.Repository;

import web.ysk.vo.ProjectVO;

public interface ProjectService {
	public void create(ProjectVO vo) throws Exception; // 
	public void update(ProjectVO vo) throws Exception; //
	public void delete(int num) throws Exception; // 
	public List<ProjectVO> listSearch() throws Exception; // 
	public ProjectVO listDetail(int no) throws Exception;
	public int selectRowCount()throws Exception;
}
