package com.care.imageboard_controller;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.care.imageboard_dto.ImageBoardDTO;
import com.care.imageboard_service.ImageBoardService;

@Controller
public class ImageBoardController {

	@Autowired
	private ImageBoardService imageBoardService;

	@Autowired
	private SqlSession sqlSession;

	// ==============================================================================
	// ■ 메인 _ 전체 목록 조회
	// ==============================================================================
	@RequestMapping(value = "/all", method = RequestMethod.GET, produces = "application/text; charset=utf8") // produces : ajax사용시 한글깨짐 방지!!!!
	@ResponseBody // AJAX 사용하는데 필수!
	public String selectAllDTO() {
		List<ImageBoardDTO> dtoList = imageBoardService.selectAllDTO();
		StringBuilder sb = new StringBuilder();
		sb.append("{");
		sb.append("\"ImageBoardDTO\" : [");
		for (int i = 0; i < dtoList.size(); i++) {
			ImageBoardDTO dto = dtoList.get(i);
			sb.append("{");
			sb.append("\"num\":" + dto.getNum() + ",");
			sb.append("\"id\":\"" + dto.getId() + "\",");
			sb.append("\"title\":\"" + dto.getTitle() + "\",");
			//sb.append("\"content\":\"" + dto.getContent() + "\",");
			sb.append("\"savedate\":\"" + dto.getSavedate() + "\",");
			sb.append("\"hit\":\"" + dto.getHit() + "\",");
			sb.append("\"likes\":\"" + dto.getLikes() + "\",");
			sb.append("\"image_index\":\"" + dto.getImage_index() + "\",");
			sb.append("\"board_num\":\"" + dto.getBoard_num() + "\",");
			sb.append("\"original_file_name\":\"" + dto.getOriginal_file_name() + "\",");
			sb.append("\"stored_file_name\":\"" + dto.getStored_file_name() + "\"");
			if (i < dtoList.size() - 1) {
				sb.append("},");
			} else {
				sb.append("}");
			}
		} // 서버단에서 처리하는 Code 는 JAVA CODE Model 은 Java code 에서 Page 로 넘길떄 사용하는 방법
		sb.append("]");
		sb.append("}");

		return sb.toString();
	}

	// ==============================================================================
	// ■ 메인 _ 검색 (id,title,content)
	// ==============================================================================
	@RequestMapping(value = "/search", method = RequestMethod.GET, produces = "application/text; charset=utf8")
	@ResponseBody
	public String ImageBoard_search(String searchMode, String searchWord) {	// ★ 서버에 요청할때는 QueryString으로 넘겨줘야 함.

		String result_JSON = "";
		if (!searchWord.equals("")) {										// 만약 검색한 내용이 있다면(공백이 아니라면)
			List<ImageBoardDTO> searchList = imageBoardService.search(Integer.parseInt(searchMode), searchWord);

			StringBuilder sb = new StringBuilder();
			sb.append("{");
			sb.append("\"ImageBoardDTO\" : [");
			for (int i = 0; i < searchList.size(); i++) {
				ImageBoardDTO dto = searchList.get(i);
				sb.append("{");
				sb.append("\"num\":" + dto.getNum() + ",");
				sb.append("\"id\":\"" + dto.getId() + "\",");
				sb.append("\"title\":\"" + dto.getTitle() + "\",");
				sb.append("\"content\":\"" + dto.getContent() + "\",");
				sb.append("\"savedate\":\"" + dto.getSavedate() + "\",");
				sb.append("\"hit\":\"" + dto.getHit() + "\",");
				sb.append("\"likes\":\"" + dto.getLikes() + "\",");
				sb.append("\"image_index\":\"" + dto.getImage_index() + "\",");
				sb.append("\"board_num\":\"" + dto.getBoard_num() + "\",");
				sb.append("\"original_file_name\":\"" + dto.getOriginal_file_name() + "\",");
				sb.append("\"stored_file_name\":\"" + dto.getStored_file_name() + "\"");

				if (i < searchList.size() - 1) {
					sb.append("},");
				} else {
					sb.append("}");
				}
			}
			sb.append("]");
			sb.append("}");

			result_JSON = sb.toString(); // string형태로 보내라!
		} else { 						// 검색한 내용이 없다면 -> 전체 리스트를 띄워줘라
			result_JSON = selectAllDTO();
		}
		return result_JSON;
	}

	// ==============================================================================
	// ■ 댓글 등록
	// ==============================================================================
	@RequestMapping(value = "/reply", method = RequestMethod.GET, produces = "application/text; charset=utf8")
	@ResponseBody
	public String reply(ImageBoardDTO imageBoardDTO) {
		if (imageBoardDTO.getReply_content().equals("")) {
			return "{\"result\":0}";
		}
		imageBoardService.replyInsert(imageBoardDTO);
		return "{\"result\":1}";
	}

	// ==============================================================================
	// ■ 댓글 보여주기
	// ==============================================================================
	@RequestMapping(value = "/viewReply", method = RequestMethod.GET, produces = "application/text; charset=utf8")
	@ResponseBody
	public String viewReply(String reply_num) {
		List<ImageBoardDTO> viewReplyList = imageBoardService.viewReply(Integer.parseInt(reply_num));

		String result_JSON = "";
		StringBuilder sb = new StringBuilder();
		sb.append("{");
		sb.append("\"ImageBoardDTO\" : [");
		for (int i = 0; i < viewReplyList.size(); i++) {
			ImageBoardDTO dto = viewReplyList.get(i);
			sb.append("{");

			// =================================================
			// ★ 문자열 안에서 문자열을 표현하는 방법!!!!!!!!!!!!!!!!!
			// =================================================
			// String stance = "수진이가 말했다. \"안녕?\" 이라고..";
			// =================================================

			sb.append("\"id\":\"" + dto.getId() + "\","); // "reply_id":"dto내용", ->JSON의 Key,value형태
			sb.append("\"reply_id\":\"" + dto.getReply_id() + "\","); // "reply_id":"dto내용", ->JSON의 Key,value형태
			sb.append("\"reply_content\":\"" + dto.getReply_content() + "\",");
			sb.append("\"reply_num\":\"" + dto.getReply_num() + "\",");
			sb.append("\"step\":\"" + dto.getStep() + "\",");
			sb.append("\"indent\":\"" + dto.getIndent() + "\",");
			sb.append("\"chk\":\"" + dto.getChk() + "\",");
			sb.append("\"reply_date\":\"" + dto.getReply_date() + "\"");

			if (i < viewReplyList.size() - 1) {
				sb.append("},");
			} else {
				sb.append("}");
			}
		}
		sb.append("]");
		sb.append("}");

		result_JSON = sb.toString();
		return result_JSON;
	}

	// ==============================================================================
	// ■ 댓글 수정
	// ==============================================================================
	@RequestMapping(value = "/editReply", method = RequestMethod.POST)
	@ResponseBody
	public String editReply(ImageBoardDTO imageBoardDTO) {
		int result = imageBoardService.editReply(imageBoardDTO);
		if (result == 1) {
			return "{\"result\":1}";
		} else {
			return "{\"result\":0}";
		}
	}

	// ==============================================================================
	// ■ 댓글 삭제
	// ==============================================================================
	@RequestMapping(value = "/deleteReply", method = RequestMethod.GET, produces = "application/text; charset=utf8")
	@ResponseBody
	public String deleteReply(ImageBoardDTO imageBoardDTO) {
		int result = imageBoardService.deleteReply(imageBoardDTO);
		// 삭제 수행 결과 int값으로 반환 (1:성공, 0:실패)
		if (result == 1) {
			return "{\"result\":1}";
		} else {
			return "{\"result\":0}";
		}
	}

	// ==============================================================================
	// ■ main _ 띄워주기
	// ==============================================================================
	@RequestMapping("ImageBoard_main")
	public String ImageBoard_main(Model model) {
		// imageBoardService.mainViewImageTable(model);
		return "ImageBoard/ImageBoard_main";
	}

	// ImageBoard_main에서 글쓰기버튼 눌렀을 때 로그인되어있는지 확인
	@RequestMapping("mainWrite")
	public String mainWrite(Model model) {

		// 실행결과를 int형의 retrun값으로 받아서 성공했으면 view를 보여주고 실패했으면 main보여주자!
		return "ImageBoard/ImageBoard_write";
	}
	// ==============================================================================
	// ■ 글, 그림 저장
	// ==============================================================================

	// ImageBoard_write에서 내용 입력 후, 글쓰기 버튼 눌러 DB에 저장
	// 이미지 파일(첨부파일)을 DB에 저장
	// @RequestMapping(value = "saveData", method=RequestMethod.POST)
	@RequestMapping(value = "saveData")
	public String write(Model model, MultipartHttpServletRequest request) throws Exception {
		model.addAttribute("request", request);
		String content = request.getParameter("content");
		imageBoardService.saveData(model);
	
		return "ImageBoard/ImageBoard_write_yes";
	}

	// ==============================================================================
	// ■ 글, 그림 조회
	// ==============================================================================
	// 1. 메인에서 title클릭시 해당하는 num의 상세 내용 보여주기
	@RequestMapping("ImageBoard_view")
	public String imageList(Model model, HttpServletRequest request) {
		model.addAttribute("request", request);
		imageBoardService.selectNum(model);
		return "ImageBoard/ImageBoard_view";
	}

	// 2. 현재 로그인 한 id로, 좋아요 했는지 보여주기
	@RequestMapping(value = "/viewLikes", method = RequestMethod.GET)
	@ResponseBody
	public String viewLikes(String num, String id) {
		List<ImageBoardDTO> result = imageBoardService.viewLikes(Integer.parseInt(num), id);
		if (result.size() == 0) {
			return "{\"result\":0}"; // 테이블에 데이터가 없음.
		} else {
			return "{\"result\":1}"; // 테이블에 데이터가 있음.
		}
	}

	// 3. 좋아요
	@RequestMapping(value = "/likes", method = RequestMethod.GET)
	@ResponseBody
	public String likes(ImageBoardDTO imageBoardDTO) {
		int result = imageBoardService.likes(imageBoardDTO);
		// 삭제 수행 결과 int값으로 반환 (1:성공, 0:실패)
		if (result == 1) {
			return "{\"result\":1}";
		} else {
			return "{\"result\":0}";
		}
	}

	// 4. 좋아요취소
	@RequestMapping(value = "/disLikes", method = RequestMethod.GET)
	@ResponseBody
	public String disLikes(ImageBoardDTO imageBoardDTO) {
		int result = imageBoardService.disLikes(imageBoardDTO);
		// 삭제 수행 결과 int값으로 반환 (1:성공, 0:실패)
		if (result == 1) {
			return "{\"result\":1}";
		} else {
			return "{\"result\":0}";
		}
	}

	// 5. 좋아요 개수만 출력
	@RequestMapping(value = "/likesTotal", method = RequestMethod.GET)
	@ResponseBody
	public String likesTotal(String num) {
		int likeCount = 0;
		List<ImageBoardDTO> dto = imageBoardService.likesTotal(Integer.parseInt(num));
		for (int i = 0; i < dto.size(); i++) {
			ImageBoardDTO getDto = dto.get(i);
			likeCount = getDto.getLikes();
		}
		return "{\"result\":" + likeCount + "}";
	}
	
	//6. 이전 글 보여주기
	@RequestMapping("ImageBoard_preview")
	public String imageBoardPreview(Model model, HttpServletRequest request) {
		String resultView = "";
		int num = Integer.parseInt(request.getParameter("num"));
		model.addAttribute("request", request);
		String result=imageBoardService.imageBoardPreview(model);
		if (result==null) {
			resultView = "ImageBoard/ImageBoard_preview_nextview";
		}else {
			resultView = "redirect:/ImageBoard_view?num=" + result;
		}
		return resultView;
	}

	//7. 다음 글 보여주기
	@RequestMapping("ImageBoard_nextview")
	public String imageBoardNextview(Model model, HttpServletRequest request) {
		String resultView = "";
		int num = Integer.parseInt(request.getParameter("num"));
		model.addAttribute("request", request);
		String result=imageBoardService.imageBoardNextview(model);
		if (result==null) {
			resultView = "ImageBoard/ImageBoard_preview_nextview";
		}else {
			resultView = "redirect:/ImageBoard_view?num=" + result;
		}
		return resultView;
	}
	

	// ==============================================================================
	// ■ 글 삭제
	// ==============================================================================
	@RequestMapping(value = "ImageBoard_delete")
	public String delete(Model model, HttpServletRequest request) throws Exception {
		model.addAttribute("request", request);
		// 글만 delete하는 수행 결과
		int result = imageBoardService.delete(model);
		// 이미지만 delete하는 수행 결과
		int result2 = imageBoardService.deleteImage(model);
		// delete수행 결과
		if (result == 1 && result2 == 1) {				// delete가 성공적으로 수행 된다면
			return "ImageBoard/ImageBoard_delete_yes";	// yes페이지 보여주기
		} else
			return "ImageBoard/ImageBoard_delete_no";
	}

	// ==============================================================================
	// ■ 글 수정
	// ==============================================================================
	// 1. 수정 페이지 보여주기
	@RequestMapping("ImageBoard_modify")
	public String modify_contents(Model model, HttpServletRequest request) {
		model.addAttribute("request", request);
		imageBoardService.modifyView(model);
		return "ImageBoard/ImageBoard_modify";
	}

	// 2. 실제 수정 (id값 있는지 확인 해줄 것!!)
	@RequestMapping("modifySave")
	public String modify(Model model, MultipartHttpServletRequest request) throws Exception {
		model.addAttribute("request", request);
		imageBoardService.update(model);
		return "redirect:ImageBoard_view?num=" + request.getParameter("num");
	}

	// ==============================================================================
	// ■ 이미지 다운로드
	// ==============================================================================
	@RequestMapping("ImageBoard_download")
	public String download(Model model, HttpServletResponse response, HttpServletRequest request) throws Exception {
		model.addAttribute("request", request);
		// board_num으로 imagetable의 내용들을 가져온다.
		ImageBoardDTO dto = imageBoardService.imageDownload(model);
		// Original_file_name과 Stored_file_name을 변수에 담는다.
		String Original_file_name = dto.getOriginal_file_name();
		String Stored_file_name = dto.getStored_file_name();
		// 해당 image를 서버(C드라이브)에서 찾아 response로 보내준다.
		byte[] fileByte = FileUtils.readFileToByteArray(new File("C:\\download\\" + Stored_file_name));

		response.setContentType("application/octet-stream");
		response.setContentLength(fileByte.length);
		response.setHeader("Content-Disposition",
				"attachment; fileName=\"" + URLEncoder.encode(Original_file_name, "UTF-8") + "\";");
		response.setHeader("Content-Trasfer-Encoding", "binary");
		response.getOutputStream().write(fileByte);
		response.getOutputStream().flush();
		response.getOutputStream().close();

		return "ImageBoard_view?num=" + request.getParameter("board_num");
	}
}
