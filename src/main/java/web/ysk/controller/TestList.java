package web.ysk.controller;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import web.ysk.service.mybatisTestService;

public class TestList {
	private static final Logger logger = LoggerFactory.getLogger(ProjectController.class);
	
	@Resource(name = "testService")
	private mybatisTestService mybatisTestservice;
 
	@RequestMapping(value = "/TestM", method = RequestMethod.GET)
	public String boardList(Model model) throws Exception {

	    List list = mybatisTestservice.selectTestList();
	    System.out.println(list);
	    model.addAttribute("list", list);
	    
	    return "board/mybatisTest";
	}
	//URI Mapping이 안되는중
}
