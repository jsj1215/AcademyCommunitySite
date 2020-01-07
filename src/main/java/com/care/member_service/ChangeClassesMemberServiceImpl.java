package com.care.member_service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.care.member_dao.MemberDAO;
import com.care.member_vo.MemberVO;

@Service
public class ChangeClassesMemberServiceImpl implements MemberService{
	@Autowired
	private MemberDAO dao;
	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		String id = request.getParameter("id");
		String classes = request.getParameter("classes");
		MemberVO vo = new MemberVO();
		vo.setId(id);
		vo.setClasses(classes);
		dao.ChangeClasses(vo);
		
	}

}
