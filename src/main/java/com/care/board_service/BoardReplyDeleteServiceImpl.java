package com.care.board_service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.care.board_dao.BoardDAO;
import com.care.board_replydto.BoardReplyDTO;

@Service
public class BoardReplyDeleteServiceImpl implements BoardService {
	@Autowired
	private BoardDAO dao;

	@Override
	public void execute(Model model) {
		String rs = null;
		int result;
		Map<String, Object> map = model.asMap();
		BoardReplyDTO dto = (BoardReplyDTO) map.get("dto");
		if(dto.getIndent() == 0) {
			result = dao.firstReplyRemove(dto);
		} else {
			result = dao.replyRemove(dto);
		}
		
		if(result == 0) {
			rs = "실패";
		} else {
			rs = "성공";
		}
		model.addAttribute("rs", rs);
	}
}
