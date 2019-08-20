package kosta.forrest.model.board.dto;

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
public class SightsDTO {
	private String sightsName;
	private String city;
	private String sightsRegion;
	private String sightsDescription;
	private String sightsLocation;
	private String sightsHomepage;
	private String sightsLatitude;
	private String sightsLongitude;
}


