package kosta.forrest.model.board.dto;

import org.springframework.web.multipart.MultipartFile;

import kosta.forrest.model.user.dto.UserDTO;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class QnaDTO {
	private int qnaNo;
	private String qnaPlace;
	private String qnaId;
	private String qnaSecret;
	private String qnaTitle;
	private String qnaContent;
	private String qnaAnswer;//qnaAnswer
	private String writeDay;
	
	private UserDTO userDTO;
	
	
	




	
	
}
