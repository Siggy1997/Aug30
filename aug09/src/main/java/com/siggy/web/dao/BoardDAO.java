package com.siggy.web.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.siggy.web.dto.BoardDTO;

@Repository
@Mapper
public interface BoardDAO {
	List<BoardDTO> boardList();
}