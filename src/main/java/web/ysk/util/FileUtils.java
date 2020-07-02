package web.ysk.util;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import web.ysk.vo.ProjectVO;

@Component("fileUtils")
public class FileUtils {
	
	//filePath home
	//private static final String filePath = "D:\\web\\";
	//filePath study
	private static final String filePath = "C:\\Program Files\\Git\\tmp\\"; 
	
	public List<Map<String, Object>> parseInsertFileInfo(ProjectVO projectVO, MultipartHttpServletRequest mpRequest)
			throws Exception{

		String originalFileName = null;
		String originalFileExtension = null;
		String storedFileName = null;
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		Map<String, Object> listMap = null;
		MultipartFile multipartFile = null;

		int bno = projectVO.getNum();
		File file = new File(filePath);
		if(file.exists() == false) {
			file.mkdirs();
		}
		
		List<MultipartFile> fileList = mpRequest.getFiles("file");

		for (MultipartFile mf : fileList) {
			System.out.println(">>MultipartFileNames :" + mf.getOriginalFilename());
			if (mf.isEmpty() == false) {
				originalFileName = mf.getOriginalFilename();
				originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
				storedFileName = originalFileName + originalFileExtension;
				file = new File(filePath + storedFileName);
				mf.transferTo(file);
				listMap = new HashMap<String, Object>();
				listMap.put("BNO", bno);
				listMap.put("ORG_FILE_NAME", originalFileName);
				listMap.put("STORED_FILE_NAME", storedFileName);
				listMap.put("FILE_SIZE", mf.getSize());
				list.add(listMap);
			}
		}
		return list;
	}
}
