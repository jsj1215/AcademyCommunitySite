package com.care.board_service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.care.board_dao.BoardDAO;
import com.care.board_dto.BoardDTO;
import com.care.board_searchdto.BoardSearchDTO;

@Service
public class BoardListServiceImpl implements BoardService {
	@Autowired
	private BoardDAO dao;

	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		int tot = 0;
		String page = null;
		String sel = null;
		String searchData = null;
		BoardSearchDTO dto = new BoardSearchDTO();
		List<BoardDTO> list = new ArrayList<BoardDTO>();
		Map<Integer, Integer> replyCount = new HashMap<Integer, Integer>();
		if(request.getParameter("searchData") == null) {
			tot = dao.totalPage();
			if(request.getParameter("page") == null) {
				page = "1";
				list = dao.list(page);
				for(BoardDTO b : list) {
					replyCount.put(b.getId(), dao.replyCount(b.getId()+""));
				}
				model.addAttribute("replyCount", replyCount);
				model.addAttribute("list", list);
			} else {
				page = request.getParameter("page");
				list = dao.list(page);
				for(BoardDTO b : list) {
					replyCount.put(b.getId(), dao.replyCount(b.getId()+""));
				}
				model.addAttribute("replyCount", replyCount);
				model.addAttribute("list", list);
			}
		} else {
			if(request.getParameter("page") == null) {
				page = "1";
				dto.setPage(page);
			} else {
				page = request.getParameter("page");
				dto.setPage(page);
			}
			sel = request.getParameter("sel");
			searchData = request.getParameter("searchData");
			dto.setSearchData(searchData);
			if(sel.equals("name")) {
				tot = dao.searchNamePage(searchData);
				list = dao.nameSearch(dto);
				for(BoardDTO b : list) {
					replyCount.put(b.getId(), dao.replyCount(b.getId()+""));
				}
				model.addAttribute("replyCount", replyCount);
				model.addAttribute("searchList", list);
			} else if(sel.equals("title")) {
				tot = dao.searchTitlePage(searchData);
				list = dao.titleSearch(dto);
				for(BoardDTO b : list) {
					replyCount.put(b.getId(), dao.replyCount(b.getId()+""));
				}
				model.addAttribute("replyCount", replyCount);
				model.addAttribute("searchList", list);
			} else {
				tot = dao.searchContentPage(searchData);
				list = dao.contentSearch(dto);
				for(BoardDTO b : list) {
					replyCount.put(b.getId(), dao.replyCount(b.getId()+""));
				}
				model.addAttribute("replyCount", replyCount);
				model.addAttribute("searchList", list);
			}
		}
		int max = tot / 10;
		if(tot % 10 != 0) {
			max+=1;
		}
		model.addAttribute("maxPage", max);
		
	}

}
