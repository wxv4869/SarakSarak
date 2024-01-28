package org.sarak.mapper;

import java.time.LocalDate;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.sarak.domain.BookVO;
import org.sarak.domain.Criteria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BookMapperTests {
	
	@Setter(onMethod_ = @Autowired)
	private BookMapper bookMapper;
	
	// 도서 목록 조회 테스트
	@Test
	public void testGetList() {
		
		bookMapper.allBookList().forEach(book -> log.info(book));
		
	}
	
	// 도서 추가 테스트 (관리자)
//	@Test
//	public void testInsert() {    // seq_book 시작 번호 바꿔야 되나?
//		
//		BookVO book = new BookVO();
//		book.setBname("insert테스트 제목");
//		book.setBprice(15000);
//		book.setIsbn("1234567890");
//	    book.setPubdate("2024/01/01");
//	    book.setPublisher("insert테스트 출판사");
//	    book.setAuthorid(24);
//		book.setSummary("insert테스트 줄거리");
//		book.setContents("insert테스트 목차");
//		
//		bookMapper.insert(book);
//		
//		log.info(book);
//		
//	}
	
//	// 도서 조회 테스트
//	@Test
//	public void testRead() {
//		
//		BookVO book = bookMapper.read(4);
//		
//		log.info(book);
//		
//	}
	
	// 도서 삭제 테스트
//	@Test
//	public void testDelete() {
//		
//		log.info("DELETE BID: " + bookMapper.delete(80));
//		
//	}

	// 도서 정보 수정 테스트
//	@Test
//	public void testUpdate() {
//		
//		BookVO book = new BookVO();
//		book.setBid(4);
//		book.setBname("나는 메트로폴리탄 미술관의 경비원입니다");
//		book.setBprice(17500);    // 20000으로 테스트 성공 후 원상복구함
//		book.setIsbn("9788901276533");
//	    book.setPubdate("23/11/24");
//	    book.setPublisher("웅진지식하우스");
//	    book.setAuthorid(24);
//		book.setSummary("“나의 결혼식이 열렸어야 했던 날, 형의 장례식이 거행되었다.\\n그해 가을, 나는 다니던 《뉴요커》를 그만두고\\n메트로폴리탄 미술관의 경비원으로 지원했다.\\n그렇게 한동안은 고요하게 서 있고 싶었다”\\n\\n뉴욕 메트로폴리탄 미술관의 경비원으로 10년,\\n인류의 위대한 걸작들을 가장 가까이서 지켜본 한 남자의\\n삶과 죽음, 인생과 예술에 대한 우아하고 지적인 회고\\n\\n『나는 메트로폴리탄 미술관의 경비원입니다』는 뉴욕 메트로폴리탄 미술관에서 경비원으로 근무했던 패트릭 브링리의 독특하면서도 지적인 회고를 담은 에세이다. 가족의 죽음으로 고통 속에 웅크리고 있던 한 남자가 미술관에서 10년이라는 시간을 보내며 상실감을 극복하고 마침내 세상으로 나아갈 힘을 얻는 여정을 섬세하게 그려냈다.\\n\\n선망 받는 직장에서 화려한 성공을 꿈꾸며 경력을 쌓아가던 저자는 어느 날 갑자기 찾아온 가족의 죽음을 겪게 된다. 이를 계기로 삶의 의욕을 완전히 잃은 끝에 세상에서 가장 아름다운 공간에서, 가장 단순한 일을 하며 스스로를 놓아두기로 결심한다. 그렇게 도피하듯 메트로폴리탄 미술관의 경비원이 된 브링리는 매일 다른 전시실에서 최소 여덟 시간씩 조용히 서서 경이로운 예술 작품들을 지켜보는 ‘특권’을 누리게 된다. 거장들의 혼이 담긴 그림과 조각부터 고대 이집트 건축물에 이르기까지 인류의 위대한 걸작들과 오롯이 교감하고, 푸른 제복 아래 저마다의 사연을 지닌 동료 경비원들과 연대하는 동안 서서히 삶과 죽음, 일상과 예술의 의미를 하나씩 발견해나가며 멈췄던 인생의 걸음을 다시 내딛기 시작한다.\\n\\n저자의 첫 번째 저서인 이 책은 영미권 유수 언론으로부터 ‘잊을 수 없을 만큼 눈부시게 아름다운 이야기’, ‘슬픔까지도 포용하는 삶에 대한 빛나는 서사’라는 극찬을 받으며 40주 연속 아마존 베스트셀러에 올랐다. 상실의 아픔 속에서 길어 올린 삶과 예술의 의미, 그리고 다시 앞으로 나아갈 용기를 들려주는 저자의 내밀한 고백은 예기치 못한 인생의 소용돌이 앞에서 발걸음을 멈춰버린 이들, 소란한 세상에 지쳐 완벽한 고독을 꿈꾸는 이들에게 잔잔하지만 묵직한 사색의 시간을 선사한다.");
//		book.setContents("1장. 가장 아름다운 곳에서 가장 단순한 일을 하는 사람\\n2장. 완벽한 고독이 건네는 위로\\n3장. 위대한 그림은 거대한 바위처럼 보일 때가 있다\\n4장. 사치스러운 초연함으로\\n5장. 입자 하나하나가 의미를 갖는 드문 순간\\n6장. 예술가들도 메트에서는 길을 잃을 것이다\\n7장. 우리가 아는 최선을 다해\\n8장. 푸른색 근무복 아래의 비밀스러운 자아들\\n9장. 예술이 무엇을 드러내는지 이해하려고 할 때\\n10장. 애도의 끝을 애도해야 하는 날들\\n11장. 완벽하지도 않고 완성할 수도 없는 프로젝트\\n12장. 무지개 모양을 여러 번 그리면서\\n13장. 삶은 우리를 내버려두지 않는다");
//		
//		int count = bookMapper.update(book);
//		log.info("UPDATE COUNT: " + count);
//		
//	}
	
	// 목록 페이징 테스트
	@Test
	public void testPaging() {
		
		Criteria cri = new Criteria();
		
		cri.setPageNum(1);
		
		cri.setAmount(10);
		
		List<BookVO> bookList = bookMapper.bookListWithPaging(cri);
		
		bookList.forEach(book -> log.info(book.getBid()));
		
	}

}
