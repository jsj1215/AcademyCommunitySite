package com.care.fileboard_dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.care.fileboard_dto.FileBoardDTO;


@Repository
public class FileBoardDAO {
	//사용할 mapper.xml의 namespace명
	private static final String namespace="com.care.mybatis.boardMapper";
	@Autowired
	private SqlSession sqlSession;
	
	public List<FileBoardDTO> fileBoardList(int page) {
		return sqlSession.selectList(namespace+".fileBoardList",page); 
	}

	public int boardsave(FileBoardDTO dto) {
		return sqlSession.insert(namespace+".boardsave",dto);
	}

	public int boardDelete(String id) {
		
		return sqlSession.insert(namespace+".boardDelete",id);
		
	}

	public FileBoardDTO fileModifyForm(String id) {
		
		sqlSession.update(namespace+".fileBoardHitPlus",id);
		return sqlSession.selectOne(namespace+".fileModifyForm",id);
		
	}
	/*
	 * public void fileHitPlus(String id) {
	 * 
	 * sqlSession.update(namespace+".fileBoardHitPlus",id);
	 * 
	 * }
	 */

	public void fileBoardUpdate(FileBoardDTO dto) {
		
		sqlSession.update(namespace+".fileBoardUpdate",dto);
		
	}
	
	public int fileMaxPage() {
		
		return sqlSession.selectOne(namespace+".fileMaxPage");
	}
	
	public int multiFileup(FileBoardDTO dto) {
		
		return sqlSession.insert(namespace+".multiFileUp",dto);
		
	}

	public List<FileBoardDTO> fileList(String id) {
		
		return sqlSession.selectList(namespace+".fileList",id);
		
	}

	public int fileRemove(FileBoardDTO dto) {
		
		return sqlSession.delete(namespace+".fileRemove",dto);
		
	}

	public void fileChk(String id) {
		
		sqlSession.update(namespace+".fileChk",id);
	}

	public int fileModify(FileBoardDTO dto) {
		
		return sqlSession.update(namespace+".fileModify",dto);
		
	}

	public List<FileBoardDTO> deleteFileList(String id) {
		
		return sqlSession.selectList(namespace+".deleteFileList",id);
		
	}

	public void deleteFile(String id) {
		
		sqlSession.delete(namespace+".deleteFile",id);
		
	}

	public List<FileBoardDTO> searchFileTitle(FileBoardDTO dto) {
		
		return sqlSession.selectList(namespace+".searchFileTitle",dto);
	}

	public List<FileBoardDTO> searchFileName(FileBoardDTO dto) {
		
		return sqlSession.selectList(namespace+".searchFileName",dto);
	}

	public List<FileBoardDTO> searchFileContent(FileBoardDTO dto) {
		
		return sqlSession.selectList(namespace+".searchFileContent",dto);
	}

	public int fileTitleMaxPage(String searchData) {
		
		return sqlSession.selectOne(namespace+".fileTitleMaxPage",searchData);
	}

	public int fileNameMaxPage(String searchData) {
		
		return sqlSession.selectOne(namespace+".fileNameMaxPage",searchData);
	}

	public int fileContentMaxPage(String searchData) {
		
		return sqlSession.selectOne(namespace+".fileContentMaxPage",searchData);
	}

	public int fileCount(int id) {
		
		return sqlSession.selectOne(namespace+".fileCount",id);
		
	}

	public void boardFileChkN(int id) {
		
		sqlSession.update(namespace+".boardFileChkN",id);
		
	}

	public void boardFileChkY(int id) {

		sqlSession.update(namespace+".boardFileChkY",id);
		
	}

	public String preFileBoardView(int id) {

		return sqlSession.selectOne(namespace+".preFileBoardView",id);
		
	}

	public String nextFileBoardView(int id) {
		
		return sqlSession.selectOne(namespace+".nextFileBoardView",id);
	}




}