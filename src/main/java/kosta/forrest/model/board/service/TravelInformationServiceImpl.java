package kosta.forrest.model.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kosta.forrest.model.board.dao.TravelInformationDAO;
import kosta.forrest.model.board.dto.ForestDTO;
import kosta.forrest.model.board.dto.VideoDTO;

@Service
public class TravelInformationServiceImpl implements TravelInformationService
{
	@Autowired
	private TravelInformationDAO dao;

	@Override
	public List<String> selectCity()
	{
		return dao.selectCity();
	}

	@Override
	public List<ForestDTO> selectForestByCity(String city)
	{
		return dao.selectForestByCity(city);
	}

	@Override
	public List<String> selectForestByName(String text)
	{
		return dao.selectForestByName(text);
	}

	@Override
	public List<ForestDTO> selectForest()
	{
		return dao.selectForest();
	}
	
	@Override
	public List<VideoDTO> selectVideo()
	{
		return dao.selectVideo();
	}
}
