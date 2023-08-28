package com.siggy.web.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AdminDAO {

	Map<String, Object> adminLogin(Map<String, Object> map);

	List<Map<String, Object>> list();

	void noticeWrite(Map<String, Object> map);


	String noticeDetail(int nno);

	int noticeHide(Map<String, Object> map);

	List<Map<String, Object>> multiBoard();

	int multiBoardInsert(Map<String, Map> map);

	List<Map<String, Object>> memberList();

	int gradeChange(Map<String, String> map);

	List<Map<String, Object>> post(Map<String, Object> map);

	List<Map<String, Object>> boardList();

	Object content(int mbno);





}
