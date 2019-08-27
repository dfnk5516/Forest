package kosta.forrest.model.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kosta.forrest.model.board.dao.FaqDAO;
import kosta.forrest.model.board.dto.FaqDTO;

@Service
public class FaqServiceImpl implements FaqService{
	
	@Autowired
	private FaqDAO faqDAO;

	@Override
	public List<FaqDTO> selectAll(int start, int end, String option, String keyWord) {
		return faqDAO.selectAll(start, end, option, keyWord);
	}

	@Override
	public int countArticle(String option, String keyWord) {
		return faqDAO.countArticle(option, keyWord);
	}

	@Override
	public int faqInsert(FaqDTO faqDTO) {
		int result = faqDAO.faqInsert(faqDTO);
		if(result==0)throw new RuntimeException("등록되지 않았습니다.");
		return result;
	}

	@Override
	public int faqDelete(int faqNo) {
		int result = faqDAO.faqDelete(faqNo);
		if(result==0)throw new RuntimeException("삭제되지 않았습니다.");
		return result;
	}

	@Override
	public int faqUpdate(FaqDTO faqDTO) {
			//faqDAO.selectByModelNum(faqDTO.getFaqNo());
			int result = faqDAO.faqUpdate(faqDTO);
			if(result==0)throw new RuntimeException("수정되지 않았습니다.");
			return result;
	}

}