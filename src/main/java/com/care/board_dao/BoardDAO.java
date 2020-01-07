package com.care.board_dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.care.board_dto.BoardDTO;
import com.care.board_likesdto.BoardLikesDTO;
import com.care.board_replydto.BoardReplyDTO;
import com.care.board_searchdto.BoardSearchDTO;

@Repository
public class BoardDAO {
	private static final String namespace = "com.care.mybatis.boardMapper";
	
	@Autowired
	private SqlSession sqlSession;
	
	public List<BoardDTO> list(String page) {
		return sqlSession.selectList(namespace+".boardList", page);
	}
	
	public int write(BoardDTO dto) {
		return sqlSession.insert(namespace+".write", dto);
	}
	
	public BoardDTO info(String id) {
		upHit(id);
		return sqlSession.selectOne(namespace+".info", id);
	}
	
	public int modify(BoardDTO dto) {
		return sqlSession.update(namespace+".modify", dto);
	}
	
	public int delete(String id) {
		sqlSession.delete(namespace+".replyDelete", id);
		sqlSession.delete(namespace+".removeAllLikes", id);
		return sqlSession.delete(namespace+".delete", id);
	}
	
	public int upHit(String id) {
		return sqlSession.update(namespace+".upHit", id);
	}
	
	public int likes(BoardLikesDTO dto) {
		downHit(dto.getId()+"");
		sqlSession.insert(namespace+".saveLikes", dto);
		return sqlSession.update(namespace+".likes", dto);			
	}
	
	public int downHit(String id) {
		return sqlSession.update(namespace+".downHit", id);
	}
	
	public int totalPage() {
		return sqlSession.selectOne(namespace+".showPage");
	}
	
	public List<BoardDTO> nameSearch(BoardSearchDTO dto) {
		return sqlSession.selectList(namespace+".nameSearch", dto);
	}
	
	public List<BoardDTO> titleSearch(BoardSearchDTO dto) {
		return sqlSession.selectList(namespace+".titleSearch", dto);
	}
	
	public List<BoardDTO> contentSearch(BoardSearchDTO dto) {
		return sqlSession.selectList(namespace+".contentSearch", dto);
	}
	
	public int searchNamePage(String searchData) {
		return sqlSession.selectOne(namespace+".searchNamePage", searchData);
	}
	
	public int searchTitlePage(String searchData) {
		return sqlSession.selectOne(namespace+".searchTitlePage", searchData);
	}
	
	public int searchContentPage(String searchData) {
		return sqlSession.selectOne(namespace+".searchContentPage", searchData);
	}
	
	public int replySave(BoardReplyDTO dto) {
		downHit(dto.getId()+"");
		return sqlSession.insert(namespace+".replySave", dto);
	}
	
	public List<BoardReplyDTO> replyList(String id) {
		return sqlSession.selectList(namespace+".replyList", id);
	}
	
	public int replyRemove(BoardReplyDTO dto) {
		downHit(dto.getId()+"");
		return sqlSession.delete(namespace+".replyRemove", dto);
	}
	
	public int firstReplyRemove(BoardReplyDTO dto) {
		downHit(dto.getId()+"");
		return sqlSession.delete(namespace+".replyOfFirst", dto);
	}
	
	public int replyToReply(BoardReplyDTO dto) {
		downHit(dto.getId()+"");
		return sqlSession.insert(namespace+".replyToReply", dto);
	}
	
	public int replyModify(BoardReplyDTO dto) {
		downHit(dto.getId()+"");
		return sqlSession.update(namespace+".replyModify", dto);
	}
	
	public List<BoardLikesDTO> checkLikes(BoardLikesDTO dto) {
		return sqlSession.selectList(namespace+".checkLikes", dto);
	}
	
	public int removeLikes(BoardLikesDTO dto) {
		downHit(dto.getId()+"");
		sqlSession.update(namespace+".unlikes", dto);
		return sqlSession.delete(namespace+".removeLikes", dto);
	}
	
	public String preInfo(String id) {
		return sqlSession.selectOne(namespace+".preInfo", id);
	}
	
	public String nextInfo(String id) {
		return sqlSession.selectOne(namespace+".nextInfo", id);
	}
	
	public int replyCount(String id) {
		return sqlSession.selectOne(namespace+".replyCount", id);
	}
	
}
