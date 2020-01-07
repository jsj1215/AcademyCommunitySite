package com.care.board_service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.care.board_dao.BoardDAO;
import com.care.board_likesdto.BoardLikesDTO;

@Service
public class BoardLikesServiceImpl implements BoardService {
	@Autowired
	private BoardDAO dao;

	@Override
	public void execute(Model model) {
		String rs = null;
		Map<String, Object> map = model.asMap();
		BoardLikesDTO dto = (BoardLikesDTO) map.get("dto");
		int result = dao.likes(dto);
		if(result == 1) {
			rs = "성공";
		} else {
			rs = "실패";
		}
		model.addAttribute("rs", rs);
	}

}
