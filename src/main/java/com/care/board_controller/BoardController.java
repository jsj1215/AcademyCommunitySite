package com.care.board_controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.care.board_dto.BoardDTO;
import com.care.board_likesdto.BoardLikesDTO;
import com.care.board_replydto.BoardReplyDTO;
import com.care.board_service.BoardService;

@Controller
public class BoardController {
	private BoardService bs;
	
	@RequestMapping("board_list")
	public String board_list(Model model, HttpServletRequest request) {
		bs = (BoardService) BoardApplicationContextProvider.applicationContext.getBean("boardListServiceImpl");
		model.addAttribute("request", request);
		bs.execute(model);
		Map<String, Object> map = model.asMap();
		int max = (Integer) map.get("maxPage");
		request.setAttribute("maxPage", max);
		return "board/board_list";
	}
	
	@RequestMapping("board_write_form")
	public String board_write_form() {
		return "board/board_write_form";
	}
	
	@RequestMapping("board_write_save")
	public String board_write_view(Model model, BoardDTO dto, HttpServletRequest request) {
		bs = (BoardService) BoardApplicationContextProvider.applicationContext.getBean("boardWriteServiceImpl");
		model.addAttribute("dto", dto);
		bs.execute(model);
		request.setAttribute("rs", model);
		return "board/board_write_check";
	}
	
	@RequestMapping("board_info")
	public String board_info(HttpServletRequest request, Model model) {
		bs = (BoardService) BoardApplicationContextProvider.applicationContext.getBean("boardInfoServiceImpl");
		model.addAttribute("request", request);
		bs.execute(model);
		bs = (BoardService) BoardApplicationContextProvider.applicationContext.getBean("boardReplyListServiceImpl");
		model.addAttribute("request", request);
		bs.execute(model);
		bs = (BoardService) BoardApplicationContextProvider.applicationContext.getBean("boardLikesCheckServiceImpl");
		model.addAttribute("request", request);
		bs.execute(model);
		return "board/board_info";
	}
	
	@RequestMapping("board_preInfo")
	public String board_preInfo(Model model, HttpServletRequest request) {
		bs = (BoardService) BoardApplicationContextProvider.applicationContext.getBean("boardPreInfoServiceImpl");
		model.addAttribute("request", request);
		bs.execute(model);
		HttpSession session = request.getSession();
		String name = (String)session.getAttribute("sid");
		return "redirect:board_info?name="+name;
	}
	
	@RequestMapping("board_nextInfo")
	public String board_nextInfo(Model model, HttpServletRequest request) {
		bs = (BoardService) BoardApplicationContextProvider.applicationContext.getBean("boardNextInfoServiceImpl");
		model.addAttribute("request", request);
		bs.execute(model);
		HttpSession session = request.getSession();
		String name = (String)session.getAttribute("sid");
		return "redirect:board_info?name="+name;
	}
	
	@RequestMapping("board_modify_form")
	public String board_modify_form(Model model, HttpServletRequest request) {
		bs = (BoardService) BoardApplicationContextProvider.applicationContext.getBean("boardInfoServiceImpl");
		model.addAttribute("request", request);
		bs.execute(model);
		return "board/board_modify_form";
	}
	
	@RequestMapping("board_modify")
	public String board_modify(Model model, BoardDTO dto) {
		bs = (BoardService) BoardApplicationContextProvider.applicationContext.getBean("boardModifyServiceImpl");
		model.addAttribute("dto", dto);
		bs.execute(model);
		return "board/board_modify_check";
	}
	
	@RequestMapping("board_delete")
	public String board_delete(Model model, HttpServletRequest request) {
		bs = (BoardService) BoardApplicationContextProvider.applicationContext.getBean("boardDeleteServiceImpl");
		model.addAttribute("request", request);
		bs.execute(model);
		return "board/board_delete_check";
	}
	
	@RequestMapping(value="board_likes", produces="application/test;charset=utf-8")
	@ResponseBody
	public String board_likes(Model model, BoardLikesDTO dto) {
		bs = (BoardService) BoardApplicationContextProvider.applicationContext.getBean("boardLikesServiceImpl");
		model.addAttribute("dto", dto);
		bs.execute(model);
		Map<String, Object> map = model.asMap();
		String rs = (String) map.get("rs");
		return rs;
	}
	
	@RequestMapping(value="board_unlikes", produces="application/test;charset=utf-8")
	@ResponseBody
	public String board_unlikes(Model model, BoardLikesDTO dto) {
		bs = (BoardService) BoardApplicationContextProvider.applicationContext.getBean("boardUnlikesServiceImpl");
		model.addAttribute("dto", dto);
		bs.execute(model);
		Map<String, Object> map = model.asMap();
		String rs = (String) map.get("rs");
		return rs;
	}
	
	@RequestMapping(value="board_reply_save", produces="application/test;charset=utf-8")
	@ResponseBody
	public String board_reply_save(Model model, BoardReplyDTO dto) {
		bs = (BoardService) BoardApplicationContextProvider.applicationContext.getBean("boardReplySaveServiceImpl");
		model.addAttribute("dto", dto);
		bs.execute(model);
		Map<String, Object> map = model.asMap();
		String rs = (String) map.get("rs");
		return rs;
	}
	
	@RequestMapping(value="board_reply_delete", produces="application/test;charset=utf-8")
	@ResponseBody
	public String board_reply_delete(Model model, BoardReplyDTO dto) {
		bs = (BoardService) BoardApplicationContextProvider.applicationContext.getBean("boardReplyDeleteServiceImpl");
		model.addAttribute("dto", dto);
		bs.execute(model);
		Map<String, Object> map = model.asMap();
		String rs = (String) map.get("rs");
		return rs;
	}
	
	@RequestMapping(value="board_reply_reply", produces="application/test;charset=utf-8")
	@ResponseBody
	public String board_reply_reply(Model model, BoardReplyDTO dto) {
		bs = (BoardService) BoardApplicationContextProvider.applicationContext.getBean("boardReplyToReplySaveServiceImpl");
		model.addAttribute("dto", dto);
		bs.execute(model);
		Map<String, Object> map = model.asMap();
		String rs = (String) map.get("rs");
		return rs;
	}
	
	@RequestMapping(value="board_reply_modify", produces="application/test;charset=utf-8")
	@ResponseBody
	public String board_reply_modify(Model model, BoardReplyDTO dto) {
		bs = (BoardService) BoardApplicationContextProvider.applicationContext.getBean("boardReplyModifyServiceImpl");
		model.addAttribute("dto", dto);
		bs.execute(model);
		Map<String, Object> map = model.asMap();
		String rs = (String) map.get("rs");
		return rs;
	}
}
