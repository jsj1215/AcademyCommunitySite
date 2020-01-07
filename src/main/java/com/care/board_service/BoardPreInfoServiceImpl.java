package com.care.board_service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.care.board_dao.BoardDAO;

@Service
public class BoardPreInfoServiceImpl implements BoardService {
	@Autowired
	private BoardDAO dao;
	
	@Override
	public void execute(Model model) {
		String result = null;
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		String id = request.getParameter("id");
		if(dao.preInfo(id) == null) {
			model.addAttribute("id", id);
			model.addAttribute("chk", "end");
		} else {
			result = dao.preInfo(id);
			model.addAttribute("id", result);
		}
	}

}
