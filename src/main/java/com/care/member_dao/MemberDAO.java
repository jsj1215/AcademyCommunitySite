package com.care.member_dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.care.member_vo.MemberVO;
@Repository
public class MemberDAO {
	private static final String namespace="com.care.mybatis.boardMapper";
	@Autowired //jdbc-config.xml 설정한 빈 얻어온다
	private SqlSession sqlSession;
	public String JoinConfirm(String id) {
		
		return sqlSession.selectOne(namespace+".joinconfirm",id);
	}
	public String EmailConfirm(String email) {
		
		return sqlSession.selectOne(namespace+".emailconfirm",email);
	}
	public int JoinMember(MemberVO vo) {
		
		return sqlSession.insert(namespace+".joinmember",vo);
	}
	
	public MemberVO LoginConfirm(String id) {
		
		return sqlSession.selectOne(namespace+".loginconfirm",id);
	}
	public int UpdateMember(MemberVO vo) {
		
		return sqlSession.update(namespace+".updatemember",vo);
	}
	public int DeleteMember(MemberVO vo) {
		
		return sqlSession.delete(namespace+".deletemember",vo);
	}
	public MemberVO IdConfirm(MemberVO vo) {
		return sqlSession.selectOne(namespace+".idconfirm",vo);
	}
	public MemberVO PwConfirm(MemberVO vo) {
		
		return sqlSession.selectOne(namespace+".pwconfirm",vo);
	}
	public int ChangePw(MemberVO vo) {
		
		return sqlSession.update(namespace+".changepw",vo);
	}
	public List<MemberVO> userMember() {
		return sqlSession.selectList(namespace+".usermember");
	}
	
	public int ChangeClasses(MemberVO vo) {
		return sqlSession.update(namespace+".changeclasses",vo);
		
	}
	
}
