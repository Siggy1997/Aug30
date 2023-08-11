package com.siggy.web.controller;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.siggy.web.dto.BoardDTO;
import com.siggy.web.service.BoardService;

@Controller
public class LoginController {
	
	
	@GetMapping("/login.sik")
	public String index() {
		return "login";
	}
	
	@GetMapping("/join")
	public String join() {
		return "join";
	}
	

}
