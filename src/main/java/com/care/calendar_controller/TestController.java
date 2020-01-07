package com.care.calendar_controller;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class TestController {
	@Autowired
	com.care.calendar_service.TestService service;
	
	@RequestMapping("mapTest")
	public String mapTest() {
		return "mapTest";
	}
	
	@RequestMapping("junCal_result")
	public String junCal_result(Model model, HttpServletRequest request) {
		model.addAttribute("request", request);
		service.getjun(model);
		return "calendar/junCal_result";
	}
	
	@RequestMapping("julyCal_result")
	public String julyCal_result(Model model, HttpServletRequest request) {
		model.addAttribute("request", request);
		service.getjuly(model);
		return "calendar/julyCal_result";
	}

	@RequestMapping("augCal_result")
	public String augCal_result(Model model, HttpServletRequest request) {
		model.addAttribute("request", request);
		service.getaug(model);
		return "calendar/augCal_result";
	}

	@RequestMapping("sepCal_result")
	public String sepCal_result(Model model, HttpServletRequest request) {
		model.addAttribute("request", request);
		service.getsep(model);
		return "calendar/sepCal_result";
	}

	@RequestMapping("octCal_result")
	public String octCal_result(Model model, HttpServletRequest request) {
		model.addAttribute("request", request);
		service.getoct(model);
		return "calendar/octCal_result";
	}
	
	@RequestMapping("novCal_result")
	public String novCal_result(Model model, HttpServletRequest request) {
		model.addAttribute("request", request);
		service.getnov(model);
		return "calendar/novCal_result";
	}
	
	@RequestMapping("decCal_result")
	public String decCal_result(Model model, HttpServletRequest request) {
		model.addAttribute("request", request);
		service.getdec(model);
		return "calendar/decCal_result";
	}	
	
	// ------------------- 출석입력 달력들 -------------------	
	
	@RequestMapping("juntest")
	public String juntest(Model model, HttpServletRequest request) {
		model.addAttribute("request", request);
		service.junCal(model);
		return "redirect:junCal_result";
	}

	@RequestMapping("julytest")
	public String julytest(Model model, HttpServletRequest request) {
		model.addAttribute("request", request);
		service.julyCal(model);
		return "redirect:julyCal_result";
	}	
	
	@RequestMapping("augtest")
	public String augtest(Model model, HttpServletRequest request) {
		model.addAttribute("request", request);
		service.augCal(model);
		return "redirect:augCal_result";
	}

	@RequestMapping("septest")
	public String septest(Model model, HttpServletRequest request) {
		model.addAttribute("request", request);
		service.sepCal(model);
		return "redirect:sepCal_result";
	}
	
	@RequestMapping("octtest")
	public String octtest(Model model, HttpServletRequest request) {
		model.addAttribute("request", request);
		service.octCal(model);
		return "redirect:octCal_result";
	}

	@RequestMapping("novtest")
	public String novtest(Model model, HttpServletRequest request) {
		model.addAttribute("request", request);
		service.novCal(model);
		return "redirect:novCal_result";
	}
	
	@RequestMapping("dectest")
	public String dectest(Model model,HttpServletRequest request) {
		model.addAttribute("request", request);	
		service.decCal(model);
		return "redirect:decCal_result";
	}	

	// ------------------- insert 달력들 ------------------- 
	
	@RequestMapping("junCal")
	public String junCal(Model model, HttpServletRequest request) {
		model.addAttribute("request", request);
		service.getjun(model);
		return "calendar/junCal";
	}	
	
	@RequestMapping("julyCal")
	public String julyCal(Model model, HttpServletRequest request) {
		model.addAttribute("request", request);
		service.getjuly(model);
		return "calendar/julyCal";
	}
	
	@RequestMapping("augCal")
	public String augCal(Model model, HttpServletRequest request) {
		model.addAttribute("request", request);
		service.getaug(model);
		return "calendar/augCal";
	}	

	@RequestMapping("sepCal")
	public String sepCal(Model model, HttpServletRequest request) {
		model.addAttribute("request", request);
		service.getsep(model);
		return "calendar/sepCal";
	}		
	
	@RequestMapping("octCal")
	public String octCal(Model model, HttpServletRequest request) {
		model.addAttribute("request", request);
		service.getoct(model);
		return "calendar/octCal";
	}	
	
	@RequestMapping("novCal")
	public String novCal(Model model, HttpServletRequest request) {
		model.addAttribute("request", request);
		service.getnov(model);
		return "calendar/novCal";
	}	
	@RequestMapping("decCal")
	public String decCal(Model model, HttpServletRequest request) {
		model.addAttribute("request", request);
		service.getdec(model);
		return "calendar/decCal";
	}	
	
	// ------------------- update 달력들 ------------------- 
	
	@RequestMapping("junCal_update")
	public String junCalupdate(Model model, HttpServletRequest request) {
		model.addAttribute("request", request);
		service.getjun(model);
		return "calendar/junCal_update";
	}	
	@RequestMapping("julyCal_update")
	public String julyCalupdate(Model model, HttpServletRequest request) {
		model.addAttribute("request", request);
		service.getjuly(model);
		return "calendar/julyCal_update";
	}
	@RequestMapping("augCal_update")
	public String augCalupdate(Model model, HttpServletRequest request) {
		model.addAttribute("request", request);
		service.getaug(model);
		return "calendar/augCal_update";
	}
	@RequestMapping("sepCal_update")
	public String sepCalupdate(Model model, HttpServletRequest request) {
		model.addAttribute("request", request);
		service.getsep(model);
		return "calendar/sepCal_update";
	}
	@RequestMapping("octCal_update")
	public String octCalupdate(Model model, HttpServletRequest request) {
		model.addAttribute("request", request);
		service.getoct(model);
		return "calendar/octCal_update";
	}
	@RequestMapping("novCal_update")
	public String novCalupdate(Model model, HttpServletRequest request) {
		model.addAttribute("request", request);
		service.getnov(model);
		return "calendar/novCal_update";
	}
	@RequestMapping("decCal_update")
	public String decCalupdate(Model model, HttpServletRequest request) {
		model.addAttribute("request", request);
		service.getdec(model);
		return "calendar/decCal_update";
	}
	
	@RequestMapping("junupdate")
	public String junupdate(Model model, HttpServletRequest request) {
		model.addAttribute("request", request);
		service.updatedata(model);
		return "redirect:junCal_result";
	}	
	@RequestMapping("julyupdate")
	public String julyupdate(Model model, HttpServletRequest request) {
		model.addAttribute("request", request);
		service.updatedata(model);
		return "redirect:julyCal_result";
	}
	@RequestMapping("augupdate")
	public String augupdate(Model model, HttpServletRequest request) {
		model.addAttribute("request", request);
		service.updatedata(model);
		return "redirect:augCal_result";
	}
	@RequestMapping("sepupdate")
	public String sepupdate(Model model, HttpServletRequest request) {
		model.addAttribute("request", request);
		service.updatedata(model);
		return "redirect:sepCal_result";
	}
	@RequestMapping("octupdate")
	public String octupdate(Model model, HttpServletRequest request) {
		model.addAttribute("request", request);
		service.updatedata(model);
		return "redirect:octCal_result";
	}
	@RequestMapping("novupdate")
	public String novupdate(Model model, HttpServletRequest request) {
		model.addAttribute("request", request);
		service.updatedata(model);
		return "redirect:novCal_result";
	}
	@RequestMapping("decupdate")
	public String decupdate(Model model, HttpServletRequest request) {
		model.addAttribute("request", request);
		service.updatedata(model);
		return "redirect:decCal_result";
	}
	
	
	
	
}
