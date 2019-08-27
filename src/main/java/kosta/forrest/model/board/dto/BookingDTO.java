package kosta.forrest.model.board.dto;

import org.springframework.web.multipart.MultipartFile;

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
public class BookingDTO {

	private int forestNo;
	private String forestFilename;
	private String forestName;
	private String forestType;
	private String forestAddr;
	private String forestTel;
	private String forestFacil;
	private String forestWriter;
	private String forestUrl;
	
	private String lodgeCode;
	private String lodgeName;
	private int lodgePrice;
	private String lodgeAddr;
	private String lodgeTel;
	private String lodgeWriter;
	private String lodgeFilename;
	
	private String bookCode;
	private String startDate;
	private String endDate;
	private int peopleNum;
	private String bookDate;
	private String bookId;
	
}


