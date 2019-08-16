package kosta.forrest.model.board.service;

import java.util.List;

import kosta.forrest.model.board.dto.FaqDTO;

public interface FaqService {
	
	/**
	 * 전체출력 - 조건검색
	 */
	List<FaqDTO> selectAll(String option, String keyWord);
}
