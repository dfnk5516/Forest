package kosta.forrest.model.board.dao;

import java.util.List;
import java.util.Map;

import kosta.forrest.model.board.dto.BookingDTO;
import kosta.forrest.model.board.dto.ForestDTO;
import kosta.forrest.model.board.dto.LodgeDTO;

public interface LodgeDAO{

	List<LodgeDTO> selectAll(int forestNo) ;

	int insert(LodgeDTO lodgeDTO);
	
	/**
	 * 예약폼이동
	 */
	BookingDTO selectBookInfo(String lodgeCode);

	int delete(String LodgeCode);
}
