package com.care.calendar_dao;

import java.sql.Date;
import java.sql.SQLException;
import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

import com.care.calendar_dto.TestDTO;



@Repository
public class TestDAO {
	
	private static final String namespace="com.care.mybatis.boardMapper";
	
	@Autowired 
	private SqlSession sqlSession;
	
	public List<TestDTO> test() {
		System.out.println("나오나??");
		return sqlSession.selectList(namespace + ".listAll"); 	
	}
	
	public List<TestDTO> getjun(String name) {
		return sqlSession.selectList(namespace + ".getjun", name); }
	
	public List<TestDTO> getjuly(String name) {
		return sqlSession.selectList(namespace + ".getjuly", name); }	

	public List<TestDTO> getaug(String name) {
		return sqlSession.selectList(namespace + ".getaug", name); }

	public List<TestDTO> getsep(String name) {
		return sqlSession.selectList(namespace + ".getsep", name); }

	public List<TestDTO> getoct(String name) {
		return sqlSession.selectList(namespace + ".getoct", name); }
	
	public List<TestDTO> getnov(String name) {
		return sqlSession.selectList(namespace + ".getnov", name); }
	
	public List<TestDTO> getdec(String name) {
		return sqlSession.selectList(namespace + ".getdec", name); }	
	
	
	public int savedata(TestDTO dto) {
		System.out.println("여기까지는???");
		System.out.println(dto.getAttend());
		System.out.println(dto.getDay());
		System.out.println(dto.getMonth());
		System.out.println(dto.getName());
		int result = 0;
		try {
		result = sqlSession.insert(namespace + ".savedata", dto);
		} catch(Exception e) {
			
		}
		return result;
	}
	
	public int updatedata(TestDTO dto) {
		int result = 0;
		try {
		result = sqlSession.insert(namespace + ".updatedata", dto);
		} catch(Exception e) {
			
		}
		return result;		
		
	}
	

	
}
