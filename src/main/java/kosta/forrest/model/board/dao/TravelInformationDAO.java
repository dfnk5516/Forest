package kosta.forrest.model.board.dao;

import java.util.List;

import kosta.forrest.model.board.dto.FestivalDTO;
import kosta.forrest.model.board.dto.ForestDTO;
import kosta.forrest.model.board.dto.SightsDTO;
import kosta.forrest.model.board.dto.VideoDTO;

public interface TravelInformationDAO
{
	public List<ForestDTO> selectForestByCity(String city);
	public List<String> selectForestByName(String text);
	public List<String> selectCity();
	public List<ForestDTO> selectForest();
	public List<SightsDTO> selectSights();
	public List<FestivalDTO> selectFestival();
	public List<VideoDTO> selectVideo();
	public int insertSights(SightsDTO dto);
	public int insertFestival(FestivalDTO dto);
	public int insertVideo(VideoDTO dto);
	public int deleteVideo(String videoName);
	public int deleteFestival(String festivalName);
	public int deleteSights(String sightsName);
	
}
		