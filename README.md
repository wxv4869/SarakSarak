# 📖 온라인 서점 웹 사이트, 사락사락

## 프로젝트 소개
<div align="center">
   <img src="https://github.com/wxv4869/SarakSarak/assets/89888817/b0077f0f-9732-40d4-880b-da4810c89f49" width="800">
   <i> >>사락사락 메인페이지</i>
</div>
‘사락사락’은 책을 <strong>온라인 서점 웹 사이트</strong>로, 도서의 상세 정보 조회와 도서 상품 구매 서비스를 제공합니다.<br>
- 전체 도서 상품 목록, 베스트셀러 도서 상품 목록, 신간 도서 상품 목록을 확인할 수 있습니다.<br>
- 원하는 도서 상품을 장바구니에 담아 한 번에 주문하거나 바로 구매를 통해 빠르게 구매할 수 있습니다.
<br>

## 팀원 구성
- 이지윤
- 오수지
<br>

## 1. 개발 환경
-   `Java`  : `JDK 8 (Java SE 8)`
-   `WAS` : `Tomcat 9.0`
-   `Java`  : `JDK 8 (Java SE 8)`
-   `IDE` : `STS (Spring Tool Suite)`
-   `Framework` : `Spring Framework`
-   `Database` : `Oracle, SQL Developer, mybatis`
-   `협업 및 일정 관리` : `GitHub, Slack, 카카오톡`
-   `회의` : `주 3회 대면 회의`
-   `디자인` : `Figma`
<br>

## 2. 디자인(Figma)
![figma](https://github.com/wxv4869/SarakSarak/assets/89888817/7c40c454-4697-44a1-a72a-cecb53ff508e)
<br>

## 3. DB E-R Diagram
![sqldeveloper_erd](https://github.com/wxv4869/SarakSarak/assets/89888817/79471c7f-d6b5-4a47-b4cf-abaa7ac58a2e)
<br>

## 4. 프로젝트 구조
```
📦 
└─ sarak
   ├─ .classpath
   ├─ .project
   ├─ .settings
   ├─ .springBeans
   ├─ pom.xml
   ├─ src
   │  ├─ main
   │  │  ├─ java
   │  │  │  └─ org
   │  │  │     └─ sarak
   │  │  │        ├─ controller
   │  │  │        │  ├─ AdminController.java
   │  │  │        │  ├─ BookController.java
   │  │  │        │  ├─ CartController.java
   │  │  │        │  ├─ CommonController.java
   │  │  │        │  ├─ HomeController.java
   │  │  │        │  ├─ IndexController.java
   │  │  │        │  ├─ MypageController.java
   │  │  │        │  └─ OrderController.java
   │  │  │        ├─ domain
   │  │  │        │  ├─ AttachFileDTO.java
   │  │  │        │  ├─ AuthVO.java
   │  │  │        │  ├─ AuthorVO.java
   │  │  │        │  ├─ BookAttachVO.java
   │  │  │        │  ├─ BookSalesVO.java
   │  │  │        │  ├─ BookStockVO.java
   │  │  │        │  ├─ BookVO.java
   │  │  │        │  ├─ CartDTO.java
   │  │  │        │  ├─ Criteria.java
   │  │  │        │  ├─ MemberVO.java
   │  │  │        │  ├─ OrderCancelDTO.java
   │  │  │        │  ├─ OrderDTO.java
   │  │  │        │  ├─ OrderDetailDTO.java
   │  │  │        │  ├─ OrderPageDTO.java
   │  │  │        │  ├─ OrderPageItemDTO.java
   │  │  │        │  └─ PageDTO.java
   │  │  │        ├─ mapper
   │  │  │        │  ├─ AdminMapper.java
   │  │  │        │  ├─ AuthorMapper.java
   │  │  │        │  ├─ BookAttachMapper.java
   │  │  │        │  ├─ BookMapper.java
   │  │  │        │  ├─ CartMapper.java
   │  │  │        │  ├─ MemberMapper.java
   │  │  │        │  └─ OrderMapper.java
   │  │  │        ├─ security
   │  │  │        │  ├─ CustomAccessDeniedHandler.java
   │  │  │        │  ├─ CustomAuthSuccessHandler.java
   │  │  │        │  ├─ CustomLoginSuccessHandler.java
   │  │  │        │  ├─ CustomUserDetailsService.java
   │  │  │        │  └─ domain
   │  │  │        │     └─ CustomUser.java
   │  │  │        └─ service
   │  │  │           ├─ AdminService.java
   │  │  │           ├─ AdminServiceImpl.java
   │  │  │           ├─ AuthorService.java
   │  │  │           ├─ AuthorServiceImpl.java
   │  │  │           ├─ BookService.java
   │  │  │           ├─ BookServiceImpl.java
   │  │  │           ├─ CartService.java
   │  │  │           ├─ CartServiceImpl.java
   │  │  │           ├─ MemberService.java
   │  │  │           ├─ MemberServiceImpl.java
   │  │  │           ├─ OrderService.java
   │  │  │           └─ OrderServiceImpl.java
   │  │  ├─ resources
   │  │  │  ├─ log4j.xml
   │  │  │  ├─ log4jdbc.log4j2.properties
   │  │  │  └─ org
   │  │  │     └─ sarak
   │  │  │        └─ mapper
   │  │  │           ├─ AdminMapper.xml
   │  │  │           ├─ AuthorMapper.xml
   │  │  │           ├─ BookAttachMapper.xml
   │  │  │           ├─ BookMapper.xml
   │  │  │           ├─ CartMapper.xml
   │  │  │           ├─ MemberMapper.xml
   │  │  │           └─ OrderMapper.xml
   │  │  └─ webapp
   │  │     ├─ WEB-INF
   │  │     │  ├─ spring
   │  │     │  │  ├─ appServlet
   │  │     │  │  │  └─ servlet-context.xml
   │  │     │  │  ├─ root-context.xml
   │  │     │  │  └─ security-context.xml
   │  │     │  ├─ views
   │  │     │  │  ├─ accessError.jsp
   │  │     │  │  ├─ admin
   │  │     │  │  │  ├─ authmodify.jsp
   │  │     │  │  │  ├─ authorPop.jsp
   │  │     │  │  │  ├─ authorget.jsp
   │  │     │  │  │  ├─ authorinsert.jsp
   │  │     │  │  │  ├─ authorlist.jsp
   │  │     │  │  │  ├─ authormodify.jsp
   │  │     │  │  │  ├─ bookget.jsp
   │  │     │  │  │  ├─ bookinsert.jsp
   │  │     │  │  │  ├─ booklist.jsp
   │  │     │  │  │  ├─ bookmodify.jsp
   │  │     │  │  │  ├─ memberget.jsp
   │  │     │  │  │  ├─ memberlist.jsp
   │  │     │  │  │  ├─ membermodify.jsp
   │  │     │  │  │  ├─ orderget.jsp
   │  │     │  │  │  ├─ orderlist.jsp
   │  │     │  │  │  └─ uploadAjax.jsp
   │  │     │  │  ├─ cartList.jsp
   │  │     │  │  ├─ customLogin.jsp
   │  │     │  │  ├─ home.jsp
   │  │     │  │  ├─ includes
   │  │     │  │  │  ├─ adminfooter.jsp
   │  │     │  │  │  ├─ adminheader.jsp
   │  │     │  │  │  ├─ footer.jsp
   │  │     │  │  │  └─ header.jsp
   │  │     │  │  ├─ index
   │  │     │  │  │  ├─ admin.jsp
   │  │     │  │  │  └─ member.jsp
   │  │     │  │  ├─ mypage
   │  │     │  │  │  ├─ mypage.jsp
   │  │     │  │  │  ├─ orderDetail.jsp
   │  │     │  │  │  ├─ orderList.jsp
   │  │     │  │  │  ├─ passwordModify.jsp
   │  │     │  │  │  ├─ profile.jsp
   │  │     │  │  │  └─ profileModify.jsp
   │  │     │  │  ├─ register.jsp
   │  │     │  │  └─ sarak
   │  │     │  │     ├─ allBookList.jsp
   │  │     │  │     ├─ bestBookList.jsp
   │  │     │  │     ├─ bookDetail.jsp
   │  │     │  │     ├─ main.jsp
   │  │     │  │     ├─ newBookList.jsp
   │  │     │  │     ├─ order.jsp
   │  │     │  │     └─ orderComplete.jsp
   │  │     │  └─ web.xml
   │  │     └─ resources
   │  │        ├─ data
   │  │        ├─ dist
   │  │        │  ├─ css
   │  │        │  │  ├─ all.css
   │  │        │  │  ├─ allBook.css
   │  │        │  │  ├─ allBookList.css
   │  │        │  │  ├─ authorPop.css
   │  │        │  │  ├─ bestBook.css
   │  │        │  │  ├─ bookDetail.css
   │  │        │  │  ├─ cartList.css
   │  │        │  │  ├─ customLogin.css
   │  │        │  │  ├─ main.css
   │  │        │  │  ├─ mypage.css
   │  │        │  │  ├─ order.css
   │  │        │  │  ├─ orderDetail.css
   │  │        │  │  ├─ orderList.css
   │  │        │  │  ├─ profile.css
   │  │        │  │  ├─ register.css
   │  │        │  │  ├─ sb-admin-2.css
   │  │        │  │  └─ sb-admin-2.min.css
   │  │        │  └─ js
   │  │        ├─ img
   │  │        │  ├─ attach.png
   │  │        │  ├─ banner.png
   │  │        │  ├─ delete.png
   │  │        │  ├─ empty.png
   │  │        │  └─ logo.jpg
   │  │        ├─ js
   │  │        ├─ less
   │  │        ├─ pages
   │  │        └─ vendor
   │  └─ test
   │     ├─ java
   │     │  └─ org
   │     │     └─ sarak
   │     │        ├─ controller
   │     │        │  ├─ AdminControllerTests.java
   │     │        │  └─ BookControllerTests.java
   │     │        ├─ mapper
   │     │        │  ├─ AdminMapperTests.java
   │     │        │  ├─ AuthorMapperTests.java
   │     │        │  ├─ BookMapperTests.java
   │     │        │  ├─ CartMapperTests.java
   │     │        │  ├─ MemberMapperTests.java
   │     │        │  └─ OrderMapperTests.java
   │     │        ├─ persistence
   │     │        │  ├─ DataSourceTests.java
   │     │        │  └─ JDBCTests.java
   │     │        └─ service
   │     │           ├─ AdminServiceTests.java
   │     │           ├─ AuthorServiceTests.java
   │     │           ├─ BookServiceTests.java
   │     │           ├─ CartServiceTests.java
   │     │           ├─ MemberServiceTests.java
   │     │           └─ OrderServiceTests.java
   │     └─ resources
   │        └─ log4j.xml
```
<br>

## 5. 역할 분담
### 🐬이지윤
- **구현 기능**
	- 사용자
		1. 도서 목록 페이징
		2. 도서 상세 조회 및 수량 선택
		3. 장바구니 상품 추가, 삭제, 수량 변경
	- 관리자
		1. 도서 관리 : 도서 등록, 수정, 삭제
		2. 작가 관리 : 작가 등록, 수정 삭제
		3. 도서 이미지 업로드, 삭제
		4. 주문 관리 : 주문 상태 업데이트
<br>

### 🍊오수지
- **구현 기능**
	- 사용자
		1. 로그인, 회원가입(Spring Security)
		2. 메인페이지 : 신간 도서, 베스트셀러 도서 추출
		3. 바로 구매 기능
		4. 주문 기능
		5. 마이페이지 : 주문 내역 조회, 주문 취소, 회원 정보 수정, 비밀번호 수정
		6. header, footer
	- 관리자
		1. 회원 관리 : 회원 정보 수정, 권한 수정
<br>

## 6. 개발 기간 및 작업 관리
### 개발 기간
- 전체 개발 기간 : 2024-01-16 ~ 2024-02-05 (약 3주 소요)
- UI 구현 : 2024-01-16 ~ 2024-01-17
- DB 설계 : 2024-01-17 ~ 2024-01-20
- 기능 구현 : 2024-01-20 ~ 2024-02-05
<br>

### 작업 관리
- GitHub와 Slack을 통해 진행상황과 코드 공유
- 주 3회 회의 진행하여 작업 순서와 진행 방향에 대한 회의와 역할 분담 진행
<br>

## 7. 구현 기능
- **사용자**
    - 로그인, 회원가입 (Spring Security)
    - 메인 페이지 (베스트 Top5, 최신 도서 Top 5)
    - 도서 상품 목록 (전체, 베스트셀러, 신간)
    - 도서 상품 장바구니 담기 (등록, 삭제, 수량 변경)
    - 도서 상품 바로 구매
    - 도서 상품 주문
    - 마이페이지 (주문 내역 조회, 회원 정보 수정)

- **관리자**
    - 회원 관리 (목록, 상세, 정보 수정, 권한 수정, 삭제)
    - 작가 관리 (목록, 조회, 등록, 수정, 삭제)
    - 도서 관리 (목록, 조회, 등록, 수정, 삭제)
    - 주문 관리 (목록, 상세, 주문 상태 수정)
    - 도서 이미지 업로드
<br>

## 8. 주요 기능 구동 화면
- **회원가입**<br>
<img src="https://github.com/wxv4869/SarakSarak/assets/89888817/4ba2ee9b-89f5-4509-800d-d56a213d9823" width="600"><br>

- **로그인**<br>
<img src="https://github.com/wxv4869/SarakSarak/assets/89888817/0224cf5f-4d79-4bf6-8ad7-301f8e8d7364" width="600"><br>

- **전체 도서 상품 목록**<br>
<img src="https://github.com/wxv4869/SarakSarak/assets/89888817/4375765e-2dae-45e6-95c8-8f57b1b9766f" width="600"><br>

- **상품 상세 페이지 (장바구니 담기)** <br>
<img src="https://github.com/wxv4869/SarakSarak/assets/89888817/729bb473-6850-47fb-99f3-7f2cb123526e" width="600"><br>

- **장바구니 상품 주문**<br>
<img src="https://github.com/wxv4869/SarakSarak/assets/89888817/73a445e7-69fc-4643-a218-24a53ec22271" width="600"><br>

- **상품 바로 구매**<br>
<img src="https://github.com/wxv4869/SarakSarak/assets/89888817/2931c0c8-e4d3-43c8-8bd8-4465efbee261" width="600"><br>

- **마이페이지 (주문 조회 및 취소)** <br>
<img src="https://github.com/wxv4869/SarakSarak/assets/89888817/90ecb26b-ff3f-4c86-8f19-4c8cc8dd4816" width="600"><br>

- **마이페이지 (회원 정보 수정)** <br>
<img src="https://github.com/wxv4869/SarakSarak/assets/89888817/fefb43bb-dca3-4c44-87de-59bc7d0e68b9" width="600"><br>

<br>

## 9. 상세 기능 소개 및 화면
https://docs.google.com/viewer?url=https://github.com/wxv4869/SarakSarak/blob/main/saraksarak_ppt.pdf?raw=True
<br>

## 10. 시연 영상 (Youtube)
https://youtu.be/DHq8Cz1fAo4
<br>

## 11. 참고 레퍼런스
- https://kimvampa.tistory.com/category/%EC%8A%A4%ED%94%84%EB%A7%81%20%ED%94%84%EB%A0%88%EC%9E%84%EC%9B%8C%ED%81%AC/%EC%87%BC%ED%95%91%EB%AA%B0%20%ED%94%84%EB%A1%9C%EC%A0%9D%ED%8A%B8
- 코드로 배우는 스프링 웹 프로젝트 (구멍가게코딩단, 남가람북스)
