package kosta.forrest.model.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kosta.forrest.model.board.dao.QnaDAO;
import kosta.forrest.model.board.dto.QnaDTO;

@Service
public class QnaServiceImpl implements QnaService {
	
	@Autowired
	private QnaDAO qnaDAO;
	
	@Override
	public List<QnaDTO> selectAll() {
		return qnaDAO.selectAll();
	}
//
//	@Override
//	public List<QnaDTO> selectByQnaName(String nameKeyword) {
//		return qnaDAO.selectByQnaName(nameKeyword);
//	}
//
//	@Override
//	public List<QnaDTO> selectByQnaTitle(String titleKeyword) {
//		return qnaDAO.selectByQnaTitle(titleKeyword);
//	}
//
//	@Override
//	public List<QnaDTO> selectOne(int qnaNo) {
//		return qnaDAO.selectOne(qnaNo);
//	}
//
//	@Override
//	public int qnaInsert(QnaDTO qnaDTO) {
//		int result = qnaDAO.qnaInsert(qnaDTO);
//		if(result==0) throw new RuntimeException("질문이 등록되지 않았습니다.");
//		return result;
//	}
//
//	@Override
//	public int answerUpdate(QnaDTO qnaDTO) {
//		int result =  qnaDAO.answerUpdate(qnaDTO);
//		if(result==0) throw new RuntimeException("답변이 등록되지 않았습니다.");
//		return result;
//	}
//
//	@Override
//	public int qnaUpdate(QnaDTO qnaDTO) {
//		int result =  qnaDAO.qnaUpdate(qnaDTO);
//		if(result==0) throw new RuntimeException("수정되지 않았습니다.");
//		return result;
//	}
//
//	@Override
//	public int qnaDelete(int qnaNo) {
//		int result = qnaDAO.qnaDelete(qnaNo);
//		if(result==0) throw new RuntimeException("삭제되지 않았습니다.");
//		return result;
//	}

}
