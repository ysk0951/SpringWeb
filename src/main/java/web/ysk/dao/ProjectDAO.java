package web.ysk.dao;

import java.util.List;

import web.ysk.vo.ProjectVO;

public interface ProjectDAO {
	public void create(ProjectVO vo) throws Exception; 
	public void update(ProjectVO vo) throws Exception; 
	public void delete(int bno) throws Exception; 
	public List<ProjectVO> listSearch();
	public int listSearchCount();
	public ProjectVO listDetail(int no);
	public int selectRowCount();
}
