package com.care.calendar_service;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import com.care.calendar_dto.TestDTO;
import java.util.*;

@Service
public class TestService {
	
	@Autowired
	private com.care.calendar_dao.TestDAO dao;
	
	public void updatedata(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		HttpSession session = request.getSession();
		String name = (String) session.getAttribute("sid");
		for(int i = 6; i < 13; i++) {
			for(int z = 1; z < 32; z++) {		
				if(i == 6) {
						
						String month = String.valueOf(i);
						String day = String.valueOf(z);
						String attend = request.getParameter(month + day);
						TestDTO dto = new TestDTO();	
						
						if(attend == null) {
							
						} else {
							dto.setName(name);
							dto.setAttend(attend);
							dto.setMonth(month);
							dto.setDay(day);
							dao.updatedata(dto);
					}
				}else if(i == 7) {
					
					String month = String.valueOf(i);
					String day = String.valueOf(z);
					String attend = request.getParameter(month + day);
					TestDTO dto = new TestDTO();	
					
					if(attend == null) {
						
					} else {
						dto.setName(name);
						dto.setName(name);
						dto.setAttend(attend);
						dto.setMonth(month);
						dto.setDay(day);
						dao.updatedata(dto);
					}
				}else if(i == 8) {
					
					String month = String.valueOf(i);
					String day = String.valueOf(z);
					String attend = request.getParameter(month + day);
					TestDTO dto = new TestDTO();	
					
					if(attend == null) {
						
					} else {
						dto.setName(name);
						dto.setAttend(attend);
						dto.setMonth(month);
						dto.setDay(day);
						dao.updatedata(dto);
					}
				}else if(i == 9) {
					
					String month = String.valueOf(i);
					String day = String.valueOf(z);
					String attend = request.getParameter(month + day);
					TestDTO dto = new TestDTO();	
					
					if(attend == null) {
						
					} else {
						dto.setName(name);
						dto.setAttend(attend);
						dto.setMonth(month);
						dto.setDay(day);
						dao.updatedata(dto);
					}
				}else if(i == 10) {
					
					String month = String.valueOf(i);
					String day = String.valueOf(z);
					String attend = request.getParameter(month + day);
					TestDTO dto = new TestDTO();	
					
					if(attend == null) {
						
					} else {
						dto.setName(name);
						dto.setAttend(attend);
						dto.setMonth(month);
						dto.setDay(day);
						dao.updatedata(dto);
					}
				}else if(i == 11) {
					
					String month = String.valueOf(i);
					String day = String.valueOf(z);
					String attend = request.getParameter(month + day);
					TestDTO dto = new TestDTO();	
					
					if(attend == null) {
						
					} else {
						dto.setName(name);
						dto.setAttend(attend);
						dto.setMonth(month);
						dto.setDay(day);
						dao.updatedata(dto);
					}
				}else if(i == 12) {
					
					String month = String.valueOf(i);
					String day = String.valueOf(z);
					String attend = request.getParameter(month + day);
					TestDTO dto = new TestDTO();	
					
					if(attend == null) {
						
					} else {
						dto.setName(name);
						dto.setAttend(attend);
						dto.setMonth(month);
						dto.setDay(day);
						dao.updatedata(dto);
					}
				}				
			}		
		}			
	}		
	
	public void getjun(Model model) {		
		TestDTO dto = new TestDTO();	
		Map<String,Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		HttpSession session = request.getSession();
		String name = (String) session.getAttribute("sid");
		
		ArrayList<TestDTO> b = (ArrayList<TestDTO>)dao.getjun(name);
		System.out.println(b.size());
		for(TestDTO d:b) {
			
		}

		model.addAttribute("result",b);
		
	}

	public void getjuly(Model model) {	
		TestDTO dto = new TestDTO();	
		Map<String,Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		HttpSession session = request.getSession();
		String name = (String) session.getAttribute("sid");
		
		ArrayList<TestDTO> b = (ArrayList<TestDTO>)dao.getjuly(name);
		System.out.println(b.size());
		for(TestDTO d:b) {
	
		}
		model.addAttribute("result", b);
	}

	public void getaug(Model model) {	
		TestDTO dto = new TestDTO();	
		Map<String,Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		HttpSession session = request.getSession();
		String name = (String) session.getAttribute("sid");
		
		ArrayList<TestDTO> b = (ArrayList<TestDTO>)dao.getaug(name);
		System.out.println(b.size());
		for(TestDTO d:b) {

		}
		model.addAttribute("result", b);
	}
	
	public void getsep(Model model) {	
		TestDTO dto = new TestDTO();	
		Map<String,Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		HttpSession session = request.getSession();
		String name = (String) session.getAttribute("sid");
		
		ArrayList<TestDTO> b = (ArrayList<TestDTO>)dao.getsep(name);
		System.out.println(b.size());
		for(TestDTO d:b) {
	
		}
		model.addAttribute("result", b);
	}	
	
	public void getoct(Model model) {	
		TestDTO dto = new TestDTO();	
		Map<String,Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		HttpSession session = request.getSession();
		String name = (String) session.getAttribute("sid");	
		
		ArrayList<TestDTO> b = (ArrayList<TestDTO>)dao.getoct(name);
		System.out.println(b.size());
		for(TestDTO d:b) {
	
		}
		model.addAttribute("result", b);
	}
	
	public void getnov(Model model) {	
		TestDTO dto = new TestDTO();	
		Map<String,Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		HttpSession session = request.getSession();
		String name = (String) session.getAttribute("sid");	
		
		ArrayList<TestDTO> b = (ArrayList<TestDTO>)dao.getnov(name);
		System.out.println(b.size());
		for(TestDTO d:b) {
		
		}
		model.addAttribute("result", b);
	}
	
	public void getdec(Model model) {	
		TestDTO dto = new TestDTO();	
		Map<String,Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		HttpSession session = request.getSession();
		String name = (String) session.getAttribute("sid");	
		
		ArrayList<TestDTO> b = (ArrayList<TestDTO>)dao.getdec(name);
		System.out.println(b.size());
		for(TestDTO d:b) {
	
		}
		model.addAttribute("result", b);
	}
	
	
	public void savadata(Model model) {
		Map<String,Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		String mydate = request.getParameter("mydate");
		String month = mydate.substring(5, 7);
		String day = mydate.substring(8);	
		
		System.out.println("달 " +month);
		System.out.println("날 " + day);		
		TestDTO dto = new TestDTO();
		dto.setAttend(request.getParameter("attend"));
		dto.setMonth(month);
		dto.setDay(day);
		dao.savedata(dto);
		//System.out.println("나오나?");
		
	}
	
	public void junCal(Model model) {
		Map<String,Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		HttpSession session = request.getSession();
		String name = (String) session.getAttribute("sid");
		
		for(int i = 1; i < 32; i++) {
			if(i < 10) {
				String date = "060" + i;
				String month = date.substring(0,2);
				String day = date.substring(2);	
				String mydate = "2019060" + i;			
				String attend = request.getParameter("6"+i);
				System.out.println("달은 : " + month + "일은? "+day);
				TestDTO dto = new TestDTO();	
				
				if(attend == null) {
					
				} else {
					dto.setName(name);
					dto.setAttend(request.getParameter("6"+i));
					dto.setMonth(month);
					dto.setDay(day);
					dto.setMydate(mydate);
					System.out.println("달은 : " + month + "일은? "+day);
					dao.savedata(dto);
					
				}
				
			}else {
				System.out.println("???????");
				String date = "06" + i;
				String month = date.substring(0,2);
				String day = date.substring(2);	
				String mydate = "201906" + i;
				String attend = request.getParameter("6"+i);
				System.out.println("달은 : " + month + "일은? "+day);
				TestDTO dto = new TestDTO();
				if(attend == null) {
					
				} else {
					dto.setName(name);
					dto.setAttend(request.getParameter("6"+i));
					dto.setMonth(month);
					dto.setDay(day);
					dto.setMydate(mydate);
					dao.savedata(dto);
				}				
			}
		}
	}	
	
	public void julyCal(Model model) {
		Map<String,Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		HttpSession session = request.getSession();
		String name = (String) session.getAttribute("sid");
		
		for(int i = 1; i < 32; i++) {
			if(i < 10) {
				String date = "070" + i;
				String month = date.substring(0,2);
				String day = date.substring(2);	
				String mydate = "2019070" + i;			
				String attend = request.getParameter("7"+i);
				//System.out.println("달은 : " + month + "일은? "+day);
				TestDTO dto = new TestDTO();	
				
				if(attend == null) {
					
				} else {
					dto.setName(name);
					dto.setAttend(request.getParameter("7"+i));
					dto.setMonth(month);
					dto.setDay(day);
					dto.setMydate(mydate);
					dao.savedata(dto);
					
				}
				
			}else {
				String date = "07" + i;
				String month = date.substring(0,2);
				String day = date.substring(2);	
				String mydate = "201907" + i;
				String attend = request.getParameter("7"+i);
				System.out.println(attend);
				TestDTO dto = new TestDTO();
				if(attend == null) {
					
				} else {
					dto.setName(name);
					dto.setAttend(request.getParameter("7"+i));
					dto.setMonth(month);
					dto.setDay(day);
					dto.setMydate(mydate);
					dao.savedata(dto);
				}				
			}
		}
	}

	public void augCal(Model model) {
		Map<String,Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		HttpSession session = request.getSession();
		String name = (String) session.getAttribute("sid");
		
		for(int i = 1; i < 31; i++) {
			if(i < 10) {
				String date = "080" + i;
				String month = date.substring(0,2);
				String day = date.substring(2);	
				String mydate = "2019080" + i;			
				String attend = request.getParameter("8"+i);
				//System.out.println("달은 : " + month + "일은? "+day);
				TestDTO dto = new TestDTO();	
				
				if(attend == null) {
					
				} else {
					dto.setName(name);
					dto.setAttend(request.getParameter("8"+i));
					dto.setMonth(month);
					dto.setDay(day);
					dto.setMydate(mydate);
					dao.savedata(dto);
					
				}
				
			}else {
				String date = "08" + i;
				String month = date.substring(0,2);
				String day = date.substring(2);	
				String mydate = "201908" + i;
				String attend = request.getParameter("8"+i);
				System.out.println(attend);
				TestDTO dto = new TestDTO();
				if(attend == null) {
					
				} else {
					dto.setName(name);
					dto.setAttend(request.getParameter("8"+i));
					dto.setMonth(month);
					dto.setDay(day);
					dto.setMydate(mydate);
					dao.savedata(dto);
				}				
			}
		}	
	}
	
	public void sepCal(Model model) {
		Map<String,Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		HttpSession session = request.getSession();
		String name = (String) session.getAttribute("sid");
		
		for(int i = 1; i < 32; i++) {
			if(i < 10) {
				String date = "090" + i;
				String month = date.substring(0,2);
				String day = date.substring(2);	
				String mydate = "2019090" + i;			
				String attend = request.getParameter("9"+i);
				//System.out.println("달은 : " + month + "일은? "+day);
				TestDTO dto = new TestDTO();	
				
				if(attend == null) {
					
				} else {
					dto.setName(name);
					dto.setAttend(request.getParameter("9"+i));
					dto.setMonth(month);
					dto.setDay(day);
					dto.setMydate(mydate);
					dao.savedata(dto);
					
				}
				
			}else {
				String date = "09" + i;
				String month = date.substring(0,2);
				String day = date.substring(2);	
				String mydate = "201909" + i;
				String attend = request.getParameter("9"+i);
				System.out.println(attend);
				TestDTO dto = new TestDTO();
				if(attend == null) {
					
				} else {
					dto.setName(name);
					dto.setAttend(request.getParameter("9"+i));
					dto.setMonth(month);
					dto.setDay(day);
					dto.setMydate(mydate);
					dao.savedata(dto);
				}				
			}
		}
	}	

	public void octCal(Model model) {
		Map<String,Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		HttpSession session = request.getSession();
		String name = (String) session.getAttribute("sid");
		
		for(int i = 1; i < 32; i++) {
			if(i < 10) {
				String date = "100" + i;
				String month = date.substring(0,2);
				String day = date.substring(2);	
				String mydate = "2019100" + i;			
				String attend = request.getParameter("10"+i);
				//System.out.println("달은 : " + month + "일은? "+day);
				TestDTO dto = new TestDTO();	
				
				if(attend == null) {
					
				} else {
					dto.setName(name);
					dto.setAttend(request.getParameter("10"+i));
					dto.setMonth(month);
					dto.setDay(day);
					dto.setMydate(mydate);
					dao.savedata(dto);
					
				}
				
			}else {
				String date = "10" + i;
				String month = date.substring(0,2);
				String day = date.substring(2);	
				String mydate = "201910" + i;
				String attend = request.getParameter("10"+i);
				System.out.println(attend);
				TestDTO dto = new TestDTO();
				if(attend == null) {
					
				} else {
					dto.setName(name);
					dto.setAttend(request.getParameter("10"+i));
					dto.setMonth(month);
					dto.setDay(day);
					dto.setMydate(mydate);
					dao.savedata(dto);
				}				
			}
		}
	}

	public void novCal(Model model) {
		Map<String,Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		HttpSession session = request.getSession();
		String name = (String) session.getAttribute("sid");
		
		for(int i = 1; i < 32; i++) {
			if(i < 10) {
				String date = "110" + i;
				String month = date.substring(0,2);
				String day = date.substring(2);	
				String mydate = "2019110" + i;			
				String attend = request.getParameter("11"+i);
				//System.out.println("달은 : " + month + "일은? "+day);
				TestDTO dto = new TestDTO();	
				
				if(attend == null) {
					
				} else {
					dto.setName(name);
					dto.setAttend(request.getParameter("11"+i));
					dto.setMonth(month);
					dto.setDay(day);
					dto.setMydate(mydate);
					dao.savedata(dto);
					
				}
				
			}else {
				String date = "11" + i;
				String month = date.substring(0,2);
				String day = date.substring(2);	
				String mydate = "201911" + i;
				String attend = request.getParameter("11"+i);
				System.out.println(attend);
				TestDTO dto = new TestDTO();
				if(attend == null) {
					
				} else {
					dto.setName(name);
					dto.setAttend(request.getParameter("11"+i));
					dto.setMonth(month);
					dto.setDay(day);
					dto.setMydate(mydate);
					dao.savedata(dto);
				}				
			}
		}
	}

	public void decCal(Model model) {
		Map<String,Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		HttpSession session = request.getSession();
		String name = (String) session.getAttribute("sid");
		
		for(int i = 1; i < 32; i++) {
			if(i < 10) {
				String date = "120" + i;
				String month = date.substring(0,2);
				String day = date.substring(2);	
				String mydate = "2019120" + i;			
				String attend = request.getParameter("12"+i);
				//System.out.println("달은 : " + month + "일은? "+day);
				TestDTO dto = new TestDTO();	
				
				if(attend == null) {
					
				} else {
					dto.setName(name);
					dto.setAttend(request.getParameter("12"+i));
					dto.setMonth(month);
					dto.setDay(day);
					dto.setMydate(mydate);
					dao.savedata(dto);
					
				}
				
			}else {
				String date = "12" + i;
				String month = date.substring(0,2);
				String day = date.substring(2);	
				String mydate = "201912" + i;
				String attend = request.getParameter("12"+i);
				System.out.println(attend);
				TestDTO dto = new TestDTO();
				if(attend == null) {
					
				} else {
					dto.setName(name);
					dto.setAttend(request.getParameter("12"+i));
					dto.setMonth(month);
					dto.setDay(day);
					dto.setMydate(mydate);
					dao.savedata(dto);
				}				
			}
		}
	}
}
