package com.siggy.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.siggy.web.dao.BoardDAO;
import com.siggy.web.dto.BoardDTO;

@Service
public class BoardService {

	@Autowired BoardDAO boardDAO;

	public List<BoardDTO> boardList() {
		return boardDAO.boardList();
	}

	public String detail(int bno) {
		return boardDAO.detail(bno);
	}
}
