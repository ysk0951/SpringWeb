package web.ysk.controller;

import java.io.File;
import java.net.URLEncoder;
import java.text.DateFormat;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import web.ysk.dao.Pager;
import web.ysk.service.ProjectService;
import web.ysk.vo.PageVO;
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
	
	@RequestMapping(value = "/submitNewData", method = {RequestMethod.GET ,RequestMethod.POST})
	public String submitNewData(ProjectVO vo,MultipartHttpServletRequest mpRequest,HttpServletRequest request) throws Exception {
		
		logger.info("Submit newDataFile");
		String projectname =(String) request.getParameter("prjectName");
		String content = (String)request.getParameter("content");
		System.out.println(projectname+content);
		vo.setProjectName(projectname);
		vo.setContent(content);
		service.submitNewData(vo,mpRequest);
		return "redirect:/main";
	}
	
	@RequestMapping(value = "/newData", method = {RequestMethod.GET ,RequestMethod.POST} )
	public String newData(Locale locale, Model model,HttpServletRequest request) {
		logger.info("newDataFile Format");
		return "board/newData";
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
		
		//session - 관리자
		//HttpSession httpSession = request.getSession();
		
		//pager를 위한것
		int rowCount =0;
		PageVO pageData = null;
		try {
			//DB접속해서 총게시물의 갯수를 가져옴
			rowCount = service.selectRowCount();
			//총게시물의 갯수를 기준으로 Pager에 대한 데이터를
			//PageVO의 형태로 VIEW로 전송
			Pager pager = new Pager(rowCount);
			pageData = pager.pageCal();
			List<ProjectVO> list = service.listSearch();//
			
			model.addAttribute("list", list);
			model.addAttribute("pageData",pageData);
			for(int i=0;i<list.size();i++) {
				System.out.println("Data : "+list.get(i));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "board/main";
	}
	
	@RequestMapping(value="/main/detail", method=RequestMethod.GET)
	public String projectDetail(Model model, HttpServletRequest request) throws Exception {
	
			ProjectVO vo = null;

			String num = request.getParameter("num");
			vo = service.listDetail(Integer.parseInt(num));//NULLPOINT
			List<Map<String,Object>> files = service.selectFileList(Integer.parseInt(num));
			System.out.println("LOG NUM : "+num);
			System.out.println("LOG vo : "+vo);
			System.out.println("LOG files : "+files.size());
			
			if(files.size()>0) {
				Map<String,Object> map = files.get(0);
				for(Map.Entry<String,Object> entry :map.entrySet()) {
					System.out.println("[KEY : "+entry.getKey()+"]"+"[Value : "+entry.getValue()+"]");
				}
			}
			model.addAttribute("vo", vo);
			model.addAttribute("num", num);
			model.addAttribute("files", files);
			
//			if(files.size()>0) {
//				System.out.println("***FileDetail***");
				return "board/detail";
//			}else {
//				System.out.println("***NoFileDetail***");
//				return "board/detail_nf";	
//			}
	}
	
	@RequestMapping(value = "/modifyForm" , method=RequestMethod.POST)
	public String modifyForm(Model model, HttpServletRequest request) throws Exception{
		
		//Detail Source
		ProjectVO vo = null;

		String num = request.getParameter("num");
		System.out.println("MODIFY TEST Param num: "+num);
		
		vo = service.listDetail(Integer.parseInt(num));//NULLPOINT
		List<Map<String,Object>> files = service.selectFileList(Integer.parseInt(num));
		System.out.println("MODIFY LOG NUM : "+num);
		System.out.println("MODIFY LOG vo : "+vo);
		System.out.println("MODIFY LOG files : "+files.size());
		
		if(files.size()>0) {
			Map<String,Object> map = files.get(0);
			for(Map.Entry<String,Object> entry :map.entrySet()) {
				System.out.println(" MODIFY DETAIL LOG : [KEY : "+entry.getKey()+"]"+"[Value : "+entry.getValue()+"]");
			}
		}
		model.addAttribute("vo", vo);
		model.addAttribute("num", num);
		if(files.size()>0) {
			model.addAttribute("files", files);
		}
		return "board/modifyForm";
	}
	
	@RequestMapping(value="modifyPro", method=RequestMethod.POST)
	public String modifyPro(ProjectVO vo,HttpServletRequest request, MultipartHttpServletRequest mpRequest) throws Exception {
	
		logger.info("modifyPro DataFile");
		String projectname =(String) request.getParameter("projectName");
		String content = (String)request.getParameter("content");
		System.out.println("ModifyProDATA : "+projectname+content);
		vo.setProjectName(projectname);
		vo.setContent(content);
		String[] files = null;
		String[] fileNames = null; 
		service.modifyData(vo,files,fileNames,mpRequest);
		
		return "redirect:/test";
		//return "redirect:/main";
	}
	
	//Mybatis Testing
	@RequestMapping(value="/mainT", method=RequestMethod.GET)
	public String projectListTest(Model model, HttpServletRequest request) throws Exception{
		List<ProjectVO> list = service.listSearch();//
		int count = service.selectRowCount();
		model.addAttribute("list", list);
		model.addAttribute("count", count);
		
		return "board/mainTest"; 
	}
	
	//file DownLoad
	@RequestMapping(value="/fileDown")
	public void fileDown(@RequestParam Map<String,Object> map,HttpServletResponse response) throws Exception {
		Map<String, Object> resultMap = service.selectFileInfo(map);
		String storedFileName = (String) resultMap.get("STORED_FILE_NAME");
		String originalFileName = (String) resultMap.get("ORG_FILE_NAME");
		
		String path = "C:\\Program Files\\Git\\tmp\\";
		//String path = AT HOME;
		// 파일을 저장했던 위치에서 첨부파일을 읽어 byte[]형식으로 변환한다.
		byte fileByte[] = org.apache.commons.io.FileUtils.readFileToByteArray(new File(path+storedFileName));
		
		// downloadFileStream logic
		response.setContentType("application/octet-stream");
		response.setContentLength(fileByte.length);
		response.setHeader("Content-Disposition",  "attachment; fileName=\""+URLEncoder.encode(originalFileName, "UTF-8")+"\";");
		response.getOutputStream().write(fileByte);
		response.getOutputStream().flush();
		response.getOutputStream().close();
		
	}
	
	@RequestMapping(value="/deletePro" ,method=RequestMethod.POST)
	public String deletePro(HttpServletRequest reqeust,HttpServletResponse response) throws Exception {
		Enumeration deletecheck =  reqeust.getAttributeNames();
		System.out.println("****DeletePRO checkbox data****");
		while(deletecheck.hasMoreElements()) {
			System.out.println(deletecheck.nextElement());
		}
		return "redirect:/main";
	}
	
//  다중파일로 변경시 적용
//	게시판 수정 뷰
//	@RequestMapping(value = "/updateView", method = RequestMethod.GET)
//	public String updateView(BoardVO boardVO, @ModelAttribute("scri") SearchCriteria scri, Model model)
//			throws Exception {
//		logger.info("updateView");
//
//		model.addAttribute("update", service.read(boardVO.getBno()));
//		model.addAttribute("scri", scri);
//
//		List<Map<String, Object>> fileList = service.selectFileList(boardVO.getBno());
//		model.addAttribute("file", fileList);
//		return "board/updateView";
//	}
//
//	// 게시판 수정
//	@RequestMapping(value = "/update", method = RequestMethod.POST)
//	public String update(BoardVO boardVO, 
//						 @ModelAttribute("scri") SearchCriteria scri, 
//						 RedirectAttributes rttr,
//						 @RequestParam(value="fileNoDel[]") String[] files,
//						 @RequestParam(value="fileNameDel[]") String[] fileNames,
//						 MultipartHttpServletRequest mpRequest) throws Exception {
//		logger.info("update");
//		service.update(boardVO, files, fileNames, mpRequest);
//
//		rttr.addAttribute("page", scri.getPage());
//		rttr.addAttribute("perPageNum", scri.getPerPageNum());
//		rttr.addAttribute("searchType", scri.getSearchType());
//		rttr.addAttribute("keyword", scri.getKeyword());
//
//		return "redirect:/board/list";
//	}
}
