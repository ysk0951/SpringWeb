package web.ysk.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import web.ysk.dao.TestDAO;

@Service("testService")
public class mybatisTestServiceImple implements mybatisTestService{
	
	@Autowired(required = false)
	private TestDAO dao; 
 
	@Transactional
	@Override
	public List selectTestList() {
		return dao.selectAll();
	}
}
