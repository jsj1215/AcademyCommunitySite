package com.care.member_controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.care.member_service.*;
import com.care.member_vo.MemberVO;

@Controller
public class MemberController {
	MemberService ms;
	
	@RequestMapping("main")
	public String main() {
		return "default/main";
	}
	@RequestMapping("main_session")
	public String main_session(Model model, HttpServletRequest request) {
		String id = request.getParameter("sessionid");
		String classes = request.getParameter("sessionclasses");
		HttpSession session = request.getSession();
		session.setAttribute("sid", id);
		session.setAttribute("sclasses", classes);
		return "redirect:main";
	}
	@RequestMapping("member_info")
	public String member_info(Model model, MemberVO vo, HttpServletRequest request) {
		ms = (MemberService) MemberApplicationContextProvider.applicationContext.getBean("memberInfoServiceImpl");
		vo.setId(request.getParameter("requestid"));
		model.addAttribute("request", vo);
		ms.execute(model);
		return "user/user_member_info";
	}
	
	@RequestMapping("main_join")
	public String main_join() {
		return "user/user_join";
	}
	@RequestMapping("main_login")
	public String main_login() {
		return "user/user_login";
	}
	@RequestMapping("main_delete")
	public String user_delete_check() {
		return "user/user_delete_check";
	}
	@RequestMapping("user_logout")
	public String user_logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		return "user/user_logout";
	}
	@RequestMapping("main_update")
	public String main_update(Model model, HttpServletRequest request) {
		ms = (MemberService) MemberApplicationContextProvider.applicationContext.getBean("mypageMemberServiceImpl");
		model.addAttribute("request", request);
		ms.execute(model);
		return "user/user_update";
	}
	@RequestMapping("user_delete_ok")
	public String main_delete(Model model, HttpServletRequest request) {
		ms = (MemberService) MemberApplicationContextProvider.applicationContext.getBean("deleteMemberServiceImpl");
		model.addAttribute("request", request);
		ms.execute(model);
		return "user/user_delete_ok";
	}
	@RequestMapping("user_update_ok")
	public String user_update_ok(Model model, HttpServletRequest request) {
		ms = (MemberService) MemberApplicationContextProvider.applicationContext.getBean("updateMemberServiceImpl");
		model.addAttribute("request", request);
		ms.execute(model);
		return "user/user_update_ok";
	}
	@RequestMapping("user_mypage")
	public String user_mypage(Model model, HttpServletRequest request) {
		ms = (MemberService) MemberApplicationContextProvider.applicationContext.getBean("mypageMemberServiceImpl");
		model.addAttribute("request", request);
		ms.execute(model);
		
		return "user/user_mypage";
	}
	@RequestMapping("joinconfirm")
	public String joinconfirm(Model model, HttpServletRequest request) {
		ms = (MemberService) MemberApplicationContextProvider.applicationContext.getBean("joinConfirmMemberServiceImpl");
		model.addAttribute("request", request);
		ms.execute(model);
		
		return "user/user_join_check";
		
	}
	@RequestMapping("user_join")
	public String user_join(Model model, HttpServletRequest request) {
		ms = (MemberService) MemberApplicationContextProvider.applicationContext.getBean("joinMemberServiceImpl");
		model.addAttribute("request", request);
		ms.execute(model);
		Map<String, Object> map = model.asMap();
		String i = (String)map.get("fail");
		if(i==null) {
			return "user/user_join_ok";
		}else {
			return "user/user_join_fail";
		}
		
		
		
	}
	@RequestMapping("user_login")
	public String user_login(Model model, HttpServletRequest request) {
		ms = (MemberService) MemberApplicationContextProvider.applicationContext.getBean("loginMemberServiceImpl");
		model.addAttribute("request", request);
		ms.execute(model);
		
		return "user/user_login_ok";
	}
	@RequestMapping("user_find_id")
	public String user_find_id() {
		return "user/user_find_id";
	}
	@RequestMapping("user_find_pw")
	public String user_find_pw() {
		return "user/user_find_pw";
	}
	@RequestMapping("user_id_check")
	public String user_id_check(Model model, HttpServletRequest request) {
		ms = (MemberService) MemberApplicationContextProvider.applicationContext.getBean("findIdMemberServiceImpl");
		model.addAttribute("request", request);
		ms.execute(model);
		return "user/user_id_check";
	}
	@RequestMapping("user_pw_check")
	public String user_pw_check(Model model, HttpServletRequest request) {
		ms = (MemberService) MemberApplicationContextProvider.applicationContext.getBean("findPwMemberServiceImpl");
		model.addAttribute("request", request);
		ms.execute(model);
		return "user/user_pw_check";
	}
	@RequestMapping("user_change_pw")
	public String user_change_pw(Model model, HttpServletRequest request) {
		ms = (MemberService) MemberApplicationContextProvider.applicationContext.getBean("changePwMemberServiceImpl");
		model.addAttribute("request", request);
		ms.execute(model);
		return "user/user_change_pw_ok";
	}
	@RequestMapping("user_member")
	public String user_member(Model model) {
		ms = (MemberService) MemberApplicationContextProvider.applicationContext.getBean("memberServiceImpl");
		ms.execute(model);
		return "user/user_member";
	}
	@RequestMapping("change_classes")
	public String change_classes(Model model, HttpServletRequest request) {
		ms = (MemberService) MemberApplicationContextProvider.applicationContext.getBean("changeClassesMemberServiceImpl");
		model.addAttribute("request", request);
		ms.execute(model);
		return "redirect:user_member";
	}

}
