package web.ysk.service;

import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import web.ysk.dao.ProjectDAO;
import web.ysk.dao.ProjectDAOImpl;
import web.ysk.util.FileUtils;
import web.ysk.vo.ProjectVO;

@Service
public class ProjectServiceImpl implements ProjectService{
	//injection 
	@Inject
	private ProjectDAOImpl dao;
	
	@Resource(name = "fileUtils")
	private FileUtils fileUtils;
	
	@Autowired
	private ProjectDAO projectdao;
	
	@Override
	public List<ProjectVO> listSearch() throws Exception{
		return dao.listSearch();
	}
	
	//Detail읽을때마다 트랜잭션 처리
	@Transactional(isolation = Isolation.READ_COMMITTED)
	@Override
	public ProjectVO listDetail(int no) throws Exception {
					   //Transaciton
					   dao.boardHit(no);
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
	public void submitNewData(ProjectVO vo, MultipartHttpServletRequest mpRequest) throws Exception {
		dao.create(vo);
		String[] files = null;
		String[] fileNames = null;
		List<Map<String,Object>> list =fileUtils.parseInsertFileInfo(vo,mpRequest);
		int size = list.size();
		System.out.println("***LOG : FILE LIST SIZE :"+size);
		for(int i=0;i<size;i++) {
			dao.insertFile(list.get(i)); 
		}
		//sequce >> bno 2logic
		//select seq(num)
		//alter bono logic
		if(list.size()>0) {
			int seq = dao.selectSeqOfProjectTB();
			dao.alterbnoFiletable(seq);
			System.out.println("파일 첫 추가시 bno 변경"+seq);
		}
	}
	@Override
	public void create(ProjectVO vo) throws Exception {
		dao.create(vo);
	}
	@Override
	public List<Map<String,Object>> selectFileList(int bno) throws Exception {
		return dao.selectFileList(bno);
	}
	@Override
	public void update(ProjectVO vo) throws Exception {
		
	}
	@Override
	public void delete(int num) throws Exception {
		dao.delete(num);
	}

	@Override
	public void alterbnoFiletable(int seq) throws Exception {
		// TODO Auto-generated method stub
		dao.alterbnoFiletable(seq);
	}
	
	//첨부파일 다운로드
	@Override
	public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception {
		return dao.selectFileInfo(map);
	}

	@Override
	public void modifyData(ProjectVO vo,MultipartHttpServletRequest mpRequest) throws Exception {
		
		
		dao.update(vo); //게시글을 업데이트 

		
		
		List<Map<String,Object>> list = fileUtils.parseInsertFileInfo(vo,mpRequest);
		Map<String,Object> tempMap = null;
		int size = list.size(); 
		System.out.println("===ModifyData List size Log : "+ size);
		for(int i=0;i<size;i++) {
			tempMap = list.get(i);
			System.out.println("===ModifyData Y Log : insertFile");
			dao.insertFile(tempMap);
			int seq = dao.selectSeqOfProjectTB();
			dao.alterbnoFiletable(seq);
		}
		 
		//삭제 박스값 받아 삭제처리
		String[] deletebox = mpRequest.getParameterValues("delete");
		if(deletebox!=null) {
			for(int i = 0 ; i < deletebox.length;i++) {
				System.out.println("VALUE : FileNO : "+deletebox[i]);
				dao.deleteFiles(Integer.parseInt(deletebox[i]));
			}
		}
	}
}
