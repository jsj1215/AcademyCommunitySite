<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
tr {
	height: 200px;
}

td {
	width: 200px;
	height: 100%;
	text-align: center;
	border-collapse: separate;
}

img {
	width: 100%;
	height: 100%;
	padding: 10px;
}
</style>
<jsp:include page="../default/header.jsp" />
<!-- ■ ajax사용시 아래 코드 필요! -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- ■ 게시판 데이터 호출 및 출력부 -->
<script>
	//enter키 막기
	function enter(e){
		if(e.keyCode == 13){
			return false;
		}
	}

	//==========================================================
	//■ 전역변수
	//==========================================================
	//1. paging처리에 필요한 전역변수
 	var totalRecode = 0; 	//Server에서 가져온 Data의 총 개수
	var currentPage = 1; 	//현재 보고 있는 Page번호
	var pageSize = 10; 		//한 Page에 보여질 Data의 개수
	var totalPage = 0; 		//총 데이터를 한 페이지에 보여질 데이터 개수로 나누어 나온 총 페이지 개수
	var blockSize = 3; 		//페이지를 한 화면에 몇 개씩 보여줄 건지 나타내는 변수
	var firstPage = 0;		//현재 블럭에서 제일 첫번째 Page번호
	var lastPage = 0; 		//현재 블럭에서 제일 마지막 Page번호
	var curPos = 0; 		//Server에서 받은 데이터리스트에서 현재 Page번째에서 보여줘야 할 데이터 시작점의 index
	var num = 0; 			//현재 Page에서 보여지는 데이터의 시작번째 수를 나타냄
	var fileList = null; 	//Server에서 가져온 데이터를 전역 영역으로 끌어 올리기 위해 선언한 전역변수(다른 메소드들 도 볼 수 있게)
	//2. 제목길이 설정에 필요한 전역변수
	var title = "";			//제목이 15글자 이상 넘어가면 ...으로 보여주기 위해 사용한 변수
	
	//==========================================================
	//■ 페이지 로드될때 실행됨!
	//==========================================================
	$(function(){ // window.addEventListener("load", function(){});
		
		$("input[name='bt_search']").click(function(){				//id,title,content검색 버튼이 눌러졌을때만 보여줘라
			getSearchList();
		})
		getFileList();		//fileList가져오는 메소드
	});
	
	//==========================================================
	// ■ fileList 가져오기
	//==========================================================
	function getFileList() {
		$.ajax({
			url : "/controller/all",				//controller의 all value값이랑 연결하겠다.
			type : "get",							//전송방식은 get방식이다.
			success : function(result) {			//성공적으로 수행한다면 아래 함수를 실행해라.
				var json = JSON.parse(result);		//서버로 부터 받은 데이터를 String JSON으로 형변환
				fileList = json.ImageBoardDTO;		//JSON에 담긴 데이터를 꺼낸다.
				var count = fileList.length;		//총 데이터 개수를 구한다.
				var noimage = "게시물을 등록해주세요.";
				
				//======================================================
				//■ 페이징 되는 부분이 눌러졌을때 수행하는 함수
				//======================================================
				pagination(count, currentPage); 
				//======================================================

				$("table > tbody").empty();			//table을 한 번 비워준다.
				//데이터가 없을 때 
				if(count == 0){
					$($("table").find("tbody")).append("<tr><td colspan=\"2\" align=\"center\"><b>"+noimage+"</b></td></tr>");
				}
				
				for(var i=0; i<pageSize; i++){		//위에서 정한 pageSize까지 반복문을 돌면서 데이터 출력(한 페이지에는 pageSize숫자만큼의 데이터가 보여야 하므로)
					if(num <1){						//pageNumber마다 보여지는 게시물의 수가 1보다 작으면
						break;						//데이터 출력을 멈춘다.
					}
					var file = fileList[curPos++];	//현재 페이지에서 보여주어야 할 데이터를 서버에서 가져와 저장한 데이터의 리스트에서 꺼낸다.
					
					//파일 제목이 15자 이상 넘어가면 ...으로 보여주기 위함
					if(file.title.length > 15) {
						title = file.title.substring(0, 15)+"...";
					} else {
						title = file.title;
					}
					
					if(i%5==0){																		//5개단위로 
						$($("table").find("tbody")).append("<tr><td align=\"center\"></td></tr>");	//테이블 줄 변경
					}
					//나머지 데이터들 td를 통해 보여줌(이미지,title,작성날짜에 대한 정보)
					$($("table").find("tbody")).append("<div style=\"width:20%; float:left; text-align:center;\"><div style=\"height:140px;\"><a href=\"/controller/ImageBoard_view?num="+file.num+"\"><img style=\"height:100%;\" src=\"/img/"+file.stored_file_name+"\"/></a></div><div style=\"height:30%;\"><br><a href=\"/controller/ImageBoard_view?num="+file.num+"\"><b>"+title+"</b></a><br>"+file.savedate+"<br>좋아요 : "+file.likes+"</div></div>");
					
					}
			}  
		});
	}
	
	//==========================================================
	// ■ 페이징 되는 부분이 눌러졌을때 수행하는 함수
	//==========================================================
	function pagination(count, currentPage) {
		
		totalRecode = count;								//● 총 데이터 개수
		currentPage = currentPage;							//● 현재 페이지
		pageSize = 10;										//● 한 페이지 당 보여질 레코드 수 (ex.한 화면에 10개의 데이터를 보여주겠다.)
		
		//● 총 페이지수 = 총 게시글 수 / 페이지 뜨는 숫자가 몇개까지 뜰 수 있는지 알 수 있음
		totalPage = Math.ceil(totalRecode / pageSize);		//토탈 게시글 수가 51이라고 가정하면 ,51 나누기 10은 4xx Math함수를 이용하여 인수형 5로 변환한다. 따라서 [1]부터[5] 
	
		//● 하나의 block당 보여질 페이지 개수													
		blockSize = 3;										//(ex.하단 블럭 지정 [1][2][3]....[10])
		
		//● 화면에 보여질 첫번째 페이지 수(block당 시작 페이지)
		firstPage = currentPage - (currentPage - 1) % blockSize;//(ex.1~10까지는 시작페이지 [1], 11~20까지는 시작페이지[11])
		//● 화면에 보여질 마지막 페이지 수(block당 마지막 페이지) (ex.[10][20][30]...변하므로 시작페이지에 9를 더해준다.)
		lastPage = firstPage + (blockSize - 1);		
		
		//● 커서 포지션:각 페이지 별 커서 처음 시작 위치
		curPos = (currentPage - 1) * pageSize;
		//ex.하단[1][2][3]버튼을 누르면 레코드의 보여주는 값이 변해야한다. 즉 페이지마다 보여주는 데이터들이 다르다. / [1]은 게시글1~10까지, [2]은 게시글 11~20까지
		//currentPage가 1씩 증가할때마다 1,11,21,31....10씩 증가
		
		//● 페이지당 개시물 수(쿼리 날릴때 몇 페이지부터 몇페이지까지에 쓰는 용도.)
		num = totalRecode - curPos;							//(ex.전체 데이터가 4라고 가정할때 currentPage1이고 curPos 5가 된다.
															//그럼 num이 -1부터 시작하게 되므로 curPos수식에 (currentPage-1)을 해준다.)
		
															
		var next = lastPage + 1;							//next값을 클릭하면, lastPage에서 1더한 값(즉, 다음페이지로 이동)
		var prev = firstPage - 1;							//prev값을 클릭하면, FirstPage에서 1뺀 값(즉, 이전페이지로 이동)		

		var $pagingView = $("pageNumber");					//아래 보여지는 view단의 div에 id값을 주었다.(해당하는 div에 paging이 보일 것이다.) 
		
		var html = "";										//html변수 초기화
		//▶▶▶▶▶이전▶▶▶▶▶
		if (prev > 0) {										//만약 맨 첫 페이지라면 이전으로 이동 하는 것이 의미가 없으므로, prev가 0보다 클때로 조건을 준다.
			html += "<a href=# id='prev'>[이전]</a> ";		//html a태그 보여줌.
		}else{
			//html += "[이전]&nbsp;&nbsp;";
		}
		//▶▶▶▶▶페이지숫자▶▶▶▶▶
		for (var i = firstPage; i <= lastPage; i++) {		//화면에 보여줄 페이지 숫자들 반복문을 돌면서 보여줌.
			if (i > totalPage) {							//반복문이 totalPage보다 커지면,
				break;										//실행종료.
			}
			html += "<a href='#' id="+i+">" + i + "</a> ";	//html a태그 보여줌.
		}
		//▶▶▶▶▶이후▶▶▶▶▶
		if (lastPage < totalPage) {							//만약 마지막 페이지라면 다음으로 이동 하는 것이 의미가 없으므로, 마지막페이지가 전체페이지보다 작을때만 작동하도록 조건을 준다.
			html += "<a href=# id='next'>[다음]</a>";			//html a태그 보여줌.
		}else{
			//html += "&nbsp;&nbsp;[다음]";
		}
		$("#pageNumber").html(html); 						//페이지 목록 생성(위에서 작성한 html내용들 보여줌.)
		$("#pageNumber a").css("color", "black");			//pageNumber의 a태그들에 css스타일을 적용하겠다.
		$("#pageNumber a#" + currentPage).css({				//현재 페이지 표시 효과(현재페이지는 색상을 주어 별도로 표시)
			"text-decoration" : "none",
			"color" : "red",
			"font-weight" : "bold"
		}); 
		
		//===================================================================
		//■ 사용자가 페이지번호를 누를때마다 동작! a태그가 눌리면 화면갱신!
		//===================================================================
		$("#pageNumber a").click(function() {				//페이지 변경을 위해 pagination 함수를 클릭 했다면,
			
			var $item = $(this);							//눌린DOM객체를 item변수에 담는다.
			var $id = $item.attr("id");						//item변수에 담긴 DOM객체의 지정된 id속성을 가져와 id변수에 담는다.
			var selectedPage = $item.text();				//item변수에 담긴 DOM객체의 text를 가져와 변수 selectedPage에 담는다.(text는 페이지 번호)
			
			//클릭한 pagination의 id값이 next이면
			if ($id == "next") {
				selectedPage = next;						//선택한 Page값을 현재 마지막 페이지 번호에 1을 더한 것으로 지정
			}
			//클릭한 pagination의 id값이 prev라면
			if ($id == "prev") {
				selectedPage = prev;						//선택한 Page값을 현재의 첫번째 페이지 번호에 1을 뺀것으로 지정
			}
			
			//======================================================
			//■ 페이징 되는 부분이 눌러졌을때 수행하는 함수
			//======================================================
			pagination(totalRecode, selectedPage);
			//======================================================
			var noimage = "등록된 이미지가 없습니다.";	
			$("table>tbody").empty();						//table한 번 비우고
			//데이터가 없을 때
			if(count == 0){
				$($("table").find("tbody")).append("<tr><td colspan=\"2\" align=\"center\"><b>"+noimage+"</b></td></tr>");
			}
			
			//pageSize만큼 반복하여 데이터 출력
			for (var i = 0; i < pageSize; i++) {			
				if (num < 1) {
					break;
				}
				var file = fileList[curPos++];
				
				//파일 제목이 15자 이상 넘어가면 ...으로 보여주기 위함
				if(file.title.length > 15) {
					title = file.title.substring(0, 15)+"...";
				} else {
					title = file.title;
				}
				
				if(i%5==0){																		//5개단위로 
					$($("table").find("tbody")).append("<tr><td align=\"center\"></td></tr>");	//테이블 줄 변경
				}
				//나머지 데이터들 td를 통해 보여줌(이미지,title,작성날짜에 대한 정보)
				$($("table").find("tbody")).append("<div style=\"width:20%; float:left; text-align:center;\"><div style=\"height:140px;\"><a href=\"/controller/ImageBoard_view?num="+file.num+"\"><img style=\"height:100%;\" src=\"/img/"+file.stored_file_name+"\"/></a></div><div style=\"height:30%;\"><br><a href=\"/controller/ImageBoard_view?num="+file.num+"\"><b>"+title+"</b></a><br>"+file.savedate+"<br>좋아요 : "+file.likes+"</div></div>");
			}
		});	
	} 
	
	
	//==========================================================
	// ■ 파일 검색 했을때 보여주는 곳
	//==========================================================
	function getSearchList(){
		var searchWord = $("input[name='searchWord']").val();
		var searchMode = $("select[name='searchMode']").val();
		$.ajax({
			url : "/controller/search",				//controller의 all value값이랑 연결하겠다.
			type : "get",							//전송방식은 get방식이다.
			data :{									//★★★★★★controller로 전달 할 내용들 이곳에 작성!
				"searchWord":searchWord,
				"searchMode":searchMode
			},
			success : function(result) {			//성공적으로 수행한다면 아래 함수를 실행해라.
				var json = JSON.parse(result);		//서버로 부터 받은 데이터를 String JSON으로 형변환
				fileList = json.ImageBoardDTO;		//JSON에 담긴 데이터를 꺼낸다.
				//alert(fileList.num);
				var count = fileList.length;		//총 데이터 개수를 구한다.
				$('#searchWord').val('');
				var noimage = "등록된 내용이 없습니다.";
				//■ 페이징 되는 부분이 눌러졌을때 수행하는 함수
				pagination(count, currentPage); 

				$("table > tbody").empty();			//table을 한 번 비워준다.
				//데이터가 없을때
				if(count == 0){
					$($("table").find("tbody")).append("<tr><td colspan=\"2\" align=\"center\"><b>"+noimage+"</b></td></tr>");
				}
				
				for(var i=0; i<pageSize; i++){		//위에서 정한 pageSize까지 반복문을 돌면서 데이터 출력(한 페이지에는 pageSize숫자만큼의 데이터가 보여야 하므로)
					if(num <1){						//pageNumber마다 보여지는 게시물의 수가 1보다 작으면
						break;						//데이터 출력을 멈춘다.
					}
					var file = fileList[curPos++];	//현재 페이지에서 보여주어야 할 데이터를 서버에서 가져와 저장한 데이터의 리스트에서 꺼낸다.
					
					//파일 제목이 15자 이상 넘어가면 ...으로 보여주기 위함
					if(file.title.length > 15) {
						title = file.title.substring(0, 15)+"...";
					} else {
						title = file.title;
					}
					if(i%5==0){																		//5개단위로 
						$($("table").find("tbody")).append("<tr><td align=\"center\"></td></tr>");	//테이블 줄 변경
					}
					//나머지 데이터들 td를 통해 보여줌(이미지,title,작성날짜에 대한 정보)
					$($("table").find("tbody")).append("<div style=\"width:20%; float:left; text-align:center;\"><div style=\"height:140px;\"><a href=\"/controller/ImageBoard_view?num="+file.num+"\"><img style=\"height:100%;\" src=\"/img/"+file.stored_file_name+"\"/></a></div><div style=\"height:30%;\"><br><a href=\"/controller/ImageBoard_view?num="+file.num+"\"><b>"+title+"</b></a><br>"+file.savedate+"<br>좋아요 : "+file.likes+"</div></div>");
				}
				
			}  
		});
	}
	
	/* 
	현재 문서에서 문서가 Load 되자마자 글전체목록을 불러오는 형태로 구축되어있으므로 버튼을 눌렀을때 Form Tag 를 이용해서 검색을 하면
	동기방식으로 진행하는것이어서 검색결과를 보기위해 본 Page 로 돌아오는 순간 다시 전체 검색을 진행하게됨...
	결론적으로 검색결과 볼 수 없게됨.. 검색을 아무리 해도 전체 게시물을 보는것...
	따라서 비동기 방식 (Page 에 머무르고 요청 결과만 기다림) 으로 검색 요청을 보내서 Page 새로고침이 일어나지 않게하며
	검색 결과 Data 를 JSON 으로 받아 화면에 표현해주는 방식으로 진행...
	
	function imageBoardSearch(){
		var searchWord = $("iput[name='searchWord']").val();
		var searchMode = $("input[name='searchMode']").val();
		if(searchWord == ""){
			alert("검색어를 입력해주세요.")
		}else{
			alert("검색 모드 : "+searchMode);
			alert("검색 단어 : "+searchWord);
			$("form[name='searchForm']").attr({
				action:"/imageBoard_search",
				type:"get"
			});
			$("form[name='searchForm']").submit();
		}
	}
	*/
	
</script>
</head>
<body>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<!-- ■ div3개는 전체적인 css 적용 -->
	<div align="center" class="container" style="border-style: groove; background-color: rgba(255, 255, 255, 0.95);">
		<div class="row">
			<div class="col-sm-12 table-responsive box">
			
				<div align="center">
					<form action="mainWrite" method="post">
						<h3 style="text-align: left;">&nbsp;&nbsp;&nbsp;갤러리</h3>
						<table style="width: 100%;">
							<tbody>
								<!--■ <script>부에서 작성한 ajax로 실제 데이터들이 보여지는 곳★ ★-->
							</tbody>
						</table>
						<br>
						<div style="background-color: rgba(211, 211, 211, 0.2);">&nbsp;</div>
						<div style="background-color: rgba(211, 211, 211, 0.2); width: 25%; height: 20px; float: left;">&nbsp;</div>
						<!-- ■ <script>부에서 작성한 ajax로 페이지 넘버가 보여지는 곳 -->
						<div id="pageNumber" align="center"
							style="background-color: rgba(211, 211, 211, 0.2); width: 50%; height: 20px; float: left;"></div>
						<div align="right"
							style="background-color: rgba(211, 211, 211, 0.2); width: 25%; height: 20px; float: left">
							<input type="submit" value="글 작성">&nbsp;&nbsp;&nbsp;
						</div>
						<br>
					</form>
				</div>
				<div style="background-color: rgba(211, 211, 211, 0.2); width: 100%;">
					<br>
					<!-- ========================================== -->
					<!-- ■ 아이디,제목,내용으로 검색 -->
					<!-- ========================================== -->
					<form name="searchForm" onkeydown="return enter(event)">
						<select name="searchMode">
							<option value="0" selected="selected">아이디</option>
							<option value="1">제목</option>
							<option value="2">내용</option>
						</select>&nbsp;&nbsp; 
						<input type="text" name="searchWord" id="searchWord" style="text-align: left; width: 400px;" placeholder="검색어 입력..." />&nbsp;
						<input type="button" name="bt_search" value="검색" />
					</form>
					<br>
				</div>
			</div>
		</div>
	</div>
	<br>
	<jsp:include page="../default/footer.jsp" />
</body>
</html>