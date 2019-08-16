package kosta.forrest.model.board.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class FaqDTO {
	private int faqNo;
	private String faqId;
	private String faqTitle;
	private String faqContent;
	private String faqImg;
	private String faqDate;
}
