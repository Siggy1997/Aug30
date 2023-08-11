package com.siggy.web.service;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.siggy.web.dao.BoardDAO;
import com.siggy.web.dto.BoardDTO;
import com.siggy.web.util.Util;

@Service
public class BoardService {
	@Autowired
	private BoardDAO boardDAO;
	
	@Autowired
	private Util util;

	public List<BoardDTO> boardList() {
		return boardDAO.boardList();
	}

	public BoardDTO detail(int bno) {
		
		boardDAO.readUP(bno);
		
		return boardDAO.detail(bno);
		
	}

	public int write(BoardDTO dto) {
		dto.setBip(util.getIp());
		dto.setUuid(UUID.randomUUID().toString());
		return boardDAO.write(dto);
	}
	
}
