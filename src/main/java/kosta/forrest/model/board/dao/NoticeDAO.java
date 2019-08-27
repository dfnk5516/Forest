package kosta.forrest.model.board.dao;

import java.util.List;

import kosta.forrest.model.board.dto.NoticeDTO;


public interface NoticeDAO {
	
	List<NoticeDTO> selectAll(String option, String keyWord);
	
	int insert(NoticeDTO noticeDTO);
	
	int readnumUpdate(int noticeNo);

	NoticeDTO selectByNoticeNo(int noticeNo);

	int update(NoticeDTO noticeDTO);

	int delete(int noticeNo);
}
