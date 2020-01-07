package com.care.board_service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.care.board_dao.BoardDAO;
import com.care.board_dto.BoardDTO;

@Service
public class BoardInfoServiceImpl implements BoardService {
	@Autowired
	private BoardDAO dao;

	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		//세션값이 없을경우(로그인한 사용자가 아닐때) info메소드 실행x
		if(request.getSession().getAttribute("sid") == null) {
			return;
		}
		String id = request.getParameter("id");
		BoardDTO dto = dao.info(id);
		model.addAttribute("dto", dto);
	}

}
