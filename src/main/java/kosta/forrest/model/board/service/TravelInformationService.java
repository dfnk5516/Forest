package kosta.forrest.model.board.service;

import java.util.List;

import kosta.forrest.model.board.dto.ForestDTO;

public interface TravelInformationService
{
	public List<String> selectCity();
	public List<ForestDTO> selectForestByCity(String city);
	public List<String> selectForestByName(String text);
	public List<ForestDTO> selectForest();
}
