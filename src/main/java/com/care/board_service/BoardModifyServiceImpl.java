package com.care.board_service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.care.board_dao.BoardDAO;
import com.care.board_dto.BoardDTO;

@Service
public class BoardModifyServiceImpl implements BoardService {
	@Autowired
	private BoardDAO dao;

	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		BoardDTO dto = (BoardDTO) map.get("dto");
		int rs = dao.modify(dto);
		model.addAttribute("rs", rs);
	}
	
	
}
