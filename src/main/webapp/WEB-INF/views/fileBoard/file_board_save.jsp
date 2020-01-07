<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="resources/jquery-3.2.1.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<script type="text/javascript">

	$(document).ready(function() {
		$('#ta').on('keyup', function() {
	        if($(this).val().length > 1300) {
	        	alert('최대길이 제한을 벗어났습니다.');
	            $(this).val($(this).val().substring(0, 1300));
	        }
		});
	});
 
    // 파일 리스트 번호
    var fileIndex = 0;
    // 등록할 전체 파일 사이즈
    var totalFileSize = 0;
    // 파일 리스트
    var fileList = new Array();
    // 파일 사이즈 리스트
    var fileSizeList = new Array();
    // 등록 가능한 파일 사이즈 MB
    var uploadSize = 10;
    // 등록 가능한 총 파일 사이즈 MB
    var maxUploadSize = 50;
    // 파일 갯수 체크
    var fileCount = 0;
 
    $(function (){
        // 파일 드롭 다운
        fileDropDown();
    });
 
    // 파일 드롭 다운
    function fileDropDown(){
        var dropZone = $("#dropZone");
        //Drag기능 
        dropZone.on('dragenter',function(e){
            e.stopPropagation();
            e.preventDefault();
            // 드롭다운 영역 css
            dropZone.css('background-color','#E3F2FC');
        });
        dropZone.on('dragleave',function(e){
            e.stopPropagation();
            e.preventDefault();
            // 드롭다운 영역 css
            dropZone.css('background-color','#FFFFFF');
        });
        dropZone.on('dragover',function(e){
            e.stopPropagation();
            e.preventDefault();
            // 드롭다운 영역 css
            dropZone.css('background-color','#E3F2FC');
        });
        dropZone.on('drop',function(e){
            e.preventDefault();
            // 드롭다운 영역 css
            dropZone.css('background-color','#FFFFFF');
            
            var files = e.originalEvent.dataTransfer.files;
            if(files != null){
                if(files.length < 1){
                    alert("폴더 업로드 불가");
                    return;
                }
                selectFile(files)
            }else{
                alert("ERROR");
            }
        });
    }
 
    // 파일 선택시
    function selectFile(files){
        // 다중파일 등록
        if(files != null){
            for(var i = 0; i < files.length; i++){
            	fileCount++;
                // 파일 이름
                var fileName = files[i].name;
                var fileNameArr = fileName.split("\.");
                // 확장자
                var ext = fileNameArr[fileNameArr.length - 1];
                // 파일 사이즈(단위 :MB)
                var fileSize = files[i].size / 1024 / 1024;
                
                if($.inArray(ext, ['exe', 'bat', 'sh', 'java', 'jsp', 'html', 'js', 'css', 'xml']) >= 0){
                    // 확장자 체크
                    alert("등록 불가 확장자 입니다");
                    break;
                }else if(fileSize > uploadSize){
                    // 파일 사이즈 체크
                    alert("용량 초과\n업로드 가능 용량 : " + uploadSize + " MB");
                    break;
                }else if(fileCount > 5){
                	// 파일 갯수 체크
                	alert("최대 등록 파일 갯수는 5개 까지 입니다");
                	fileCount = fileCount-1;
                	break;
                }else{
                    // 전체 파일 사이즈
                    totalFileSize = totalFileSize + fileSize;
                    
                    // 파일 배열에 넣기
                    fileList[fileIndex] = files[i];
                    
                    // 파일 사이즈 배열에 넣기
                    fileSizeList[fileIndex] = fileSize;
 
                    // 업로드 파일 목록 생성
                    addFileList(fileIndex, fileName, fileSize.toFixed(4));
 
                    // 파일 번호 증가
                    fileIndex++;
                    
                }
            }
        }else{
            alert("ERROR");
        }
    }
 
    // 업로드 파일 목록 생성
    function addFileList(fIndex, fileName, fileSize){
        var html = "";
        html += "<tr id='fileTr_" + fIndex + "' name='fileTr_" + fIndex + "'>";
        html += "    <td colspan='2' >";
        html +=         fileName + " / " + fileSize + "MB "  + "<a href='#' onclick='deleteFile(" + fIndex + "); return false;' class='btn small bg_02'>삭제</a>"
        html += "    </td>"
        html += "</tr>"
 
        $('#fileTableTbody').append(html);
    }
 
    // 업로드 파일 삭제
    function deleteFile(fIndex){
        // 전체 파일 사이즈 수정
        totalFileSize = totalFileSize - fileSizeList[fIndex];
        
        // 파일 배열에서 삭제
        delete fileList[fIndex];
        
        // 파일 사이즈 배열 삭제
        delete fileSizeList[fIndex];
        
        fileCount = fileCount -1;
        
        // 업로드 파일 테이블 목록에서 삭제
        $("#fileTr_" + fIndex).remove();
    }
 
    // 파일 등록
    function uploadFile(){
        // 등록할 파일 리스트
        var uploadFileList = Object.keys(fileList);
 
        // 파일이 있는지 체크
/*         if(uploadFileList.length == 0){
            // 파일등록 경고창
            alert("파일이 없습니다.");
            return;
        } */
        if($("#title").val() == ""){
    		alert("제목을 입력해 주세요");
    		document.getElementById("title").focus();
    		return;
    	}else if($("#ta").val() == ""){
    		alert("내용을 입력해 주세요");
    		document.getElementById("ta").focus();
    		return;
    	}
    	
        // 용량을 50MB를 넘을 경우 업로드 불가
        if(totalFileSize > maxUploadSize){
            // 파일 사이즈 초과 경고창
            alert("총 용량 초과\n총 업로드 가능 용량 : " + maxUploadSize + " MB");
            return;
        }
            
        if(confirm("등록 하시겠습니까?")){
        	
            // 등록할 파일 리스트를 formData로 데이터 입력
            //var form = $('#fileupload');
            var form = document.getElementById('fileUpload');
            var formData = new FormData(form);
            //var formData = new FormData();
            //FormData:해당 폼의 모든 값들(file포함)을 해당 객체에 한번에 담아 보내기 위해 사용된다. 
            
            for(var i = 0; i < uploadFileList.length; i++){
                formData.append('files', fileList[uploadFileList[i]]);
            }
            
            $.ajax({
                url:"fileUpload",
                data:formData,
                type:'POST',
                enctype:'multipart/form-data',
                processData:false, 		// file전송시 필수
                // 데이터 객체를 문자열로 바꿀지에 대한 값이다. true면 일반문자..
               // -. 기본 값은 true이다.
               // -. 해당 값이 true일때는 data 값들이 쿼리스트링 형태인 key1=value1&key2=value2 형태로 전달된다.
               // -. 하지만 이렇게 하면 file 값들은 제대로 전달되지 못한다.
               // -. 그래서 해당 값을 false로 해주어 
               //	{ key1 : 'value1', key2 : 'value2' } 형태로 전달해 주어야 file 값들이 제대로 전달된다.
                
                contentType:false,		// file전송시 필수
                // 해당 타입을 true로 하면 일반 text로 구분되어 진다.
                // -. 기본값은 'application/x-www-form-urlencoded'이다. 
                //해당 기본 타입으로는 파일이 전송 안되기 때문에 false로 해주어야 한다.
                dataType:'json',
                cache:false,
                success:function(result){
                	 if(result.result == 1){
                         alert("글쓰기 성공");
                         location.href='fileBoardList';
                    }else{
                        alert("글쓰기 실패");
                        location.reload();
                    }
                }
            });
                    	location.href='fileBoardList';
                       
        } 
    }
   
</script>


</head>
<body>
	<jsp:include page="../default/header.jsp" />
	<div align="center" class="container"
		style="border-style: groove; background-color: rgba(255, 255, 255, 0.95);">
		<div class="row">
			<div class="col-sm-12 table-responsive box">
				<form id="fileUpload" enctype="multipart/form-data"
					name="fileUpload" method="post">
					<div style="width: 2%; float: left;">&nbsp;</div>
					<div style="width: 48%; float: left; text-align: left;">
						&nbsp;<b>${sessionScope.sid }</b> | <b>자료실</b>
					</div>
					<div style="width: 48%; float: left; text-align: right;">
						<input type="button" value="저장"
							onclick="uploadFile(); return false;">&nbsp;<input
							type="button" value="목록" onclick="location.href='fileBoardList'">
					</div>
					&nbsp;<br>&nbsp;
					<table class="table table-bordered">
						<tr>
							<th style="width: 15%;">&nbsp;&nbsp;&nbsp;제목</th>
							<td><input type="hidden" name="name"
								value="${sessionScope.sid}"><input style="width: 100%"
								type="text" name="title" maxlength="20" placeholder="최대 20자"
								id="title"></td>
						</tr>
						<tr>
							<td colspan="2"><textarea style="width: 100%" rows="20"
									cols="22" name="content" id="ta" placeholder="최대 300자"></textarea></td>
						</tr>
						<tbody id="fileTableTbody">
							<tr>
								<th style="text-align: center" colspan="2">첨부파일</th>
							</tr>
							<tr>
								<td id="dropZone" height="70px" colspan="2" align="center">
									파일을 드래그 하세요 (최대 5개)<img src="resources/img/fileaddicon.jpg"
									width="50px" height="50px">
								</td>
							</tr>

						</tbody>
					</table>
				</form>
			</div>
			<br>
		</div>
	</div>
	<br>
	<jsp:include page="../default/footer.jsp" />
</body>
</html>