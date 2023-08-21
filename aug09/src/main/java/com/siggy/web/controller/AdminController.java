package com.siggy.web.controller;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.siggy.web.service.AdminService;
import com.siggy.web.util.Util;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private AdminService adminService;

	@Autowired
	private Util util;

	@GetMapping("/admin")
	public String adminIndex() {
		return "admin/index";
	}

	@PostMapping(value={"/","/login"})
	public String adminLogin(@RequestParam Map<String, Object> map, HttpSession session) {
		Map<String, Object> result = adminService.adminLogin(map);

		System.out.println(util.obj2Int(result.get("m_grade")));
		if (util.obj2Int(result.get("count")) == 1 && util.obj2Int(result.get("m_grade")) > 5) {
			System.out.println("!");
			session.setAttribute("id", map.get("id"));
			session.setAttribute("mname", result.get("m_name"));
			session.setAttribute("mgrade", result.get("m_grade"));

			return "redirect:/admin/main";
		} else {

			return "redirect:/admin/admin?error=login";
		}

	}
	
	@GetMapping("/main")
	public String main() {
		return "admin/main";
	}

	
	@GetMapping("/notice")
	public String notice(Model model) {
		List<Map<String, Object>>list = adminService.notice();
		
		model.addAttribute("list", list);
		
		return "admin/notice";
	}
	
	@PostMapping("/noticeWrite")
	public String noticeWrite(@RequestParam("upFile") MultipartFile upfile, @RequestParam Map<String, Object>map) {
		map.put("mno", 1);
		map.put("upFile", upfile);
		
		
		if (upfile.getSize()>0) {
			//저장할 경로명 뽑기 request뽑기
	         HttpServletRequest request = 
	         ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
	         
	         String path = request.getServletContext().getRealPath("/upload");
	         System.out.println("실제 경로" + path);
	         
			//upfile정보보기
			System.out.println(upfile.getOriginalFilename());
			System.out.println(upfile.getSize());
			System.out.println(upfile.getContentType());
			File newfileName = new File(upfile.getOriginalFilename());
			
		}
		//adminService.noticeWrite(map);
		
		
		return "redirect:/admin/notice";
	}
	
	
	
	
	
}
