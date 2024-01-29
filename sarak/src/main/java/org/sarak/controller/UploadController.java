package org.sarak.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.sarak.domain.BookAttachVO;
import org.sarak.mapper.BookAttachMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class UploadController {
	
	@Setter(onMethod_ = @Autowired)
	private BookAttachMapper bookAttachMapper;
		
	@GetMapping("/uploadForm")
	public void uploadForm() {
		
		log.info("upload Form");
		
	}
	
	@PostMapping("/uploadFormAction")
	public void uploadFormAction(@RequestParam("bid") int bid, MultipartFile[] bookimg, Model model) {
		
		String uploadFolder = "C:\\saraksarak";
		
		for (MultipartFile multipartFile : bookimg) {
			
			log.info("----------------------------------");
			log.info("Upload File Name : " + multipartFile.getOriginalFilename());
			log.info("Upload File Size : " + multipartFile.getSize());
			
			File saveFile = new File(uploadFolder, multipartFile.getOriginalFilename());
			
			try {
				
				multipartFile.transferTo(saveFile);
				
			} catch (Exception e) {
				
				log.error(e.getMessage());
				
			}
			
		}
		
	}
	
	@Secured({"ROLE_ADMIN"})
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/uploadAjax")
	public void uploadAjax() {
		
		log.info("upload ajax");
		
	}
	
	private boolean checkImageType(File file) {
		
		try {
		
			String fileName = file.getName();
		
			// 파일명에 mainimg 또는 detailimg가 포함되어 있는지 검사
			return fileName.contains("mainimg") || fileName.contains("detailimg");
			
		} catch (Exception e) {
			
			log.error(e.getMessage());
			
		}
	
		return false;
	
	}
	
	private String getFolder(int bid) {
		
		return String.valueOf(bid);
		
	}
	
	@Secured({"ROLE_ADMIN"})
	@PreAuthorize("isAuthenticated()")
	@PostMapping(value = "/uploadAjaxAction")
	@ResponseBody
	public ResponseEntity<List<BookAttachVO>> uploadAjaxPost(@RequestParam("bid") int bid, MultipartFile[] bookimg, BookAttachVO bookAttachVO) {
		
		List<BookAttachVO> list = new ArrayList<>();
		
		log.info("Received bid: " + bid);
		
	    log.info("Received files count: " + (bookimg != null ? bookimg.length : 0));
		
		String uploadFolder = "C:\\saraksarak";
		
		String uploadFolderPath = getFolder(bid);
		
		File uploadPath = new File(uploadFolder, uploadFolderPath);
		
		log.info("upload folder path : " + uploadFolderPath);
		
		if (uploadPath.exists() == false) {
			
			uploadPath.mkdirs();
			
		}
		
		for (MultipartFile multipartFile : bookimg) {
			
			BookAttachVO BookAttachVO = new BookAttachVO();
			
			String uploadFileName = multipartFile.getOriginalFilename();
			
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);
			
			log.info("Only File Name : " + uploadFileName);
			
			log.info("bid : " + bid);
			
			try {
				
				File saveFile = new File(uploadPath, uploadFileName);
				
				multipartFile.transferTo(saveFile);
				
				BookAttachVO.setFilename(uploadFileName.toString());
				
				BookAttachVO.setUploadpath(uploadFolderPath);
				
				BookAttachVO.setBid(bid);
				
				list.add(BookAttachVO);
				
				
			} catch (Exception e) {
				
				log.error(e.getMessage());
				
			}
			
		}
		
		return new ResponseEntity<>(list, HttpStatus.OK);
		
	}
	
	@Secured({"ROLE_ADMIN"})
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/saveToDatabase")
    @ResponseBody
    public ResponseEntity<String> saveToDatabase(@RequestBody Map<String, Object> requestMap) {
		
		try {
			
			int bid = Integer.parseInt(requestMap.get("bid").toString());
			List<Map<String, String>> files = (List<Map<String, String>>) requestMap.get("files");
			
			for (Map<String, String> file : files) {
				
				String filename = file.get("filename");
				String uploadpath = file.get("uploadpath");
				
				BookAttachVO bookAttachVO = new BookAttachVO();
				bookAttachVO.setBid(bid);
				bookAttachVO.setFilename(filename);
				bookAttachVO.setUploadpath(uploadpath);
				
				bookAttachMapper.insert(bookAttachVO);
				
			}
			
			return new ResponseEntity<>("Success", HttpStatus.OK);
			
		} catch (Exception e) {
			
			log.error("DB 저장 중 오류 발생 : " + e.getMessage());
			
			return new ResponseEntity<>("Failed", HttpStatus.INTERNAL_SERVER_ERROR);
			
		}
		
	}
	
	@GetMapping("/display")
	@ResponseBody
	public ResponseEntity<byte[]> getFile(String filename) {
		
		log.info("filename : " + filename);
		
		File file = new File("C:\\saraksarak\\" + filename);
		
		log.info("file : " + file);
		
		ResponseEntity<byte[]> result = null;
		
		try {
			
			HttpHeaders header = new HttpHeaders();
			
			header.add("Content-Type", Files.probeContentType(file.toPath()));
			
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
			
		} catch (IOException e) {
			
			e.printStackTrace();
			
		}
		
		return result;
		
	}

}
