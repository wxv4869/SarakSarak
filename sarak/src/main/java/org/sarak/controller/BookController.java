package org.sarak.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.List;

import org.sarak.domain.BookAttachVO;
import org.sarak.domain.BookVO;
import org.sarak.domain.Criteria;
import org.sarak.domain.PageDTO;
import org.sarak.mapper.BookMapper;
import org.sarak.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/sarak")
@AllArgsConstructor
public class BookController {
	
	private BookService bookService;
	
	@Autowired
	private BookMapper bookMapper;
	
	// 메인 페이지
	@GetMapping("/main")
	public void main() {
		
		log.info("###### 메인 페이지 진입 ######");
		
	}
	
	// 전체도서 비동기
	@RequestMapping("/allBookListAjax")
	public @ResponseBody List<BookVO> allBookListAjax() {
		
		List<BookVO> allBookListAjax = bookMapper.allBookListAjax();
		
		for (BookVO book : allBookListAjax) {
			
			int bid = book.getBid();
			
			List<BookAttachVO> bookAttachList = bookService.getAttachList(bid);
			
			book.setAttachList(bookAttachList);
			
		}
		
		return allBookListAjax;
		
	}
	
	// 전체도서 페이지 (페이징)
	@GetMapping("/allBookList")
	public String allBookList(Criteria cri, Model model) {
		
		log.info("allBookList: " + cri);
		
		List<BookVO> allBookList = bookService.allBookList(cri);
		
		for (BookVO book : allBookList) {
			
			int bid = book.getBid();
			
			List<BookAttachVO> bookAttachList = bookService.getAttachList(bid);
			
			book.setAttachList(bookAttachList);
			
		}
		
		model.addAttribute("allBookList", allBookList);
		
		int total = bookService.getTotal(cri);
		
		log.info("total: " + total);
		
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		
		return "allBookList";
		
	}
	
	@GetMapping(value = "/getAttachList")
	@ResponseBody
	public ResponseEntity<List<BookAttachVO>> getAttachList(@RequestParam(name = "bid", defaultValue = "0") int bid) {
	
		if (bid <= 0) {
			
	        return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
	    }
		
		log.info("getAttachList " + bid);
		
		return new ResponseEntity<>(bookService.getAttachList(bid), HttpStatus.OK);
	
	}
	
	@GetMapping("/display")
	@ResponseBody
	public ResponseEntity<byte[]> getFile(String filename) {
		
		File file = new File("C:\\saraksarak\\" + filename);
		
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
