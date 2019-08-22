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
	public List<FaqDTO> selectAll(int start, int end, String option, String keyWord) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("option", option);
		map.put("keyWord", keyWord);
		return session.selectList("faqMapper.selectAll", map);
	}

	@Override
	public int countArticle(String option, String keyWord) {
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("option", option);
		map.put("keyWord", keyWord);
		return session.selectOne("faqMapper.countArticle", map);
	}
	
}