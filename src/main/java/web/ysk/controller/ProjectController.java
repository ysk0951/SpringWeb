package web.ysk.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import web.ysk.dao.Pager;
import web.ysk.service.ProjectService;
import web.ysk.vo.ProjectVO;
@Controller
public class ProjectController {
	private static final Logger logger = LoggerFactory.getLogger(ProjectController.class);
	
	@Inject
	ProjectService service;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		String formattedDate = dateFormat.format(date);
		model.addAttribute("serverTime", formattedDate );
		return "board/home";
	}
	@RequestMapping(value = "/error404", method = RequestMethod.GET)
	public String error(HttpServletResponse response,Model model) {
		response.setStatus(HttpServletResponse.SC_OK);
		logger.warn("404 Error");
		model.addAttribute("content", "1");
		return "board/error";
	} 
	@RequestMapping(value="/main", method=RequestMethod.GET)
	public String projectList(Model model, HttpServletRequest request) {
		//pager를 위한것
		int rowCount =0;
		try {
			rowCount = service.selectRowCount();
			Pager pager = new Pager(rowCount);
			pager.getPage();
			
			List<ProjectVO> list = service.listSearch();//NULLPOINT
			model.addAttribute("list", list);
			model.addAttribute("rowCount",rowCount);
			for(int i=0;i<list.size();i++) {
				System.out.println("Data : "+list.get(i));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "board/main";
	}
	
	@RequestMapping(value="/main/detail", method=RequestMethod.GET)
	public String projectDetail(Model model, HttpServletRequest request) {
		try {
			ProjectVO vo = null;
			String num = request.getParameter("num");
			System.out.println("LOG NUM : "+num);
			System.out.println("LOG vo : "+vo);
			vo = service.listDetail(Integer.parseInt(num));//NULLPOINT
			model.addAttribute("vo", vo);
			model.addAttribute("num", num);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "board/detail";
	}
}
