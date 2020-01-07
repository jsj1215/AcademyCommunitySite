package com.care.fileboard_controller;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.bind.annotation.ResponseBody;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.care.fileboard_service.FileBoardService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.care.fileboard_dto.FileBoardDTO; 

@Controller
public class FileBoardController {
	
	@Autowired
	FileBoardService service;
	
	@RequestMapping("fileBoardList")
	public String fileBoardList(Model model,HttpServletRequest request) {
		
		model.addAttribute("request",request);
		service.fileBoardList(model);
		
		return "fileBoard/file_board_list";
	}
	
	@RequestMapping("fileBoardSave")
	public String fileBoardSave() {
		System.out.println();
		return "fileBoard/file_board_save";
		
	}
	

	@RequestMapping("boardrealsave")
	public String boardrealsave(Model model, HttpServletRequest request){
		model.addAttribute("request",request);
		service.boardsave(model);
		return "redirect:fileBoardList";
	}
	
	@RequestMapping("boardview")
	public String boardview() {
		
		return "fileBoard/file_board_list";
	}
	
	@RequestMapping("boardDelete")
	public String boardDelete(Model model,HttpServletRequest request) {
		
		model.addAttribute("request",request);
		service.boardDelete(model);
		
		return "redirect:fileBoardList";
	}
	
	@RequestMapping(value="boardupdate",
				produces="application/json;charset=utf-8")
	public String updateboard(Model model,HttpServletRequest request) {
		model.addAttribute("request",request);
		service.boardupdate(model);	
		
		return "redirect:fileBoardList";
	}
	
	@RequestMapping("fileView")
	public String fileView(Model model,HttpServletRequest request) {
		
		
		
		model.addAttribute("request",request);
		service.fileModifyForm(model);		
		
		return "fileBoard/file_board_view";
	}
	
	@RequestMapping(value = "fileUpload", method = RequestMethod.GET, 
			produces="application/json;charset=utf-8")
	public String fileUpload()
	{
		return "fileUpload";
	}
	
	//업로드 처리 : POST
	@RequestMapping(value = "fileUpload", method = RequestMethod.POST, 
			produces="application/json;charset=utf-8")
	@ResponseBody
	public String fileUpload(MultipartHttpServletRequest request, 
			Model model) throws IOException{
		
		model.addAttribute("request",request);
		service.multiFileup(model);
		
		Map<String, Object> map = model.asMap();
		String rs = (String)map.get("rs");
		
		if(rs.equals("성공")) {
			return "{\"result\":1}";
		}else {
			return "{\"result\":0}";
		}
	}
 
	
	@RequestMapping("fileDown")
	public String fileDown(HttpServletResponse response,HttpServletRequest request) throws IOException {
		
		String file_name = request.getParameter("file_name");
		String file_name_key = request.getParameter("file_name_key");
		
		 byte[] fileByte = FileUtils.readFileToByteArray(new
		 File("C:\\download\\"+file_name_key));
		  
		  response.setContentType("application/octet-stream");
		  response.setContentLength(fileByte.length);
		  response.setHeader("Content-Disposition", "attachment; fileName=\"" +
		  URLEncoder.encode(file_name,"UTF-8")+"\";");
		  response.setHeader("Content-Transfer-Encoding", "binary");
		  response.getOutputStream().write(fileByte);
		  
		  response.getOutputStream().flush(); response.getOutputStream().close();
		 
		
		return "file_board_view";
	}
	
	@RequestMapping("fileup")
	public String fileup() {
		
		return "fileup";
	}
	
	@RequestMapping("boardModify")
	public String boardModify(Model model, HttpServletRequest request) {
		
		
		model.addAttribute("request",request);
		service.fileModifyForm(model);
		
		return "fileBoard/file_board_modify";
	}
	
	
	@RequestMapping(value = "fileModify", method = RequestMethod.POST, 
			produces="application/json;charset=utf-8")
	@ResponseBody
	public String fileModify(MultipartHttpServletRequest request, 
			Model model) throws IOException{
		
		model.addAttribute("request",request);
		service.fileModify(model);
		
		Map<String, Object> map = model.asMap();
		String rs = (String) map.get("rs");
		
		if(rs.equals("성공")) {
			return "{\"result\":1}";
		}else {
			return "{\"result\":0}";
		}
	}
	
	
	@RequestMapping(value = "deleteModifyFile", method = RequestMethod.POST, 
			produces="application/json;charset=utf-8")
	@ResponseBody
	public String deleteModifyFile(HttpServletRequest request, 
			Model model,String[] deleteModifyFile) throws IOException{
		
		model.addAttribute("request",request);
		model.addAttribute("deleteModifyFile",deleteModifyFile);
		service.deleteModifyFile(model);
		
		Map<String, Object> map = model.asMap();
		String data = (String)map.get("rs");
		System.out.println(data);
		return data;

	}
	
	@RequestMapping("preFileBoardView")
	public String preFileBoardView(Model model, HttpServletRequest request) {
		
		model.addAttribute("request",request);
		service.preFileBoardView(model);
		
		return "redirect:fileView";
	}
	
	@RequestMapping("nextFileBoardView")
	public String nextFileBoardView(Model model, HttpServletRequest request) {
		
		model.addAttribute("request",request);
		service.nextFileBoardView(model);
		
		return "redirect:fileView";
	}
	
	
}
