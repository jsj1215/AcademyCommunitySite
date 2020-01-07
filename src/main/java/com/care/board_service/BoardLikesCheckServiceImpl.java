package com.care.board_service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.care.board_dao.BoardDAO;
import com.care.board_likesdto.BoardLikesDTO;

@Service
public class BoardLikesCheckServiceImpl implements BoardService {
	@Autowired
	private BoardDAO dao;

	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		BoardLikesDTO dto = new BoardLikesDTO();
		dto.setId(Integer.parseInt(id));
		dto.setName(name);
		List<BoardLikesDTO> chkList = dao.checkLikes(dto);
		model.addAttribute("chkList", chkList);
	}
}
