package kosta.forrest.model.board.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class NoticeDTO {
	private int noticeNo;
	private String noticeId;
	private String noticeTitle;
	private String noticeContent;
	private String noticeImg;
	private String noticeDate;
	private int noticeReadnum;
	private String noticeFname;
	private long noticeFsize;
	
	
	private MultipartFile file;
	
	
}
