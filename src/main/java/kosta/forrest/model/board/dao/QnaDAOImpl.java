package kosta.forrest.model.board.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kosta.forrest.model.board.dto.QnaDTO;

@Repository
public class QnaDAOImpl implements QnaDAO {

	@Autowired
	private SqlSession sqlSession;
	
	
	/**
	 * 리스트 출력
	 * */
	@Override
	public List<QnaDTO> selectAll() {
		List<QnaDTO> list = sqlSession.selectList("qnaMapper.selectAll");
		System.out.println("list22 = " + list);
		return list;
	}
	
	@Override
	public QnaDTO selectByNo(int qnaNo) {
		return sqlSession.selectOne("qnaMapper.selectByNo", qnaNo);
	}

	
//	/**
//	 * 글 검색
//	 * */
//	@Override
//	public List<QnaDTO> selectBySearch(String keyWord, String keyField) {
//		Map<String, String> map = new HashMap<String, String>();
//		
//		if(keyField!=null) map.put("keyField", keyField);
//		if(keyWord!=null) map.put("keyWord",keyWord);
//		List<QnaDTO> list = sqlSession.selectList("qnaMapper.selectBySearch",map);
//		return list;
//	}
//	
//	@Override
//	public int qnaInsert(QnaDTO qnaDTO) {
//		return sqlSession.insert("qnaMapper.qnaInsert", qnaDTO);
//	}
//
//	@Override
//	public int answerUpdate(QnaDTO qnaDTO) {
//		return sqlSession.update("qnaMapper.answerUpdate", qnaDTO);
//	}
//
//	@Override
//	public int qnaUpdate(QnaDTO qnaDTO) {
//		return sqlSession.update("qnaMapper.qnaUpdate", qnaDTO);
//	}
//	
//	@Override
//	public int qnaDelete(int qnaNo) {
//		return sqlSession.delete("qnaMapper.qnaDelete", qnaNo);
//	}

}
