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
	//private static final String filePath = "D:\\web\\"; // 파일이 저장될 위치
	private static final String filePath = "C:\\Program Files\\Git\\tmp\\"; // 파일이 저장될 위치
	
	public List<Map<String, Object>> parseInsertFileInfo(ProjectVO projectVO, MultipartHttpServletRequest mpRequest)
			throws Exception{

		Iterator<String> iterator = mpRequest.getFileNames();
		MultipartFile multipartFile = null;
		String originalFileName = null;
		String originalFileExtension = null;
		String storedFileName = null;
		
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		Map<String, Object> listMap = null;
		
		int bno = projectVO.getNum();
		File file = new File(filePath);
		if(file.exists() == false) {
			file.mkdirs();
		}
		
		while(iterator.hasNext()) {
			multipartFile = mpRequest.getFile(iterator.next());
			if(multipartFile.isEmpty() == false) {
				originalFileName = multipartFile.getOriginalFilename();
				originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
				storedFileName = originalFileName + originalFileExtension; 
				System.out.println("LOGT : StoredFILEName : "+storedFileName);
				file = new File(filePath + storedFileName);
				multipartFile.transferTo(file); 
				listMap = new HashMap<String, Object>();
				listMap.put("BNO", bno);
				listMap.put("ORG_FILE_NAME", originalFileName);
				listMap.put("STORED_FILE_NAME", storedFileName);
				listMap.put("FILE_SIZE", multipartFile.getSize());
				list.add(listMap);
			}
		}
		return list;
	}
	
	public List<Map<String, Object>> parseInsertFileInfo(ProjectVO projectVO, String[] files, String[] fileNames,
			MultipartHttpServletRequest mpRequest) throws Exception {
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		Map<String, Object> listMap = null; 
		Iterator<String> iterator = mpRequest.getFileNames();
		MultipartFile multipartFile = null; 
		String originalFileName = null; 
		String originalFileExtension = null; 
		String storedFileName = null;
		int bno = projectVO.getNum();
		System.out.println("******multifile upload*****");
		System.out.println("data bno: "+bno);
		System.out.println("data originalFileName: "+originalFileName);
		System.out.println("data originalFileExtension: "+originalFileExtension);
		System.out.println("data storedFileName: "+storedFileName);
		
		while(iterator.hasNext()) {
			multipartFile = mpRequest.getFile(iterator.next());
			if(multipartFile.isEmpty() == false) {
				originalFileName = multipartFile.getOriginalFilename();
				originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
				storedFileName = originalFileName + originalFileExtension; 
				System.out.println("LOGT : StoredFILEName : "+storedFileName);
				File file = new File(filePath + storedFileName);
				multipartFile.transferTo(file); 
				listMap = new HashMap<String, Object>();
				listMap.put("BNO", bno);
				listMap.put("ORG_FILE_NAME", originalFileName);
				listMap.put("STORED_FILE_NAME", storedFileName);
				listMap.put("FILE_SIZE", multipartFile.getSize());
				list.add(listMap);
			}
		}
		
		if(files != null && fileNames != null){ 
			for(int i = 0; i<fileNames.length; i++) {
					listMap = new HashMap<String,Object>();
                    listMap.put("IS_NEW", "N");
					listMap.put("FILE_NO", files[i]); 
					list.add(listMap); 
			}
		}
		return list; 
	}
}
