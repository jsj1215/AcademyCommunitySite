package com.care.member_service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.care.member_dao.MemberDAO;
import com.care.member_vo.MemberVO;
@Service
public class MemberServiceImpl implements MemberService{
	@Autowired
	private MemberDAO dao;
	@Override
	public void execute(Model model) {
		model.addAttribute("memberlist", dao.userMember());
		
	}

}
