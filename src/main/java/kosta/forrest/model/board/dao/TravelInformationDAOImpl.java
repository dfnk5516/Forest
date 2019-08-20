package kosta.forrest.model.board.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kosta.forrest.model.board.dto.ForestDTO;
import kosta.forrest.model.board.dto.SightsDTO;
import kosta.forrest.model.board.dto.VideoDTO;

@Repository
public class TravelInformationDAOImpl implements TravelInformationDAO
{
	@Autowired
	private SqlSession session;
	
	@Override
	public List<ForestDTO> selectForestByCity(String city)
	{
		List<ForestDTO> list = new ArrayList<ForestDTO>();
		list = session.selectList("travelInformationMapper.selectForestByCity", city);
		for(ForestDTO dto : list)
		{
			System.out.println(dto);
		}
		return list;
	}
	
	@Override
	public List<String> selectForestByName(String text)
	{
		List<String> list = new ArrayList<String>();
		list = session.selectList("travelInformationMapper.selectForestByName", text);
		return list;
	}
	
	@Override
	public List<String> selectCity()
	{
		
		List<String> list = new ArrayList<String>();
		list = session.selectList("travelInformationMapper.selectCity");
		
		return list;
	}

	@Override
	public List<ForestDTO> selectForest()
	{
		List<ForestDTO> list = new ArrayList<ForestDTO>();
		list = session.selectList("travelInformationMapper.selectForest");
		return list;
	}
	
	@Override
	public List<VideoDTO> selectVideo()
	{
		List<VideoDTO> list = new ArrayList<VideoDTO>();
		list = session.selectList("travelInformationMapper.selectVideo");
		return list;
	}
	
	@Override
	public List<SightsDTO> selectAll() {
		
		List<SightsDTO> list = new ArrayList<SightsDTO>();
		list = session.selectList("travelInformationMapper.selectSights");
		
		return list;
	}

	@Override
	public List<String> selectSightsName() {
		List<String> list = new ArrayList<String>();
		list = session.selectList("travelInformationMapper.selectSightsName");
		return list;
	}
	
	@Override
	public int insertSights(SightsDTO dto) {
		
		int a =  session.insert("travelInformationMapper.sightsInsert", dto);
		System.out.println(a);
		return a;
	}
}
