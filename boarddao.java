package com.jip.dao;

import java.util.*;

import com.jip.dto.BoardDto;

public interface BoardDao {
	public List<BoardDto> getList(int pageNum);
	public BoardDto getContents(Integer bnum);
	public int getBoardCount();
	public boolean boardInsert(BoardDto board);
}

