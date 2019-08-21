package kosta.forrest.model.board.service;

import java.util.List;

import kosta.forrest.model.board.dto.FestivalDTO;
import kosta.forrest.model.board.dto.ForestDTO;
import kosta.forrest.model.board.dto.SightsDTO;
import kosta.forrest.model.board.dto.VideoDTO;

public interface TravelInformationService
{
	public List<String> selectCity();
	public List<ForestDTO> selectForestByCity(String city);
	public List<String> selectForestByName(String text);
	public List<ForestDTO> selectForest();
	List<VideoDTO> selectVideo();
	public List<SightsDTO> selectSightsAll();
	int insertSights(SightsDTO dto);
	List<FestivalDTO> festivalSelectAll();
	List<VideoDTO> videoSelectAll();
}
