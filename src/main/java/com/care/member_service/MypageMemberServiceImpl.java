package com.care.member_service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.care.member_dao.MemberDAO;
import com.care.member_vo.MemberVO;

@Service
public class MypageMemberServiceImpl implements MemberService{
	@Autowired
	private MemberDAO dao;
	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("sid");
		MemberVO vo = new MemberVO();
		vo = dao.LoginConfirm(id);
		model.addAttribute("list",vo);
		session.setAttribute("sname", vo.getName());
	}

}
