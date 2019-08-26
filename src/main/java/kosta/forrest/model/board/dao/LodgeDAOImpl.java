package kosta.forrest.model.board.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kosta.forrest.model.board.dto.BookingDTO;
import kosta.forrest.model.board.dto.LodgeDTO;

@Repository
public class LodgeDAOImpl implements LodgeDAO {

	@Autowired
	private SqlSession session;
	
	@Override
	public List<LodgeDTO> selectAll(int forestNo) {
		//System.out.println("LodgeDAOImpl¿« selectAll");
		List<LodgeDTO> list = session.selectList("forestMapper.lodgeAll",forestNo);
		return list;
	}

	@Override
	public int insert(LodgeDTO lodgeDTO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(String LodgeCode) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public BookingDTO selectBookInfo(String lodgeCode) {
		BookingDTO bookingDTO = session.selectOne("forestMapper.selectBookInfo", lodgeCode);
		return bookingDTO;
	}

}
