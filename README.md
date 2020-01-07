<h1>AcademyCommunitySite</h1>
<ul>
  <li><b>프로젝트 주제 : </b>학원 커뮤니티 사이트</li>
  <li><b>개발 기간 : </b>2019.11.05(화) ~ 2019.12.10(화)</li>
  <li><b>개발 인원 : </b>5명</li>
  <li><b>개발 환경 : </b>javaEE, Eclipse, Oracle, Spring, Mybatis, JSP, Ajax, jQuery, API </li>
  <li><b>프로젝트 소개 : </b>수강생의 출석관리와 정보 교환을 위한 학원 커뮤니티 사이트</li>
  <li><b>본인 개발 Part</b>
  : 이미지 갤러리 게시판 기획 및 설계</li></ul><br>
    <b>1)이미지 갤러리 메인</b><br>
    &nbsp;&nbsp;&nbsp;-Ajax를 사용하여 최신게시글 순서대로 출력, paging 처리<br>
    &nbsp;&nbsp;&nbsp;-Ajax를 사용하여 아이디/제목/내용별로 게시글 검색<br> 
    <b>2)게시판 글 쓰기</b><br>
    &nbsp;&nbsp;&nbsp;-로그인 여부에 따라 게시글 쓰기 권한<br>
    &nbsp;&nbsp;&nbsp;-이미지 업로드 & 다운로드<br>    
    <b>3)게시판 글 상세 보기</b><br>
    <b>&nbsp;&nbsp;3-1)게시글 이전글/다음글</b><br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-게시판의 이전글 / 다음글로 이동 하도록 기능 구현<br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(마지막 페이지 도달했을 때 alert!)<br>
    <b>&nbsp;&nbsp;3-2)게시판 좋아요/좋아요 취소</b><br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-게시판 글 상세 보기 페이지 로드시 로그인 값과 게시글 번호 값으로 좋아요/좋아요 취소 여부 조회<br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-이전에 좋아요를 했다면, 버튼 상태 좋아요 취소를 할 수 있도록 변경 / <br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;이전에 좋아요를 한 적이 없다면, 버튼 상태 좋아요 할 수 있도록 변경<br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-> 좋아요는 한 번만 할 수 있도록 설정<br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-Ajax를 사용하여 좋아요/좋아요취소 처리<br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-Ajax를 사용하였지만, 게시글의 조회수는 변동 없도록 유지! -> 좋아요/좋아요 취소 부분만 변경<br>
    <b>&nbsp;&nbsp;3-3)게시판 댓글 쓰기 / 보여주기 / 수정 / 삭제</b><br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-Ajax를 사용하여 댓글 작성<br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-댓글 작성자가 게시글 작성자와 동일할 시 댓글 옆에 작성자 표시<br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-로그인 값이 댓글작성자와 동일할때만 댓글 수정/삭제 버튼 활성화<br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-관리자의 경우 댓글 삭제만 가능<br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-댓글 수정 버튼 클릭시 입력창 활성화 & 확인 버튼 활성화<br>
    <b>4)게시판 글 수정</b><br>
    &nbsp;&nbsp;&nbsp;-로그인 값과 게시글 작성자가 같을때 수정 버튼 활성화<br>
    &nbsp;&nbsp;&nbsp;-게시글 정보를 불러온뒤, 제목/글내용/이미지업로드 부분만 수정 가능하도록 활성화<br>    
    <b>5)게시판 글 삭제</b><br>
    &nbsp;&nbsp;&nbsp;-로그인 값과 게시글 작성자가 같을때 삭제 버튼 활성화<br> 
  <br>
 ================================================
<br>
<table>
<tr><img src = "">
</tr>
</table>

