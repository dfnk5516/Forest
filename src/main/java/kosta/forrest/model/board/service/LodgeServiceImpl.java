package kosta.forrest.model.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kosta.forrest.model.board.dao.LodgeDAO;
import kosta.forrest.model.board.dto.BookingDTO;
import kosta.forrest.model.board.dto.ForestDTO;
import kosta.forrest.model.board.dto.LodgeDTO;

@Service
public class LodgeServiceImpl implements LodgeService {

	@Autowired
	private LodgeDAO lodgeDAO;
	
	@Override
	public List<LodgeDTO> selectAll(int forestNo) {
		//System.out.println("LodgeServiceImpl의 selectAll");
		List<LodgeDTO> list = lodgeDAO.selectAll(forestNo);
		return list;
	}

	@Override
	public int insert(LodgeDTO ㅣodgeDTO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(String lodeCode) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override 
	public BookingDTO selectBookInfo(String lodgeCode) {
		BookingDTO bookingDTO = lodgeDAO.selectBookInfo(lodgeCode);
		return bookingDTO;
	}

	@Override
	public int bookingInsert(BookingDTO bookingDTO) {
		int result = lodgeDAO.bookingInsert(bookingDTO);
		if(result==0) throw new RuntimeException("등록되지 않았습니다.");
		return result;
	}

	@Override
	public List<BookingDTO> selectBookAll() {
		List<BookingDTO> list = lodgeDAO.selectBookAll();
		return list;
	}

	@Override
	public BookingDTO selectByBookingCode(int bookCode) {
		BookingDTO bookingDTO = lodgeDAO.selectByForestNo(bookCode);
		return bookingDTO;
	}


}
