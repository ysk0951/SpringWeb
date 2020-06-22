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
	
	//구현하지 않은상태여서 Injection 을 안해줬음
	//Injection시 에러가남
	private TestDAO dao;

	@Transactional
	@Override
	public List selectTestList() {
		//Null이어야하는데 메소드가 나옴
		return dao.selectAll();
	}
}
