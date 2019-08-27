package kosta.forrest.model.board.dao;

import java.util.List;

import kosta.forrest.model.board.dto.FaqDTO;

public interface FaqDAO {
	
	/**
	 * 전체출력 - 조건검색
	 */
	List<FaqDTO> selectAll(int start, int end, String option, String keyWord);
	
	/**
	 * 카운트
	 */
	int countArticle(String option, String keyWord);
	
	/**
	 * 레코드 삽입
	 * */
	int faqInsert(FaqDTO faqDTO);
	  
    /**
     * 모델번호에 해당하는 레코드 삭제
     */
	int faqDelete(int faqNo);
	  
	/**
	 * 모델번호에 해당하는 레코드 수정
	 */
	int faqUpdate(FaqDTO faqDTO);
}
