package kosta.forrest.model.board.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class SightsDTO {
	private String sightsName;
	private String city;
	private String sightsRegion;
	private String sightsDescription;
	private String sightsLocation;
	private String sightsHomepage;
	private double sightsLatitude;
	private double sightsLongitude;
}


