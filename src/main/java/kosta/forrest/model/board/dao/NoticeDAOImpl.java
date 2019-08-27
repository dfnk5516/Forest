package kosta.forrest.model.board.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kosta.forrest.model.board.dto.NoticeDTO;



@Repository
public class NoticeDAOImpl implements NoticeDAO {
	
	@Autowired	
	private SqlSessionTemplate sqlSession;

	@Override
	public List<NoticeDTO> selectAll(String option, String keyWord) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("option", option);
		map.put("keyWord", keyWord);
		
		return sqlSession.selectList("noticeMapper.selectAll", map);
	}
	@Override
	public int insert(NoticeDTO noticeDTO) {
		return sqlSession.insert("noticeMapper.noticeInsert" , noticeDTO);
	}
	@Override
	public int readnumUpdate(int noticeNo) {
		
		return sqlSession.update("noticeMapper.readnumUpdate" , noticeNo);
	}
	@Override
	public NoticeDTO selectByNoticeNo(int noticeNo) {
		return sqlSession.selectOne("noticeMapper.selectByNoticeNo" , noticeNo);
	}
	@Override
	public int update(NoticeDTO noticeDTO) {
		return sqlSession.update("noticeMapper.noticeUpdate", noticeDTO);
	}
	
	@Override
	public int delete(int noticeNo) {
	
		return sqlSession.delete("noticeMapper.delete", noticeNo);
	}
}