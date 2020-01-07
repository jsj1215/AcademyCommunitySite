package com.care.fileboard_service;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;


import com.care.fileboard_dao.FileBoardDAO;
import com.care.fileboard_dto.FileBoardDTO;

import net.sf.json.JSONArray;

@Service
public class FileBoardService {
	
	@Autowired
	private FileBoardDAO dao;

	public void fileBoardList(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = 
				(HttpServletRequest)map.get("request");
		
		int maxPage=0;
		int page=1;
		
		if(request.getParameter("searchData")!=null) {
			FileBoardDTO dto = new FileBoardDTO();
			
			String sel = request.getParameter("sel");
			String searchData= request.getParameter("searchData");
			
			dto.setSel(sel);
			dto.setSearchData(searchData);
			
			if(request.getParameter("page")!=null) {
				page=Integer.parseInt(request.getParameter("page"));
				dto.setPage(page);
			}else {
				dto.setPage(page);
			}
			
				
			if(sel.equals("title")) {
				model.addAttribute("lists",dao.searchFileTitle(dto));
				maxPage = dao.fileTitleMaxPage(searchData);
					
			}else if(sel.equals("name")) {
				model.addAttribute("lists",dao.searchFileName(dto));
				maxPage = dao.fileNameMaxPage(searchData);
					
			}else if(sel.equals("content")) {
				model.addAttribute("lists",dao.searchFileContent(dto));
				maxPage = dao.fileContentMaxPage(searchData);
					
			}
			
		}else {
			maxPage = dao.fileMaxPage();
			if(request.getParameter("page") == null) {
				model.addAttribute("lists",dao.fileBoardList(page));
				
			}else {
				page=Integer.parseInt(request.getParameter("page"));
				model.addAttribute("lists",dao.fileBoardList(page));
				
			}
		}
		
		if(maxPage<10) {
			maxPage=1;
			model.addAttribute("maxPage",maxPage);
		}
		else if(maxPage>10 && maxPage/10!=0) {
			maxPage=(maxPage/10)+1;
			model.addAttribute("maxPage",maxPage);
		}else {
			maxPage=(maxPage/10);
			model.addAttribute("maxPage",maxPage);
		}
		
	}
	
	public void boardsave(Model model) {
		Map<String,Object> map = model.asMap();
		MultipartHttpServletRequest request =
				(MultipartHttpServletRequest)map.get("request");
		FileBoardDTO dto = new FileBoardDTO();
		dto.setName(request.getParameter("name"));
		dto.setTitle(request.getParameter("title"));
		dto.setContent(request.getParameter("content"));
		dao.boardsave(dto);
		
	}

	public void boardDelete(Model model) {
		
		Map<String,Object> map = model.asMap();
		HttpServletRequest request =
				(HttpServletRequest)map.get("request");
		String chk = (String)request.getParameter("chk");
		String file_path = "C:\\download\\";
		
		if(chk.equals("Y")) {
			List<FileBoardDTO> dto = dao.deleteFileList(request.getParameter("id"));
			int i = 0;
			while(i<dto.size()) {
				String file_name_key = dto.get(i++).getFile_name_key();
				System.out.println(file_name_key);
				File file = new File(file_path,file_name_key);
				file.delete();
			}
		}
		
		dao.deleteFile(request.getParameter("id"));
		dao.boardDelete(request.getParameter("id"));
		
	}

	public void boardupdate(Model model) {
		Map<String,Object> map = model.asMap();
		HttpServletRequest request =
				(HttpServletRequest)map.get("request");
		FileBoardDTO dto = new FileBoardDTO();
		dto.setName(request.getParameter("name"));
		dto.setTitle(request.getParameter("title"));
		dto.setContent(request.getParameter("content"));
		dao.fileBoardUpdate(dto);
	}

	public void fileModifyForm(Model model) {
		
		Map<String,Object> map = model.asMap();
		HttpServletRequest request =
				(HttpServletRequest)map.get("request");
		
		String id = request.getParameter("id");
		
		model.addAttribute("modify",dao.fileModifyForm(id));
		model.addAttribute("filemodify",dao.fileList(id));
	}

	
	public void multiFileup(Model model) throws IOException {		
		String rs = null;
		Map<String,Object> map = model.asMap();
		MultipartHttpServletRequest request =
				(MultipartHttpServletRequest)map.get("request");
		
		List<MultipartFile> fileList = request.getFiles("files");	
		String file_path = "C:\\download\\";
	
		FileBoardDTO dto =new FileBoardDTO();
		
		if(fileList.size()!=0) {
			dto.setFilechk("Y");
		}else{
			dto.setFilechk("N");
		}
		dto.setName(request.getParameter("name"));
		dto.setTitle(request.getParameter("title"));
		dto.setContent(request.getParameter("content"));
		
		int result = dao.boardsave(dto);
		
		if(fileList.size()!=0) {
			for(MultipartFile mf:fileList) {
				String filename = mf.getOriginalFilename();
				String ext = filename.substring(filename.lastIndexOf("."));
				long size = mf.getSize();
				String file_name_key= System.currentTimeMillis()+"";
				
				dto.setFile_name(filename);
				dto.setFile_ext(ext);
				dto.setFile_name_key(file_name_key);
				dto.setFile_size(size);
						
				dao.multiFileup(dto);
				
				Files.copy(mf.getInputStream(), Paths.get(file_path,file_name_key));
			}
		}
		
		if(result == 1) {
			rs="성공";
		}else {
			rs="실패";
		}
		
		model.addAttribute("rs", rs);
		
	}



	public void fileModify(Model model) throws IOException {
		String rs = null;
		
		Map<String,Object> map = model.asMap();
		MultipartHttpServletRequest request =
				(MultipartHttpServletRequest)map.get("request");
		
		List<MultipartFile> fileList = request.getFiles("files");
		
		String file_path = "C:\\download\\";
	
		FileBoardDTO dto =new FileBoardDTO();
		
		if(fileList.size()!=0) {
			dto.setFilechk("Y");
		}else{
			dto.setFilechk("N");
		}
		
		int id = Integer.parseInt(request.getParameter("id"));
		dto.setId(id);
		dto.setName(request.getParameter("name"));
		dto.setTitle(request.getParameter("title"));
		dto.setContent(request.getParameter("content"));
		
		int result = dao.fileModify(dto);
		
		if(result == 1) {
			rs="성공";
		}else {
			rs="실패";
		}

		
		if(fileList.size()!=0) {
			for(MultipartFile mf:fileList) {
				String filename = mf.getOriginalFilename();
				String ext = filename.substring(filename.lastIndexOf("."));
				long size = mf.getSize();
				String file_name_key= System.currentTimeMillis()+"";
				
				dto.setId(id);
				dto.setFile_name(filename);
				dto.setFile_ext(ext);
				dto.setFile_name_key(file_name_key);
				dto.setFile_size(size);
						
				dao.multiFileup(dto);
				
				Files.copy(mf.getInputStream(), Paths.get(file_path,file_name_key));
			}
		}
		
		model.addAttribute("rs",rs);
	}

	public void deleteModifyFile(Model model) {
		
		String rs = null;
		int result=0;
		
		FileBoardDTO dto = new FileBoardDTO();
		
		Map<String,Object> map = model.asMap();
		HttpServletRequest request =
				(HttpServletRequest)map.get("request");
		String[] list = (String[])map.get("deleteModifyFile");
		
		int id = Integer.parseInt(request.getParameter("id"));
	
		for(String a:list) {
			
			File file = new File("C:\\download\\"+a);
			// 서버에 담긴 파일 삭제
			file.delete();
			
			dto.setFile_name_key(a);
			dto.setId(id);
			
			// 디비에 담긴 파일 저장값 삭제
			if(dao.fileRemove(dto) == 1) {
				result++;
			}
		}
		
		int count = dao.fileCount(id);

		if(count==0) {
			// 디비에 저장된 파일 값이 없으면 file_board에 filechk 부분 N으로 수정
			dao.boardFileChkN(id);
		}else {
			// 디비에 저장된 파일 값이 없으면 file_board에 filechk 부분 Y으로 수정
			dao.boardFileChkY(id);
		}
			
		
		if(result==list.length) {
			rs = "성공";
		}else {
			rs = "삭제된 파일 수 : " + result+" / "+list.length;
		}
		
		model.addAttribute("rs",rs);
	
	}

	public void preFileBoardView(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request =
				(HttpServletRequest)map.get("request");
		
		int id = Integer.parseInt(request.getParameter("id"));
		
		if(dao.preFileBoardView(id)==null) {
			model.addAttribute("chk","end");
			model.addAttribute("id",id);
		}else {
			model.addAttribute("id",dao.preFileBoardView(id));
		}
		
	}

	public void nextFileBoardView(Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request =
				(HttpServletRequest)map.get("request");
		
		int id = Integer.parseInt(request.getParameter("id"));
		
		if(dao.nextFileBoardView(id)==null) {
			model.addAttribute("chk","end");
			model.addAttribute("id",id);
		}else {
			model.addAttribute("id",dao.nextFileBoardView(id));
		}
		
		
		
	}
	

}
