package kosta.forrest.model.board.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kosta.forrest.model.board.dto.FaqDTO;

@Repository
public class FaqDAOImpl implements FaqDAO {
	
	@Autowired
	private SqlSession session;

	@Override
	public List<FaqDTO> selectAll(String option, String keyWord) {
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("option", option);
		map.put("keyWord", keyWord);
		return session.selectList("faqMapper.selectAll", map);
	}
	
}