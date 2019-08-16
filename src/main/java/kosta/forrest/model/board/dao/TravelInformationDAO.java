package kosta.forrest.model.board.dao;

import java.util.List;

import kosta.forrest.model.board.dto.ForestDTO;

public interface TravelInformationDAO
{
	List<ForestDTO> selectForestByCity(String city);
	List<String> selectForestByName(String text);
	List<String> selectCity();
	List<ForestDTO> selectForest();
}
		