package kosta.forrest.model.board.service;

import java.util.List;

import kosta.forrest.model.board.dto.NoticeDTO;

public interface NoticeService {
	
	List<NoticeDTO> selectAll(String option, String keyWord);

	int insert(NoticeDTO noticeDTO);

	int update(NoticeDTO noticeDTO);

	int delete(int noticeNo);

	NoticeDTO selectByNoticeNo(int parseInt, boolean b);


}
