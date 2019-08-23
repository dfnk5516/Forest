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
	public List<SightsDTO> selectSights();
	public List<FestivalDTO> selectFestival();
	public List<VideoDTO> selectVideo();
	public int insertSights(SightsDTO dto);
	public int insertFestival(FestivalDTO dto);
	public int insertVideo(VideoDTO dto);
	public int deleteSights(String sightsName);
	public int deleteFestival(String festivalName);
	public int deleteVideo(String videoName);
	int updateSights(SightsDTO dto, String selectedSightsName);
	int updateVideo(VideoDTO videoDTO, String selectedVideoName);
	int updateFestival(FestivalDTO festivalDTO, String selectedFestivalName);
}
