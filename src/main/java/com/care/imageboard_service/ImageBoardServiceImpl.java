package com.care.imageboard_service;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.care.imageboard_dao.ImageBoardDAO;
import com.care.imageboard_dto.ImageBoardDTO;

@Service
public class ImageBoardServiceImpl implements ImageBoardService {

	@Autowired
	private ImageBoardDAO dao;

	// ==============================================================================
	// ■ main에서 보여주기
	// ==============================================================================
	// @Override
	// public List<ImageBoardDTO> mainViewImageTable(Model model) {
	// model.addAttribute("imageTable", dao.mainViewImageTable());
	// return null;
	// }

	// 1. 모든 데이터 조회+페이징처리
	@Override
	public List<ImageBoardDTO> selectAllDTO() {
		List<ImageBoardDTO> imageBoardList = dao.selectAllDTO();
		return imageBoardList;
	}
	// 2. 메인에서 검색하기
	@Override
	public List<ImageBoardDTO> search(int searchMode, String searchWord) {
		List<ImageBoardDTO> imageBoardList = dao.search(searchMode, searchWord);
		return imageBoardList;
	}
	// ==============================================================================
	// ■ 댓글 쓰기
	// ==============================================================================
	@Override
	public int replyInsert(ImageBoardDTO imageBoardDTO) {
		//String reply_id = imageBoardDTO.getReply_id();
		//String reply_content = imageBoardDTO.getReply_content();
		//int reply_num = imageBoardDTO.getReply_num();
		int result = dao.replyInsert(imageBoardDTO);
		return result;
	}
	// ==============================================================================
	// ■ 댓글 보여주기
	// ==============================================================================
	@Override
	public List<ImageBoardDTO> viewReply(int reply_num) {
		List<ImageBoardDTO> imageBoardList = dao.viewReply(reply_num);
		return imageBoardList;
	}
	// ==============================================================================
	// ■ 댓글 수정
	// ==============================================================================
	@Override
	public int editReply(ImageBoardDTO dto) {
		int result = dao.editReply(dto);
		return result;
	}
	// ==============================================================================
	// ■ 댓글 삭제
	// ==============================================================================
	@Override
	public int deleteReply(ImageBoardDTO imageBoardDTO) {
		int result = dao.deleteReply(imageBoardDTO);
		return result;
	}
	// ==============================================================================
	// ■ 글 쓰기
	// ==============================================================================
	// 글쓰기 : ImageBoard_write에서 입력받은 데이터 DB에 저장 + 이미지(첨부파일) 저장
	@Override
	public void saveData(Model model) throws IOException {
		Map<String, Object> map = model.asMap();
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) map.get("request");
		MultipartFile multipartFile = multipartHttpServletRequest.getFile("imageFile");

		ImageBoardDTO dto = new ImageBoardDTO();

		String original_file_name = multipartFile.getOriginalFilename();
		String stored_file_name = System.currentTimeMillis() + original_file_name; // 파일이 중복 저장되면, 현재시간을 앞에 붙여 파일명이 저장되게 됨.(실제 저장되는 파일명)
																					
		String file_size = String.valueOf(multipartFile.getSize());
		String file_path = "C:\\Download\\";

		String id = multipartHttpServletRequest.getParameter("id");
		String title = multipartHttpServletRequest.getParameter("title");
		String content = multipartHttpServletRequest.getParameter("content");

		dto.setOriginal_file_name(original_file_name);
		dto.setStored_file_name(stored_file_name);
		dto.setFile_size(file_size);
		dto.setFile_path(file_path);
		dto.setId(id);
		dto.setTitle(title);
		dto.setContent(content);
		
		Files.copy(multipartFile.getInputStream(), Paths.get(file_path, stored_file_name));
		dao.saveData(dto);
	}

	// ==============================================================================
	// ■ 글 조회
	// ==============================================================================
	// 1. 글 조회
	@Override
	public List<ImageBoardDTO> selectNum(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		int num = Integer.parseInt(request.getParameter("num"));
		model.addAttribute("selectNum", dao.selectNum(num));
		selectImage(model, num); // 이미지 불러오기 위한 메소드
		return null;
	}
	// 2. 이미지 조회
	public void selectImage(Model model, int board_num) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		model.addAttribute("selectImage", dao.selectImage(board_num));
	}
	// 3. 좋아요 했는지 보여주기
	@Override
	public List<ImageBoardDTO> viewLikes(int num, String id) {
		// num과 id 두개의 값으로 테이블을 조회해야 하는데, mapper에서는 한개의 데이터밖에 못넘겨줌.
		// 그래서 Service에서 num과 id를 dto에 set해주고, dto자체를 넘기도록 하자.
		ImageBoardDTO dto = new ImageBoardDTO();
		dto.setNum(num);
		dto.setId(id);
		List<ImageBoardDTO> result = dao.viewLikes(dto);
		return result;
	}
	// 4. 좋아요
	@Override
	public int likes(ImageBoardDTO dto) {
		int result = dao.insertLikes(dto);
		return result;
	}
	// 5. 좋아요 취소
	@Override
	public int disLikes(ImageBoardDTO dto) {
		int result = dao.disLikes(dto);
		return result;
	}
	// 6. 좋아요 총 개수
	@Override
	public List<ImageBoardDTO> likesTotal(int num) {
		List<ImageBoardDTO> result = dao.likesTotal(num);
		return result;
	}
	//7. 이전글 보여주기
	@Override
	public String imageBoardPreview(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		int num = Integer.parseInt(request.getParameter("num"));
		String result = dao.imageBoardPreview(num);
		return result;
	}
	//8. 다음글 보여주기
	@Override
	public String imageBoardNextview(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		int num = Integer.parseInt(request.getParameter("num"));
		String result = dao.imageBoardNextview(num);
		return result;
	}
	// ==============================================================================
	// ■ 삭제
	// ==============================================================================
	// 1. 글 삭제
	@Override
	public int delete(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		int result = dao.delete(Integer.parseInt(request.getParameter("num")));
		return result;
	}
	// 2. 이미지 삭제
	@Override
	public int deleteImage(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		// view단에서 넘겨준 imageboard의 num이 사실상 imagetable의 board_num과 같은 숫자이므로 아래와 같이 받아와
		// 변수에 저장해준다.
		int board_num = Integer.parseInt(request.getParameter("num"));
		String stored_file_name = request.getParameter("stored_file_name");
		// board_num을 가지고 가서 imagetable에서 해당 내용 delete!
		int result2 = dao.deleteImage(board_num);

		if (result2 == 1) {
			// ★삭제할 파일의 경로
			String file_path = "C:\\Download\\" + stored_file_name;

			// ★실제 로컬PC에서 해당 파일 삭제하기
			File file = new File(file_path);
			if (file.exists() == true) {	// 해당하는 file_path가 있다면,
				file.delete();				// 해당 파일 삭제!
			}
		}
		return result2;
	}
	// 3. 이미지 다운로드
	@Override
	public ImageBoardDTO imageDownload(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		int board_num = Integer.parseInt(request.getParameter("board_num"));
		ImageBoardDTO result = dao.imageDownload(board_num);
		return result;
	}
	// ==============================================================================
	// ■ 수정
	// ==============================================================================
	// 1. 수정할 폼을 보여줌.
	@Override
	public List<ImageBoardDTO> modifyView(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		int num = Integer.parseInt(request.getParameter("num"));
		model.addAttribute("modifyView", dao.modifyView(num));
		//modifyViewImage(model, num);
		return null;
	}

	/*
	 * // 2. 수정할 이미지 보여줌. public void modifyViewImage(Model model, int board_num) {
	 * Map<String, Object> map = model.asMap(); HttpServletRequest request =
	 * (HttpServletRequest) map.get("request");
	 * model.addAttribute("modifyViewImage", dao.modifyViewImage(board_num)); }
	 */
	// 3. 실제 수정.
	@Override
	public void update(Model model) throws Exception {
		Map<String, Object> map = model.asMap();
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) map.get("request");
		MultipartFile multipartFile = multipartHttpServletRequest.getFile("imageModify");
		String original_file_name = multipartFile.getOriginalFilename();
		String stored_file_name = System.currentTimeMillis() + original_file_name; // 파일이 중복 저장되면, 현재시간을 앞에 붙여 파일명이 저장되게

		String file_size = String.valueOf(multipartFile.getSize());
		String file_path = "C:\\Download\\";

		int num = Integer.parseInt(multipartHttpServletRequest.getParameter("num"));
		String title = multipartHttpServletRequest.getParameter("title");
		String content = multipartHttpServletRequest.getParameter("content");
		int board_num = Integer.parseInt(multipartHttpServletRequest.getParameter("num"));

		ImageBoardDTO dto = new ImageBoardDTO();

		dto.setNum(num);
		dto.setTitle(title);
		dto.setContent(content);
		dto.setBoard_num(board_num);
		dto.setOriginal_file_name(original_file_name);
		dto.setStored_file_name(stored_file_name);
		dto.setFile_size(file_size);
		dto.setFile_path(file_path);

		Files.copy(multipartFile.getInputStream(), Paths.get(file_path, stored_file_name));
		/*
		 * System.out.println("수정 후 저장 num : " + num);
		 * System.out.println("수정 후 저장 title : " + title);
		 * System.out.println("수정 후 저장 content : " + content);
		 * System.out.println("수정 후 저장 board_num : " + board_num);
		 * System.out.println("수정 후 저장 original_file_name : " + original_file_name);
		 * System.out.println("수정 후 저장 stored_file_name : " + stored_file_name);
		 */
		deleteDriveImage(model);
		dao.update(dto);
	}

	// 4.이미지수정시 기존이미지 C드라이브에서 삭제
	public void deleteDriveImage(Model model) throws IOException {
		Map<String, Object> map = model.asMap();
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) map.get("request");
		MultipartFile multipartFile = multipartHttpServletRequest.getFile("imageModify");

		// 로컬에서 현재 저장된 파일 삭제하기
		String ex_stored_file_name = multipartHttpServletRequest.getParameter("ex_stored_file_name");
		String file_path = "C:\\Download\\" + ex_stored_file_name;
		File file = new File(file_path);
		if (file.exists() == true) {// 해당하는 file_path가 있다면,
			file.delete(); 			// 해당 파일 삭제!
		}
	}


}
