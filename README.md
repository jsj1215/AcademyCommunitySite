<h1>AcademyCommunitySite</h1>
<ul>
  <li><b>프로젝트 주제 : </b>학원 커뮤니티 사이트</li>
  <li><b>개발 기간 : </b>2019.11.05(화) ~ 2019.12.10(화)</li>
  <li><b>개발 인원 : </b>5명</li>
  <li><b>개발 환경 : </b>javaEE, Eclipse, Oracle, Spring, Mybatis, JSP, Ajax, jQuery, API </li>
  <li><b>프로젝트 소개 : </b>수강생의 출석관리와 정보 교환을 위한 학원 커뮤니티 사이트</li>
  <li><b>본인 개발 Part</b>
  : 이미지 갤러리 게시판 기획 및 설계, 기능구현, 디자인 적용</li></ul><br>
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
<tr><img src = "https://blogfiles.pstatic.net/MjAyMDAxMDdfMjE5/MDAxNTc4NDAxNzgzOTMy.pTTpVt1xyesME-_lF7ohVWhVwC9irhw0pbWV5XmrKzkg.fXdESIbq-_3psyH8F7GeKH0w-iSZ72DkgRNxV2Nh6nIg.JPEG.jsj1215/%EC%8A%AC%EB%9D%BC%EC%9D%B4%EB%93%9C0.JPG?type=w1">
</tr>
  <tr><img src = "https://blogfiles.pstatic.net/MjAyMDAxMDdfODIg/MDAxNTc4NDAxNzg0MjY5.qzpcZLsn1D9idBmqm7VLWwfz72Zc5JqizkT3gJC2SPcg.A9hfsEKD5mpE60GdpMyhhlGLjuoq8uqHYEjOGWzHl_Eg.JPEG.jsj1215/%EC%8A%AC%EB%9D%BC%EC%9D%B4%EB%93%9C1.JPG?type=w1">
</tr>
  <tr><img src = "https://blogfiles.pstatic.net/MjAyMDAxMDdfMTY2/MDAxNTc4NDAxNzg0NTU2.MOR_UWmSLvxcPEkzvCBs9oU1S1jYBM3T3LXRFkouWmAg.59xEb6r9ul_1jVWOxveiiUTWKYF5qwzWph1wLrkaBjAg.JPEG.jsj1215/%EC%8A%AC%EB%9D%BC%EC%9D%B4%EB%93%9C2.JPG?type=w1">
</tr>
  <tr><img src = "https://blogfiles.pstatic.net/MjAyMDAxMDdfMTEz/MDAxNTc4NDAxNzg0ODU3.m0wRzbR2nQRBxV6_QAks-kxhUFH6_v3xUBk0WZaij3Mg.I1i-tQIejdNbK7mdawbSYpLAXwIJyZ7cnkq-2KFE8YMg.JPEG.jsj1215/%EC%8A%AC%EB%9D%BC%EC%9D%B4%EB%93%9C3.JPG?type=w1">
</tr>
  <tr><img src = "https://blogfiles.pstatic.net/MjAyMDAxMDdfMTcy/MDAxNTc4NDAxNzg1MjMw.piiEfGIGlIOJbcd6CeDROmiVLKFMTnMNbgP9_HHHdJgg.FhRoGy96_S0OskQYSudKplr9OdVlMdr5z7ug56gOeU8g.JPEG.jsj1215/%EC%8A%AC%EB%9D%BC%EC%9D%B4%EB%93%9C4.JPG?type=w1">
</tr>
  <tr><img src = "https://blogfiles.pstatic.net/MjAyMDAxMDdfMTQ0/MDAxNTc4NDAxNzg1NTIw.oVFIJICD0KJ1XwAYDhuN9nIUsbRh--DcQ6XEhng9mhMg.TVexREOd1AmSAiXanOTRNFVTzXvF2wyPKoA0UJls0Wkg.JPEG.jsj1215/%EC%8A%AC%EB%9D%BC%EC%9D%B4%EB%93%9C5.JPG?type=w1">
</tr>
  <tr><img src = "https://blogfiles.pstatic.net/MjAyMDAxMDdfNTAg/MDAxNTc4NDAxNzg4NTI3.gsrBYeyFb5hyi8fH8TPpyj7Ps-6kHZDyMDWFzRxBBpUg.Cs2EU2vUv9V1JitTOt3ZVt2Im4g-gKhk8-3duzeZww8g.JPEG.jsj1215/%EC%8A%AC%EB%9D%BC%EC%9D%B4%EB%93%9C15.JPG?type=w1">
</tr>
  <tr><img src = "https://blogfiles.pstatic.net/MjAyMDAxMDdfMTcz/MDAxNTc4NDAxNzg4ODA4.LD21D5L3nU7wrs3wPG0al14mLXzVBJhcIPb-XcpCz7kg.bCRdiwfuUr_ExG4-wQug2y_Hn6LFy1hlAIDflWBpNKkg.JPEG.jsj1215/%EC%8A%AC%EB%9D%BC%EC%9D%B4%EB%93%9C16.JPG?type=w1">
</tr>
  <tr><img src = "https://blogfiles.pstatic.net/MjAyMDAxMDdfNzQg/MDAxNTc4NDAxNzg5MDkx.7jABDOGez8Ibs7Cuuu9sBngYi1S5K3wB4BDHHadDxJYg.2jnh9ofPTaPKy7PYnINbIQOt3GywlhOYQ75XSOWVaGcg.JPEG.jsj1215/%EC%8A%AC%EB%9D%BC%EC%9D%B4%EB%93%9C17.JPG?type=w1">
</tr>
  <tr><img src = "https://blogfiles.pstatic.net/MjAyMDAxMDdfMjMz/MDAxNTc4NDAxNzg5NDE4.XwmuQwM8HioCYPxUqRsm565M9oY40c7WSmqaMx5j_WQg.h4tsIFlHTYtYPNu0KFRAO4dZxezZ9peYbiya4WWvIMog.JPEG.jsj1215/%EC%8A%AC%EB%9D%BC%EC%9D%B4%EB%93%9C18.JPG?type=w1">
</tr>
  <tr><img src = "https://blogfiles.pstatic.net/MjAyMDAxMDdfMTcy/MDAxNTc4NDAxNzg5Njkx.SE2GNvqipo0LG1-SzCJklAHZHKIApNfyyhrDvGcDWs8g.JfK00Ol4hmbK3UcEB1PeHA3yU1ZtqE_GqycMa3_C8b8g.JPEG.jsj1215/%EC%8A%AC%EB%9D%BC%EC%9D%B4%EB%93%9C19.JPG?type=w1">
</tr>
  <tr><img src = "https://blogfiles.pstatic.net/MjAyMDAxMDdfMjMy/MDAxNTc4NDAxNzg5OTcz.S-2xJWobgIRvikp1wa_S1T97hwh9ME28ACBoW0t1nQsg.3Oq7qtevZWMp3wa-UX9_FXmB8EJw_zuBI2EGZoq2Dq4g.JPEG.jsj1215/%EC%8A%AC%EB%9D%BC%EC%9D%B4%EB%93%9C20.JPG?type=w1">
</tr>
  <tr><img src = "https://blogfiles.pstatic.net/MjAyMDAxMDdfMjIy/MDAxNTc4NDAxNzkwMjcy.2Ni2hzrdQJvoNbaZ-AkO41Oip06t3rIPvM3bTjZ14vcg.VJyHIne4GjnZdGacV5PSsHkSvG4nMmzcN2nHMNaIZK0g.JPEG.jsj1215/%EC%8A%AC%EB%9D%BC%EC%9D%B4%EB%93%9C21.JPG?type=w1">
</tr>
  <tr><img src = "https://blogfiles.pstatic.net/MjAyMDAxMDdfMjcg/MDAxNTc4NDAxNzkwNTU1.5kq-2_37t1iTAh35LlVFKdoaCYsKvS5AyF4ugW-57XAg.dXS5sn84NRrX2EH9cBjS9hfou5vIup2v3mruXEZ6qzog.JPEG.jsj1215/%EC%8A%AC%EB%9D%BC%EC%9D%B4%EB%93%9C22.JPG?type=w1">
</tr>
  <tr><img src = "https://blogfiles.pstatic.net/MjAyMDAxMDdfMjE3/MDAxNTc4NDAxNzkwODk5.nL5SbiE7uZ9SypO0TKbFD5bp35rWdQiydXsxsgMtFCwg.rTJcErw5NpEY-2oH-fyg3MfjAb4ZBhCss-dq3TgxuhIg.JPEG.jsj1215/%EC%8A%AC%EB%9D%BC%EC%9D%B4%EB%93%9C23.JPG?type=w1">
</tr>
  <tr><img src = "https://blogfiles.pstatic.net/MjAyMDAxMDdfMjUw/MDAxNTc4NDAxNzkxMjEw.CGqhs5BembapRS8P4NUpTfp_a-EBCFFhw0h_IF1RZNMg.xasumpBMSSiH8v5zuFYp6lh6hGYZBToHUlpXa5XMvEcg.JPEG.jsj1215/%EC%8A%AC%EB%9D%BC%EC%9D%B4%EB%93%9C24.JPG?type=w1">
</tr>
  <tr><img src = "https://blogfiles.pstatic.net/MjAyMDAxMDdfMjYx/MDAxNTc4NDAxNzkxNTIz.OBiCG3V4QjozKW9N51UyycRo7uaDGBtpHBDuQDjut8Ig.DEsPKE-vHdueimDT-qVa19JJYtVnwcny--2qRqyk2J0g.JPEG.jsj1215/%EC%8A%AC%EB%9D%BC%EC%9D%B4%EB%93%9C25.JPG?type=w1">
</tr>
  <tr><img src = "https://blogfiles.pstatic.net/MjAyMDAxMDdfNDMg/MDAxNTc4NDAxNzkxODYy.B-lAfvNujonuaD-QeZgkDJKAk40MeRqz91xVORJusKsg.q75Mn--aBKfK1xRhKCvD76xgcEd-_RNlxFyZmy7a2NQg.JPEG.jsj1215/%EC%8A%AC%EB%9D%BC%EC%9D%B4%EB%93%9C26.JPG?type=w1">
</tr>
  <tr><img src = "https://blogfiles.pstatic.net/MjAyMDAxMDdfMjEy/MDAxNTc4NDAxNzkyMTUy.kuyuBhludy7k69UmBtZq0lmS3CDGavhMm6xBXcCX4rAg.PM2V2NL8DT9lJ3I-v3PrfkYNG0rVIeEEXeArlKYlagAg.JPEG.jsj1215/%EC%8A%AC%EB%9D%BC%EC%9D%B4%EB%93%9C27.JPG?type=w1">
</tr>
  <tr><img src = "https://blogfiles.pstatic.net/MjAyMDAxMDdfMTg5/MDAxNTc4NDAxNzkyNDE5.ywGUPa1VctVl9GiT_iAh2JOl04-0IIq3iSGw7GrK4tkg.8NfuMohDSu2tI6OKqctQMrLFHhRdYu0B2XSXB2V0ClEg.JPEG.jsj1215/%EC%8A%AC%EB%9D%BC%EC%9D%B4%EB%93%9C28.JPG?type=w1">
</tr>
  <tr><img src = "https://blogfiles.pstatic.net/MjAyMDAxMDdfMjA4/MDAxNTc4NDAxNzkyNzAw.aIR3-JG4RcXfyETej-8bgiG50bFbVH5OalEMtnfJ3gsg.wC_sfR5C8KCv4eUzlIu289KDeYXrY3ORDGOxmTKzzpAg.JPEG.jsj1215/%EC%8A%AC%EB%9D%BC%EC%9D%B4%EB%93%9C29.JPG?type=w1">
</tr>
  <tr><img src = "https://blogfiles.pstatic.net/MjAyMDAxMDdfMTQ1/MDAxNTc4NDAxNzkzMDE5.ceh38whpxUXDsiPjEnH0LT9Jh4kVzYNQWY0e3Ef-5qsg.RwtDUclVx2RhYGvgnxGAtIp-FKpXWi9hcsch1GjLjaUg.JPEG.jsj1215/%EC%8A%AC%EB%9D%BC%EC%9D%B4%EB%93%9C30.JPG?type=w1">
</tr>
  <tr><img src = "https://blogfiles.pstatic.net/MjAyMDAxMDdfMTMx/MDAxNTc4NDAxNzkzNDA2.NEOg4ZWZO8ygdtn2wFNQtjw9-pKTQXrChQNr5F0HF60g.87L2EGAVkejQT_qX8_jaGi2qUThnJf_Bjn-KL5l8k6wg.JPEG.jsj1215/%EC%8A%AC%EB%9D%BC%EC%9D%B4%EB%93%9C31.JPG?type=w1">
</tr>
  <tr><img src = "https://blogfiles.pstatic.net/MjAyMDAxMDdfMTEz/MDAxNTc4NDAxNzkzNzM0._j6aqxhgyEpQGAL_gsav7A9FPdZYJ7jvr_dMbQjSx7Mg.DIM-ra_8uYJg8WJ9r-Z3wGHKLcKrtN1vvTs27Y8RzWAg.JPEG.jsj1215/%EC%8A%AC%EB%9D%BC%EC%9D%B4%EB%93%9C32.JPG?type=w1">
</tr>
  <tr><img src = "https://blogfiles.pstatic.net/MjAyMDAxMDdfOTQg/MDAxNTc4NDAxNzk0MDU0.7o38YwZqAfIg9KsXyjXgX4B6m_qz5z0ECbpfgoQUhvUg.rqqi01teOIeuJua30nKjNcl6ftBPvL7efYzWIi_YaMwg.JPEG.jsj1215/%EC%8A%AC%EB%9D%BC%EC%9D%B4%EB%93%9C33.JPG?type=w1">
</tr>
  <tr><img src = "https://blogfiles.pstatic.net/MjAyMDAxMDdfMTkg/MDAxNTc4NDAxNzk0NDIz.zRDCLQF6abK-mBM3nOtr5GKpEJuZ7I7VUaZbwXhxXQUg.MFn_yWCzrm7ZaYf7lAjtqo9NV-ma-bW7tTs5KXed8-Ug.JPEG.jsj1215/%EC%8A%AC%EB%9D%BC%EC%9D%B4%EB%93%9C34.JPG?type=w1">
</tr>
  <tr><img src = "https://blogfiles.pstatic.net/MjAyMDAxMDdfOSAg/MDAxNTc4NDAxNzk0NzU1.TIm6MEOqXMD4BZSMF5wfRUnzCbfQ1n2-HwCsA0MVexAg.6vD8xIOcStF0Qe722xmoAraPmJTZ3DouQ9jNHo0k4rcg.JPEG.jsj1215/%EC%8A%AC%EB%9D%BC%EC%9D%B4%EB%93%9C35.JPG?type=w1">
</tr>
  <tr><img src = "https://blogfiles.pstatic.net/MjAyMDAxMDdfMTk0/MDAxNTc4NDAxNzk1MTM5.T56uNHcfwZ6q_q8ypK_YmkRAHSTwoPnt1QLik87coEwg.5TW0usrbt84Mlp40wveX0ABjUlY0H-xJjKb2kCfQPOIg.JPEG.jsj1215/%EC%8A%AC%EB%9D%BC%EC%9D%B4%EB%93%9C36.JPG?type=w1">
</tr>
  <tr><img src = "https://blogfiles.pstatic.net/MjAyMDAxMDdfMjEy/MDAxNTc4NDAxNzk1NDcz.n2PJjBQgloaG9zWF-8kE8GgflMQ-xuL5mrfNRXn19P0g.2IyTT0z-YW_jpgTjEnNsUlFIvkgi2RKvYwgrYoSVgswg.JPEG.jsj1215/%EC%8A%AC%EB%9D%BC%EC%9D%B4%EB%93%9C37.JPG?type=w1">
</tr>
  <tr><img src = "https://blogfiles.pstatic.net/MjAyMDAxMDdfMTk4/MDAxNTc4NDAxNzk1Nzg0.R65IMUgMdkOfX-5GsPVjddSB3c5_O24aQazgwZfhgeAg.BotSLCl9gNgvkaMHJ_PpqUp1tv-VxAsMIhWHNotPk5Ug.JPEG.jsj1215/%EC%8A%AC%EB%9D%BC%EC%9D%B4%EB%93%9C38.JPG?type=w1">
</tr>
  <tr><img src = "https://blogfiles.pstatic.net/MjAyMDAxMDdfMjc4/MDAxNTc4NDAxNzk2MDg4.Aifot7JwxHt-8xkqeLrnYmxm2xfhn5RnCpvDEf0B7PEg.iizL_ijUZJN_6AlBy6vPFcReqTVAsC_s9H3b5v6ApYkg.JPEG.jsj1215/%EC%8A%AC%EB%9D%BC%EC%9D%B4%EB%93%9C39.JPG?type=w1">
</tr>
  <tr><img src = "https://blogfiles.pstatic.net/MjAyMDAxMDdfMTE1/MDAxNTc4NDAxNzk2NDEz.AYYIYX06IZ0gBsDS-a8rpXHSHn11oKGPgT1jbpBDI6Ag.gWpxoK7yjFefM8LZusDCPy2eA8xNG6v9lZ96INTDhesg.JPEG.jsj1215/%EC%8A%AC%EB%9D%BC%EC%9D%B4%EB%93%9C40.JPG?type=w1">
</tr>
  <tr><img src = "https://blogfiles.pstatic.net/MjAyMDAxMDdfMjEy/MDAxNTc4NDAxNzk2NzM3.Xv5UpAWphssxWmGSpSaTKeJMlb3FOCldoDmAmhc63zUg.66afGP0Zh2OcKXUBx6ZufldiWAJnCzYlxcQC8vxgbrYg.JPEG.jsj1215/%EC%8A%AC%EB%9D%BC%EC%9D%B4%EB%93%9C41.JPG?type=w1">
</tr>
  <tr><img src = "https://blogfiles.pstatic.net/MjAyMDAxMDdfMjYw/MDAxNTc4NDAxNzk3MDEx.epMGUArzI2OOj0s8p7Crwxti2wAjiS2v5KIzCoUpKw0g.i2PU_199vLYZNfUF5BUU9sHhCf-Inll2Q-_uBNNrpnog.JPEG.jsj1215/%EC%8A%AC%EB%9D%BC%EC%9D%B4%EB%93%9C42.JPG?type=w1">
</tr>
  <tr><img src = "https://blogfiles.pstatic.net/MjAyMDAxMDdfNTEg/MDAxNTc4NDAxNzk3MzM2.6ur_uOQIjmKFl7KfFl_X_Kf63vByp8g6jrsj0jVAM8gg.b7ZQFOKfy5ttAwpMt-pHObh6z4up3lVCZD-J1jFCpaUg.JPEG.jsj1215/%EC%8A%AC%EB%9D%BC%EC%9D%B4%EB%93%9C43.JPG?type=w1">
</tr>
  <tr><img src = "https://blogfiles.pstatic.net/MjAyMDAxMDdfMjkw/MDAxNTc4NDAxNzk3NjUz.UKg69MGdaHDgkNL7jHSRM_b7ljEmj_yYUlbnS74-ux0g.ovA1ohHRmGnndydURj5YIz7bxmZrC7q-G6MYkpqjVeIg.JPEG.jsj1215/%EC%8A%AC%EB%9D%BC%EC%9D%B4%EB%93%9C44.JPG?type=w1">
</tr>
  <tr><img src = "https://blogfiles.pstatic.net/MjAyMDAxMDdfMjc5/MDAxNTc4NDAxNzk3OTg0.opfAv_6JKqR7vjd4vI-xg9N03WuJRxTZGuzIGPxRMwcg.NSJOch936060wP51LPxFlXM_vfenO14gItSAdANJhxIg.JPEG.jsj1215/%EC%8A%AC%EB%9D%BC%EC%9D%B4%EB%93%9C45.JPG?type=w1">
</tr>
  <tr><img src = "https://blogfiles.pstatic.net/MjAyMDAxMDdfNjcg/MDAxNTc4NDAxNzk4MzM3.Mtm_mxgXjg9qDzoHe1F9-smULB4PdMItI0MvDSBdZzQg.Vea6vtFfEEKr3GeXPHoFSBxe6sSWvvVGgt7snrD2H9sg.JPEG.jsj1215/%EC%8A%AC%EB%9D%BC%EC%9D%B4%EB%93%9C46.JPG?type=w1">
</tr>
  <tr><img src = "https://blogfiles.pstatic.net/MjAyMDAxMDdfMjMz/MDAxNTc4NDAxNzk5NjYz.ImvB8qsG-pw3F4e0OmAQpPd_7xZtDEnnIb-6c77iTA8g.LTdv6UlxNXMKoC-f7TDNxvIsUeCeRGqF4aBynXRKQeog.JPEG.jsj1215/%EC%8A%AC%EB%9D%BC%EC%9D%B4%EB%93%9C47.JPG?type=w1">
</tr>
  <tr><img src = "https://blogfiles.pstatic.net/MjAyMDAxMDdfMTA1/MDAxNTc4NDAxODAwMDIy.nOqfZxo9ZvACHNXnea9gn7JP2f5AsRDRfq9mMLvZsDwg.FUc5g9Eo-0XxMWsMMmIsruYd7p6MPksV90UQbI97VlIg.JPEG.jsj1215/%EC%8A%AC%EB%9D%BC%EC%9D%B4%EB%93%9C48.JPG?type=w1">
</tr>
  <tr><img src = "https://blogfiles.pstatic.net/MjAyMDAxMDdfMTgy/MDAxNTc4NDAxODAwMzAx.M2VvbYRj9KG6UpDhAqgQ2AqVm4uiqujhG3scWXa2BSMg.eWHRRNYx810ggt64QmSpyIFKNRaakCgdvLeQvpUwYt8g.JPEG.jsj1215/%EC%8A%AC%EB%9D%BC%EC%9D%B4%EB%93%9C49.JPG?type=w1">
</tr>
  <tr><img src = "https://blogfiles.pstatic.net/MjAyMDAxMDdfMjQ0/MDAxNTc4NDAxODUwNjY3.TkADTjbAkXJrrF-SFnO77MaD0Pl7iKXQW78AEv9moHUg.ZYeetOHqoeXHHlmxxHdeC56nFgZdLYOuoiqH9xXvyIMg.JPEG.jsj1215/%EC%8A%AC%EB%9D%BC%EC%9D%B4%EB%93%9C50.JPG?type=w1">
</tr>
  <tr><img src = "https://blogfiles.pstatic.net/MjAyMDAxMDdfMTM0/MDAxNTc4NDAxODUxMDIx.zBJwr7u-aKWMaHheaCAyQJfXizsaEWUcxYTnTD_ePMog.uzsdGICDDDcc7LjFU4Mowj7VS1n4p7gV177pRDpSLZkg.JPEG.jsj1215/%EC%8A%AC%EB%9D%BC%EC%9D%B4%EB%93%9C51.JPG?type=w1">
</tr>
</table>

