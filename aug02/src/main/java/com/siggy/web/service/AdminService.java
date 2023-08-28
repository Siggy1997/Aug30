package com.siggy.web.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.siggy.web.dao.AdminDAO;

@Service
public class AdminService {

	@Autowired
	private AdminDAO adminDAO;

	public Map<String, Object> adminLogin(Map<String, Object> map) {
		return adminDAO.adminLogin(map);
	}

	public List<Map<String, Object>> list() {
		return adminDAO.list();
	}

	public void noticeWrite(Map<String, Object> map) {
		adminDAO.noticeWrite(map);
	}

	public String noticeDetail(int nno) {
		return adminDAO.noticeDetail(nno);
	}

	public int noticeHide(Map<String, Object> map) {
		return adminDAO.noticeHide(map);
	}

	public List<Map<String, Object>> multiBoard() {
		return adminDAO.multiBoard();
	}

	public int multiBoardInsert(Map<String, Map> map) {
		return adminDAO.multiBoardInsert(map);
	}

	public List<Map<String, Object>> memberList() {
		// TODO Auto-generated method stub
		return adminDAO.memberList();
	}

	public int gradeChange(Map<String, String> map) {
		return adminDAO.gradeChange(map);
	}

	public List<Map<String, Object>> post(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return adminDAO.post(map); 
	}

	public List<Map<String, Object>> boardList() {
		return adminDAO.boardList();
	}

	public Object content(int mbno) {
		return adminDAO.content(mbno);
	} 




}
