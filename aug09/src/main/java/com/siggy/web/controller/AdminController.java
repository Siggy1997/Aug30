package com.siggy.web.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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

}
