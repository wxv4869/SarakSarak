package org.sarak.controller;

import java.util.List;

import org.sarak.domain.BookVO;
import org.sarak.domain.Criteria;
import org.sarak.domain.PageDTO;
import org.sarak.mapper.BookMapper;
import org.sarak.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/sarak/*")
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
		
		return allBookListAjax;
		
	}
	
	// 전체도서 페이지 (페이징)
	@GetMapping("/allBookList")
	public String allBookList(Criteria cri, Model model) {
		
		log.info("allBookList: " + cri);
		
		model.addAttribute("allBookList", bookService.allBookList(cri));
		
		int total = bookService.getTotal(cri);
		
		log.info("total: " + total);
		
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		
		return "allBook";
		
	}

}
