package com.care.member_service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.xml.ws.Response;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.care.member_dao.MemberDAO;
import com.care.member_vo.MemberVO;
@Service
public class JoinMemberServiceImpl implements MemberService{
	@Autowired
	private MemberDAO dao;
	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		MemberVO vo = new MemberVO();
		vo.setId(request.getParameter("id"));
		vo.setPw(request.getParameter("pw"));
		vo.setName(request.getParameter("name"));
		vo.setYear(request.getParameter("year"));
		vo.setMonth(request.getParameter("month"));
		vo.setDays(request.getParameter("days"));
		vo.setGender(request.getParameter("gender"));
		vo.setEmail(request.getParameter("email"));
		vo.setQuestion(request.getParameter("question"));
		vo.setAnswer(request.getParameter("answer"));
		vo.setClasses("학생");
		String id = request.getParameter("id");
		String email = request.getParameter("email");
		String idconfirm = dao.JoinConfirm(id);
		String emailconfirm = dao.EmailConfirm(email);
		
		if(idconfirm != null && emailconfirm != null) {
			model.addAttribute("fail", "1");
		}else if(idconfirm != null){
			model.addAttribute("fail", "2");
		}else if(emailconfirm != null){
			model.addAttribute("fail", "3");
		}else {
			model.addAttribute("joinmember",dao.JoinMember(vo));
		}
		
		
		
	}

}
