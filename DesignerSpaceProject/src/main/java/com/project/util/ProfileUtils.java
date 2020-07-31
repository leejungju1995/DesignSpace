package com.project.util;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Component("profileUtils")
public class ProfileUtils {

	private static final String FILE_PATH = "D:\\profile";	
	
	public List<Map<String, Object>> parseInsertFileInfo(int profile_table_mno,
			MultipartHttpServletRequest mulRequest) 
				throws IllegalStateException, IOException{
		
		Iterator<String> iterator = 
				mulRequest.getFileNames();
		
		MultipartFile multipartFile = null;
		
		String originalFileName = null;
		String originalFileExtension = null;
		String storedFileName = null;
		
		List<Map<String, Object>> profileList = 
			new ArrayList<Map<String,Object>>();
		Map<String, Object> profileInfoMap = null;
		
		File file = new File(FILE_PATH);
		
		if(file.exists() == false) {
			file.mkdirs();
		}
		
		while(iterator.hasNext()) {
			multipartFile = 
					mulRequest.getFile(iterator.next());
			
			if(multipartFile.isEmpty() == false) {
				originalFileName = multipartFile.getOriginalFilename();
				originalFileExtension = 
					originalFileName.substring(
						originalFileName.lastIndexOf("."));
				storedFileName = CommonUtils.getRandomString() 
						+ originalFileExtension;
				 
				file = new File(FILE_PATH, storedFileName);
				multipartFile.transferTo(file);
				
				profileInfoMap = new HashMap<String, Object>();
				profileInfoMap.put("profile_table_mno", profile_table_mno);
				profileInfoMap.put("profile_table_original_name", originalFileName);
				profileInfoMap.put("profile_table_stored_name", storedFileName);
				
				
				profileList.add(profileInfoMap);
				
			}
			
		} // while end 
		
		
		return profileList;
	}

	public void UpdateProfile(Map<String, Object> tempFileMap) 
		throws Exception{
		// TODO Auto-generated method stub
		
		String storedFileName 
			= (String)tempFileMap.get("PROFILE_TABLE_STORED_NAME");
		
		System.out.println(storedFileName);
		
		File file = new File(FILE_PATH + "/" + storedFileName);
		if(file.exists()) {
			file.delete();
		}else {
			System.out.println("파일이 존재하지 않습니다.");
			throw new Exception();
		}
		
		
	}
	
}
