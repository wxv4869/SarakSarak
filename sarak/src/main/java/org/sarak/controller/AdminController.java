package org.sarak.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.sarak.domain.AuthVO;
import org.sarak.domain.AuthorVO;
import org.sarak.domain.BookAttachVO;
import org.sarak.domain.BookVO;
import org.sarak.domain.Criteria;
import org.sarak.domain.MemberVO;
import org.sarak.domain.OrderDTO;
import org.sarak.domain.PageDTO;
import org.sarak.mapper.BookAttachMapper;
import org.sarak.service.AdminService;
import org.sarak.service.AuthorService;
import org.sarak.service.BookService;
import org.sarak.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.core.JsonProcessingException;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@RequestMapping("/admin/*")
@Controller
@AllArgsConstructor
public class AdminController {
	
	private MemberService memberService;
	
	private AuthorService authorService;
	
	private AdminService adminService;
	
	private BookService bookService;
	
	private BookAttachMapper bookAttachMapper;
	
	private BCryptPasswordEncoder pwdEncoder;

	// member 관련 시작
	@Secured({"ROLE_ADMIN"})
	@GetMapping("/memberlist")
	public void doMemberList(Model model) {
		
		log.info("/memberlist");
		
		model.addAttribute("memberlist", memberService.getList());
	
	}
	
	@Secured({"ROLE_ADMIN"})
	@GetMapping({"/memberget", "/membermodify", "authmodify"})
	public void get(@RequestParam("mid") String mid, Model model) {
		
		log.info("/get");
		
		model.addAttribute("member", memberService.get(mid));
	
	}
	
	@Secured({"ROLE_ADMIN"})
	@PostMapping("/membermodify")
	public String modify(MemberVO member, RedirectAttributes rttr) {
		
		log.info("modify : " + member);
		
		// String inputPw = member.getMpw();
		//		String encodedPassword = pwdEncoder.encode(inputPw);
		//		log.info(encodedPassword);
		//		member.setMpw(encodedPassword);
		
		if(memberService.modifyMember(member)) {
			
			rttr.addFlashAttribute("result", "회원 정보가 수정되었습니다.");
		
		}
		
		return "redirect:/admin/memberlist";
				
	}
	
	@Secured({"ROLE_ADMIN"})
	@PostMapping("/authmodify")
	public String modifyAuth(AuthVO auth, RedirectAttributes rttr) {
		
		log.info("modifyAuth : " + auth);
		
		if(memberService.modifyAuth(auth)) {
			
			rttr.addFlashAttribute("result", "회원 권한이 수정되었습니다.");
		
		}
		
		return "redirect:/admin/memberlist";
		
	}
	
	@Secured({"ROLE_ADMIN"})
	@PostMapping("/memberremove")
	public String remove(@RequestParam("mid") String mid, RedirectAttributes rttr) {
		
		log.info("remove : " + mid);
		
		if(memberService.removeMember(mid)) {
		
			rttr.addFlashAttribute("result", "회원이 탈퇴 되었습니다.");
		
		}
		
		return "redirect:/admin/memberlist";
		
	}

	/* 작가 목록 페이지 */
	@Secured({"ROLE_ADMIN"})
	@GetMapping("/authorlist")
	public void doAuthorList(Criteria cri, Model model) throws Exception {
		
		log.info("###### 작가 목록 페이지 진입 ######");
		
		List authorlist = authorService.authorGetList(cri);
		
		model.addAttribute("authorlist", authorlist);
		
		model.addAttribute("pageMaker", new PageDTO(cri, authorService.authorGetTotal(cri)));
		
	}
	
	/* 작가 상세 페이지, 수정 페이지 */
	@Secured({"ROLE_ADMIN"})
	@GetMapping({"/authorget", "/authormodify"})
	public void authorGet(int authorid, Criteria cri, Model model) throws Exception {
		
		log.info("###### 작가 상세 페이지" + authorid);
		
		model.addAttribute("cri", cri);
		
		model.addAttribute("author", authorService.authorGetDetail(authorid));
		
	}
	
	/* 작가 등록 페이지 */
	@Secured({"ROLE_ADMIN"})
	@GetMapping("/authorinsert")
	public void authorInsertGet() {
		
	}
	
	/* 작가 등록 처리 */
	@Secured({"ROLE_ADMIN"})
	@PostMapping("/authorinsert")
	public String authorInsertPost(AuthorVO author, RedirectAttributes rttr) throws Exception {
		
		log.info("authorInsert : " + author);
		
		authorService.authorInsert(author);
		
		rttr.addFlashAttribute("insert_result", author.getAuthorname());
		
		return "redirect:/admin/authorlist";
		
	}
	
	/* 작가 수정 처리 */
	@Secured({"ROLE_ADMIN"})
	@PostMapping("/authormodify")
	public String authorModifyPost(AuthorVO author, RedirectAttributes rttr) throws Exception {
		
		log.info("authotModifyPost....." + author);
		
		int result = authorService.authorModify(author);
		
		rttr.addFlashAttribute("modify_result", result);
		
		return "redirect:/admin/authorlist";
		
	}
	
	/* 작가 삭제 처리 */
	@Secured({"ROLE_ADMIN"})
	@PostMapping("/authordelete")
	public String authorDeletePost(int authorid, RedirectAttributes rttr) throws Exception {
		
		log.info("authorDeletePost.....");
		
		int result = 0;
		
		try {
			
			result = authorService.authorDelete(authorid);
			
		} catch (Exception e) {
			
			e.printStackTrace();
			
			result = 2;
			
			rttr.addFlashAttribute("delete_result", result);
			
			return "redirect:/admin/authorlist";
			
		}
		
		rttr.addFlashAttribute("delete_result", result);
		
		return "redirect:/admin/authorlist";
		
	}
	
	/* 상품 목록 페이지 */
	@Secured({"ROLE_ADMIN"})
	@GetMapping("/booklist")
	public void doBookList(Criteria cri, Model model) throws Exception {
		
		log.info("###### 도서 목록 페이지 진입 ######");
		
		List booklist = adminService.bookGetList(cri);
		
		model.addAttribute("booklist", booklist);
		
		model.addAttribute("pageMaker", new PageDTO(cri, adminService.bookGetTotal(cri)));
		
	}
	
	/* 상품 상세 페이지, 수정 페이지 */
	@Secured({"ROLE_ADMIN"})
	@GetMapping({"/bookget", "/bookmodify"})
	public void bookGet(@RequestParam("bid") int bid, Criteria cri, Model model) throws Exception {
		
		log.info("###### 도서 상세 페이지" + bid);
		
		List<BookAttachVO> attachList = bookService.getAttachList(bid);
		
		model.addAttribute("cri", cri);
		
		model.addAttribute("attachList", attachList);
		
		model.addAttribute("book", adminService.bookGetDetail(bid));
		
	}
	
	/* 상품 등록 페이지 */
	@Secured({"ROLE_ADMIN"})
	@GetMapping("/bookinsert")
	public void bookInsertGet() {
		
	}
	
	/* 상품 등록 처리 */
	@Secured({"ROLE_ADMIN"})
	@PostMapping("/bookinsert")
	public String bookInsertPost(BookVO book, RedirectAttributes rttr) throws Exception {
		
		log.info("bookInsert : " + book);
		
		adminService.bookInsert(book);
		
		rttr.addFlashAttribute("insert_result", book.getBname());
		
		return "redirect:/admin/booklist";
		
	}
	
	/* 작가 검색 팝업창 */
	@Secured({"ROLE_ADMIN"})
	@GetMapping("/authorPop")
	public void authorPopGet(Criteria cri, Model model) throws Exception {
		
		log.info("authorPopGet.......");
		
		cri.setAmount(100);
		
		List list = authorService.authorGetList(cri);
		
		model.addAttribute("list", list);
		
		model.addAttribute("pageMaker", new PageDTO(cri, authorService.authorGetTotal(cri)));
	
	}
	
	/* 상품 수정 처리 */
	@Secured({"ROLE_ADMIN"})
	@PostMapping("/bookmodify")
	public String bookModifyPost(BookVO bookVO, RedirectAttributes rttr) {
		
		log.info("bookModifyPost......." + bookVO);
		
		adminService.bookModify(bookVO);
		
		rttr.addFlashAttribute("modify_result", bookVO.getBid());
		
		return "redirect:/admin/booklist";
		
	}
	
	/* 상품 삭제 처리 */
	@Secured({"ROLE_ADMIN"})
	@PostMapping("/bookdelete")
	public String bookDeletePost(int bid, RedirectAttributes rttr) throws Exception {
		
		log.info("bookDeletePost.......");
		
		int result = 0;
		
		try {
			
			result = adminService.bookDelete(bid);
			
		} catch (Exception e) {
			
			e.printStackTrace();
			
			result = 2;
			
			rttr.addFlashAttribute("delete_result", result);
			
			return "redirect:/admin/booklist";
			
		}
		
		rttr.addFlashAttribute("delete_result", result);
		
		return "redirect:/admin/booklist";
		
	}
	
	/* 도서 이미지 업로드 */
	@Secured({"ROLE_ADMIN"})
	@GetMapping("/uploadAjax")
	public void uploadAjax() {
		
		log.info("upload ajax");
		
	}
	
	private String getFolder(int bid) {
		
		return String.valueOf(bid);
		
	}
	
	@Secured({"ROLE_ADMIN"})
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
	
	/* 도서 이미지 DB 저장 */
	@Secured({"ROLE_ADMIN"})
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
	
	/* 도서 이미지 삭제 */
//	@Secured({"ROLE_ADMIN"})
//	@PostMapping("/deleteFile")
//	public ResponseEntity<String> deleteFile(){
//		
//	}
	
	/* 도서 이미지 display */
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
	
	/* 주문 목록 페이지 */
	@Secured({"ROLE_ADMIN"})
	@GetMapping("/orderlist")
	public void doOrderList(Criteria cri, Model model) throws Exception {
		
		log.info("###### 주문 목록 페이지 진입 ######");
		
		List orderlist = adminService.orderGetList(cri);
		
		model.addAttribute("orderlist", orderlist);
		
		model.addAttribute("pageMaker", new PageDTO(cri, adminService.orderGetTotal(cri)));
		
	}
	
	/* 주문 상태 변경 */
	@Secured({"ROLE_ADMIN"})
	@PostMapping("/updateOrderState")
	public String updateOrderStatePost(OrderDTO orderDTO, RedirectAttributes rttr) {
		
		log.info("updateOrderStatePost......." + orderDTO);
	
		orderDTO.setOrderstate("배송완료");
		
		int result = adminService.orderstateUpdate(orderDTO);
		
		rttr.addFlashAttribute("modify_result", result);
	
		return "redirect:/admin/orderlist";
	    
	}
	
}
