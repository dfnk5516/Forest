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
	public List<FaqDTO> selectAll(String option, String keyWord) {
		return faqDAO.selectAll(option, keyWord);
	}

}