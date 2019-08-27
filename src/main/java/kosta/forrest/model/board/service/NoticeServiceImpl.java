package kosta.forrest.model.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kosta.forrest.model.board.dao.NoticeDAO;
import kosta.forrest.model.board.dto.NoticeDTO;



@Service
public class NoticeServiceImpl implements NoticeService{
	
	@Autowired
	private NoticeDAO noticeDAO;

	@Override
	public List<NoticeDTO> selectAll(String option, String keyWord) {
		return noticeDAO.selectAll(option, keyWord);
	}
	
	
	@Override
	public int insert(NoticeDTO noticeDTO) {
		int result = noticeDAO.insert(noticeDTO);
		if(result==0)throw new RuntimeException("등록되지 않았습니다.");
		return result;
	}


	@Override
	public NoticeDTO selectByNoticeNo(int noticeNo, boolean b) {
		if(b) {
			int result = noticeDAO.readnumUpdate(noticeNo);
			if(result==0)throw new RuntimeException("조회수증가 오류로 실패하였습니다.");
		}
		
		NoticeDTO NoticeDTO =noticeDAO.selectByNoticeNo(noticeNo);
		if(NoticeDTO==null)throw new RuntimeException("게시물 검색에 오류가 발생했습니다.");
		return NoticeDTO;
	}


	@Override
	public int update(NoticeDTO noticeDTO) {
		int result = noticeDAO.update(noticeDTO);
		if(result==0)throw new RuntimeException("수정되지 않았습니다.");
		return result;
	}
	
	
	@Override
	public int delete(int noticeNo) {
		int result = noticeDAO.delete(noticeNo);
		if(result==0)throw new RuntimeException("삭제되지 않았습니다.");
		return result;
	}

}