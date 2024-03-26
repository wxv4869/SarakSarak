# 📖 온라인 서점 웹 사이트, 사락사락

## 📝 목차
1. <a href="#01-프로젝트-개요">프로젝트 개요</a>
2. <a href="#02-진행-목적">진행 목적</a>
3. <a href="#03-진행-기간">진행 기간</a>
4. <a href="#04-프로젝트-기여-부분">프로젝트 기여 부분</a>
5. <a href="#05-개발-환경-및-사용-기술">개발 환경 및 사용 기술</a>
6. <a href="#06-구현된-전체-기능">구현된 전체 기능</a>
7. <a href="#07-주요-기능-구동-화면">주요 기능 구동 화면</a>
8. <a href="#08-db-erd">DB E-R-Diagram</a>
9. <a href="#09-기능-및-화면-상세-설명-pdf">기능 및 화면 상세 설명 (PDF)</a>
10. <a href="#10-시연-영상-youtube">시연 영상 (Youtube)</a>
11. <a href="#11-참고-레퍼런스">참고 레퍼런스</a>
<br><br>

## 01 프로젝트 개요
<div align="center">
   <img src="https://github.com/wxv4869/SarakSarak/assets/89888817/b0077f0f-9732-40d4-880b-da4810c89f49" width="800">
   <i><p>사락사락 메인페이지</p></i>
</div>
<br><br>

- ‘사락사락’은 책을 <strong>온라인 서점 웹 사이트</strong>로, 도서의 상세 정보 조회와 도서 상품 구매 서비스를 제공합니다.<br>
- 전체 도서 상품 목록, 베스트셀러 도서 상품 목록, 신간 도서 상품 목록을 확인할 수 있습니다.<br>
- 원하는 도서 상품을 장바구니에 담아 한 번에 주문하거나 바로 구매를 통해 빠르게 구매할 수 있습니다.
<br><br>

## 02 진행 목적
- Spring 도서 <코드로 배우는 스프링 웹 프로젝트 (구멍가게 코딩단)>로 Spring을 공부한 후 Spring MVC 동작 구조의 이해 향상을 위한 학습의 목적으로 2인 팀 프로젝트를 진행했습니다.<br>
<br>

## 03 진행 기간
- 2024-01-16 ~ 2024-02-05 (약 3주 소요)
	- UI 디자인 : 2024-01-16 ~ 2024-01-17
	- DB 설계 : 2024-01-17 ~ 2024-01-20
	- 기능 구현 : 2024-01-20 ~ 2024-02-05
<br><br>

## 04 프로젝트 기여 부분
* **공통 기능 구현**
	- 각 카테고리 별 도서 상품 목록과 페이징 처리 (전체 도서, 베스트 도서, 신간 도서)
	- 도서 상품 상세 정보 조회
<br>

* **사용자 기능 구현**
	- 도서 상품 수량 선택 및 구매 기능 (장바구니 담기, 바로구매)
	- 장바구니 상품 삭제와 수량 변경 기능
<br>

* **관리자 기능 구현**
	- 도서 관리 기능 : 도서 상품 등록, 수정, 삭제
	- 작가 관리 기능 : 작가 등록, 수정 삭제
	- 도서 상품 표지, 상세 이미지 업로드 기능
	- 주문 관리 기능 : 주문 상태 업데이트
<br><br>

## 05 개발 환경 및 사용 기술
-   `Java`  : `JDK 8 (Java SE 8)`
-   `WAS` : `Tomcat 9.0`
-   `Java`  : `JDK 8 (Java SE 8)`
-   `IDE` : `STS (Spring Tool Suite)`
-   `Framework` : `Spring Framework`
-   `Database` : `Oracle, SQL Developer, mybatis`
-   `UI 디자인` : `Figma`
-   `협업 및 일정 관리` : `GitHub, Slack, 카카오톡`
-   `회의` : `주 3회 대면 회의`
<br><br>

## 06 구현된 전체 기능
- **사용자 기능**
    - 로그인, 회원가입 (Spring Security)
    - 메인 페이지 (베스트 Top5, 최신 도서 Top 5)
    - 도서 상품 목록 (전체, 베스트셀러, 신간)
    - 도서 상품 장바구니 담기 (등록, 삭제, 수량 변경)
    - 도서 상품 바로 구매
    - 도서 상품 주문
    - 마이페이지 (주문 내역 조회, 회원 정보 수정)
<br>

- **관리자 기능**
    - 회원 관리 (목록, 상세, 정보 수정, 권한 수정, 삭제)
    - 작가 관리 (목록, 조회, 등록, 수정, 삭제)
    - 도서 관리 (목록, 조회, 등록, 수정, 삭제)
    - 주문 관리 (목록, 상세, 주문 상태 수정)
    - 도서 이미지 업로드
<br><br>

## 07 주요 기능 구동 화면
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

<br><br>

## 08 DB ERD
![sqldeveloper_erd](https://github.com/wxv4869/SarakSarak/assets/89888817/79471c7f-d6b5-4a47-b4cf-abaa7ac58a2e)
<br><br>

## 09 기능 및 화면 상세 설명 (PDF)
- https://docs.google.com/viewer?url=https://github.com/wxv4869/SarakSarak/blob/main/saraksarak_ppt.pdf?raw=True
<br><br>

## 10 시연 영상 (Youtube)
- https://youtu.be/DHq8Cz1fAo4
<br><br>

## 11 참고 레퍼런스
- https://kimvampa.tistory.com/category/%EC%8A%A4%ED%94%84%EB%A7%81%20%ED%94%84%EB%A0%88%EC%9E%84%EC%9B%8C%ED%81%AC/%EC%87%BC%ED%95%91%EB%AA%B0%20%ED%94%84%EB%A1%9C%EC%A0%9D%ED%8A%B8
- 코드로 배우는 스프링 웹 프로젝트 (구멍가게코딩단, 남가람북스)
<br><br>
