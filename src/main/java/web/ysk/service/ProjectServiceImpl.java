package web.ysk.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.ysk.dao.ProjectDAO;
import web.ysk.dao.ProjectDAOImpl;
import web.ysk.vo.ProjectVO;

@Service
public class ProjectServiceImpl implements ProjectService{
	//injection 
	@Inject
	private ProjectDAOImpl dao;
	
	@Autowired
	private ProjectDAO projectdao;
	
	@Override
	public List<ProjectVO> listSearch(){
		System.out.println("LOG :  SERVICEIMPL");
		return dao.listSearch();
	}
	@Override
	public int listSearchCount(){
		return dao.listSearchCount();
	}
	@Override
	public ProjectVO listDetail(int no) {
		// TODO Auto-generated method stub
		ProjectVO vo = dao.listDetail(no);
		return vo;
	}
	@Override
	public int selectRowCount() throws Exception{
		// TODO Auto-generated method stub
		int selectRowCount = dao.selectRowCount();
		return selectRowCount;
	}
	@Override
	public void create(ProjectVO vo) throws Exception {
		// TODO Auto-generated method stub
	}
	@Override
	public void update(ProjectVO vo) throws Exception {
		// TODO Auto-generated method stub
	}
	@Override
	public void delete(int num) throws Exception {
		// TODO Auto-generated method stub
	}
	@Override
	public List<ProjectVO> listSearchMybatis() throws Exception {
		
		return dao.readByMybatis();
	}
	@Override
	public int selectRowCountMybatis() throws Exception {
		return dao.selectRowCountMybatis();
	}
}
