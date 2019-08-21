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
public class FestivalDTO {
	private String festivalName;
	private String city;
	private String festivalLocation;
	private String festivalAddress;
	private String festivalDescription;
	private String festivalStart;
	private String festivalEnd;
	private String festivalPhone;
	private String festivalAgency;
	private String festivalHomepage;
	private double festivalLatitude;
	private double festivalLongitude;
}