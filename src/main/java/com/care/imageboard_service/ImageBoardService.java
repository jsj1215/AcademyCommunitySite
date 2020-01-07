package com.care.imageboard_service;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.care.imageboard_dto.ImageBoardDTO;

public interface ImageBoardService {

	//=================================================================
	// ■ 메인 작업
	//=================================================================
	//	public List<ImageBoardDTO> mainViewImageTable(Model model);			//메인 보여주기
	public List<ImageBoardDTO> selectAllDTO();								//메인보여주기 + 페이징처리
	public List<ImageBoardDTO> search(int searchMode, String searchWord);	//메인에서 검색하기
	
	//=================================================================
	// ■ 댓글 관련
	//=================================================================
	public int replyInsert(ImageBoardDTO imageBoardDTO); 					//댓글 저장
	public List<ImageBoardDTO> viewReply(int reply_num); 					//댓글 보여주기
	public int deleteReply(ImageBoardDTO dto);								//댓글 삭제
	public int editReply(ImageBoardDTO dto);								//댓글 수정

	//=================================================================
	// ■ 글 관련
	//=================================================================
	public void saveData(Model model)throws Exception; 						//글 저장
	
	public List<ImageBoardDTO> selectNum(Model model); 						//해당 게시글 보기
	
	public int delete(Model model); 										//글 삭제
	public int deleteImage(Model model);									//이미지 삭제
	public ImageBoardDTO imageDownload(Model model);						//이미지 다운로드
	
	public List<ImageBoardDTO> modifyView(Model model); 					//수정하기 위한 폼을 보여줌
	public void update(Model model)throws Exception; 						//수정

	public int likes(ImageBoardDTO dto); 									//좋아요
	public int disLikes(ImageBoardDTO dto);									//좋아요 취소
	public List<ImageBoardDTO> viewLikes(int num, String id);				//좋아요 보여주기
	public List<ImageBoardDTO> likesTotal(int num);							//좋아요 총 개수
	
	public String imageBoardPreview(Model model);								//이전글 보기
	public String imageBoardNextview(Model model);								//다음글 보기
}
