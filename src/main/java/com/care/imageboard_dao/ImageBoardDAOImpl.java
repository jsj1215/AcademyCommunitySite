package com.care.imageboard_dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

import com.care.imageboard_dto.ImageBoardDTO;

@Repository
public class ImageBoardDAOImpl implements ImageBoardDAO {

	private static final String namespace = "com.care.mybatis.boardMapper";

	@Autowired
	private SqlSession sqlSession;

	// ===========================================================
	// ■ 메인
	// ===========================================================

	// @Override
	// public List<ImageBoardDTO> mainViewImageTable() {
	// return sqlSession.selectList(namespace+".imageTable");
	// }

	// 1. 모두 조회+페이징처리
	@Override
	public List<ImageBoardDTO> selectAllDTO() {
		return sqlSession.selectList(namespace + ".imageBoardSelectAllDTO");
	}

	// 2. 메인에서 검색하기
	public List<ImageBoardDTO> search(int searchMode, String searchWord) {
		List<ImageBoardDTO> imageBoardDTO = null;
		if (searchMode == 0) { // id로 검색했을 때
			imageBoardDTO = sqlSession.selectList(namespace + ".imageBoardSearchId", searchWord);
		} else if (searchMode == 1) { // title로 검색했을 때
			imageBoardDTO = sqlSession.selectList(namespace + ".imageBoardSearchTitle", searchWord);
		} else if (searchMode == 2) { // content로 검색했을 때
			imageBoardDTO = sqlSession.selectList(namespace + ".imageBoardSearchContent", searchWord);
		}
		return imageBoardDTO;
	}

	// ===========================================================
	// ■ 댓글 등록
	// ===========================================================
	@Override
	public int replyInsert(ImageBoardDTO dto) {
		int result = sqlSession.insert(namespace + ".imageBoardReplyInsert", dto);
		return result;
	}

	// ===========================================================
	// ■ 댓글 보여주기
	// ===========================================================
	@Override
	public List<ImageBoardDTO> viewReply(int reply_num) {
		return sqlSession.selectList(namespace + ".imageBoardViewReply", reply_num);
	}

	// ===========================================================
	// ■ 댓글 수정
	// ===========================================================
	@Override
	public int editReply(ImageBoardDTO dto) {
		return sqlSession.update(namespace + ".imageBoardEditReply", dto);
	}

	// ===========================================================
	// ■ 댓글 삭제
	// ===========================================================
	@Override
	public int deleteReply(ImageBoardDTO dto) {
		return sqlSession.delete(namespace + ".imageBoardDeleteReply", dto);
	}

	// ===========================================================
	// ■ 조회
	// ===========================================================
	// 1. num으로 검색한 상세 내용 보기 + 게시글 클릭시 조회수 증가
	@Override
	public List<ImageBoardDTO> selectNum(int num) {
		upHit(num);
		return sqlSession.selectList(namespace + ".imageBoardSelectNum", num);
	}

	// upHit(조회수 증가 메서드)
	public void upHit(int num) {
		sqlSession.update(namespace + ".imageBoardUpHit", num);// 조회수(hit)update
	}

	// 2. 이미지 보여주기
	@Override
	public List<ImageBoardDTO> selectImage(int board_num) {
		return sqlSession.selectList(namespace + ".imageBoardSelectImage", board_num);
	}

	// 3. 좋아요 했는지 여부 확인하기
	@Override
	public List<ImageBoardDTO> viewLikes(ImageBoardDTO dto) {
		return sqlSession.selectList(namespace + ".imageBoardViewLikes", dto);
	}

	// 4. 좋아요
	@Override
	public int insertLikes(ImageBoardDTO dto) {
		sqlSession.update(namespace + ".imageBoardTotalLikes", dto);
		return sqlSession.update(namespace + ".imageBoardInsertLikes", dto);
	}

	// 5.좋아요취소
	@Override
	public int disLikes(ImageBoardDTO dto) {
		sqlSession.update(namespace + ".imageBoardTotalDisLikes", dto);
		return sqlSession.delete(namespace + ".imageBoardDisLikes", dto);
	}

	// 6. 좋아요 총 개수 구하기
	@Override
	public List<ImageBoardDTO> likesTotal(int num) {
		return sqlSession.selectList(namespace + ".imageBoardLikesTotal", num);
	}
	
	//7. 이전 글 보여주기
	@Override
	public String imageBoardPreview(int num) {
		return sqlSession.selectOne(namespace+".imageBoardPreview",num);
	}
	//8. 다음 글 보여주기
	@Override
	public String imageBoardNextview(int num) {
		return sqlSession.selectOne(namespace+".imageBoardNextview",num);
	}
	// ===========================================================
	// ■ 글 저장
	// ===========================================================
	// 글 내용 입력후 DB에 저장
	@Override
	public void saveData(ImageBoardDTO dto) {

		// ■ 게시글 저장 쿼리
		int boardResult = sqlSession.insert(namespace + ".imageBoardSaveData", dto);
		// ■ 이미지 저장 쿼리
		int imageResult = sqlSession.insert(namespace + ".imageBoardImageFile", dto);
	}

	// ===========================================================
	// ■ 삭제
	// ===========================================================
	// 1. 글 삭제
	@Override
	public int delete(int num) {
		int result = sqlSession.delete(namespace + ".imageBoardDelete", num);
		return result;
	}
	// 2. 이미지 삭제
	@Override
	public int deleteImage(int board_num) {
		int result2 = sqlSession.delete(namespace + ".imageBoardDeleteImage", board_num);
		return result2;
	}

	// ===========================================================
	// ■ 이미지다운로드
	// ===========================================================
	@Override
	public ImageBoardDTO imageDownload(int board_num) {
		return sqlSession.selectOne(namespace + ".imageDownload", board_num);
	}
	// ===========================================================
	// ■ 글 수정
	// ===========================================================
	// 1. 수정을 위한 폼 보여주기 (글만 보여줌)
	@Override
	public List<ImageBoardDTO> modifyView(int num) {
		return sqlSession.selectList(namespace + ".imageBoardModifyView", num);
	}

	/*
	 * // 2. 수정을 위한 폼 보여줌(이미지만 보여줌)
	 * 
	 * @Override public List<ImageBoardDTO> modifyViewImage(int board_num) { return
	 * sqlSession.selectList(namespace + ".imageBoardModifyViewImage", board_num); }
	 */
	
	// 3. 글 수정
	@Override
	public void update(ImageBoardDTO dto) {
		// 게시글 수정 쿼리
		int boardUpdateResult = sqlSession.update(namespace + ".imageBoardUpdate", dto);
		// 이미지 수정 쿼리
		int imageUpdateResult = sqlSession.update(namespace + ".imageBoardUpdateImage", dto);
	}
}
