package kosta.forrest.model.board.dao;

import java.util.List;

import kosta.forrest.model.board.dto.QnaDTO;

public interface QnaDAO {
	
	/**
	 * 리스트 출력
	 * */
	List<QnaDTO> selectAll();

	
	/**
	 * 글 상세보기
	 * */
	QnaDTO selectByNo(int qnaNo);
	
	
//	/**
//	 * 글 검색 
//	 * */
//	List<QnaDTO> selectBySearch(String keyWord, String keyField);
//	
	
//	/**
//	 * 질문 등록
//	 * */
//	int qnaInsert(QnaDTO qnaDTO);
	
//	/**
//	 * 답변 등록
//	 * */
//	int answerUpdate(QnaDTO qnaDTO);
//	
//	/**
//	 * 질문 수정
//	 * */
//	int qnaUpdate(QnaDTO qnaDTO);
//	
//	/**
//	 * 질문 삭제
//	 * */
//	int qnaDelete(int qnaNo);
	
}
