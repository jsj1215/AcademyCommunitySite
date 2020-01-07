package com.care.imageboard_dao;

import java.util.List;

import org.springframework.ui.Model;

import com.care.imageboard_dto.ImageBoardDTO;

public interface ImageBoardDAO {

	//=================================================================
	// ■ 메인 작업
	//=================================================================
	//	public List<ImageBoardDTO> mainViewImageTable();					//메인 보여주기
	public List<ImageBoardDTO> selectAllDTO();								//메인보여주기 + 페이징처리
	public List<ImageBoardDTO> search(int searchMode, String searchWord);	//메인에서 검색하기
	
	//=================================================================
	// ■ 댓글 관련
	//=================================================================
	public int replyInsert(ImageBoardDTO dto); 								//댓글 저장
	public List<ImageBoardDTO> viewReply(int reply_num);					//댓글 보여주기
	public int deleteReply(ImageBoardDTO dto);								//댓글 삭제
	public int editReply(ImageBoardDTO dto);								//댓글 수정
	
	//=================================================================
	// ■ 글 관련
	//=================================================================
	public void saveData(ImageBoardDTO dto);								//글 저장
	public List<ImageBoardDTO> selectNum(int num);							//해당 게시글 보기
	public List<ImageBoardDTO> selectImage(int board_num);					//해당 게시글의 이미지 보기
	
	public int delete(int num);												//글삭제
	public int deleteImage(int board_num);									//이미지삭제
	public ImageBoardDTO imageDownload(int board_num);						//이미지 다운로드
	
	public List<ImageBoardDTO> modifyView(int num);							//수정하기 위한 폼을 보여줌
	//public List<ImageBoardDTO> modifyViewImage(int board_num);				//수정하기 위한 폼을 보여줌(이미지)
	public void update(ImageBoardDTO dto);									//수정
	
	public int insertLikes(ImageBoardDTO dto);								//좋아요
	public int disLikes(ImageBoardDTO dto);									//좋아요 취소
	public List<ImageBoardDTO> viewLikes(ImageBoardDTO dto);				//좋아요 보여주기
	public List<ImageBoardDTO> likesTotal(int num);							//좋아요 총 개수
	
	public String imageBoardPreview(int num);								//이전글 보기
	public String imageBoardNextview(int num);								//다음글 보기

}
