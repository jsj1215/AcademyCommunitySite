package com.care.member_service;

import java.util.*;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.care.member_dao.MemberDAO;
import com.care.member_vo.MemberVO;
@Service
public class LoginMemberServiceImpl implements MemberService{
	@Autowired
	private MemberDAO dao;
	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		MemberVO vo = new MemberVO();
		String id = request.getParameter("id");
		vo = dao.LoginConfirm(id);
		model.addAttribute("loginsystem",vo);
		model.addAttribute("pw",request.getParameter("pw"));
	}

}
