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
	public List<VideoDTO> selectVideo();
	public List<SightsDTO> selectSights();
	public int insertSights(SightsDTO dto);
	public List<FestivalDTO> selectFestival();
	public int deleteSights(String sightsName);
	public int deleteFestival(String festivalName);
	public int deleteVideo(String videoName);
}
