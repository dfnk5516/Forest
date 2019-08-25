package kosta.forrest.model.board.service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kosta.forrest.model.board.dao.TravelInformationDAO;
import kosta.forrest.model.board.dto.FestivalDTO;
import kosta.forrest.model.board.dto.ForestDTO;
import kosta.forrest.model.board.dto.SightsDTO;
import kosta.forrest.model.board.dto.VideoDTO;

@Service
public class TravelInformationServiceImpl implements TravelInformationService
{
	@Autowired
	private TravelInformationDAO dao;
////////////////////////////////////////////////////////////////////////
	@Override
	public List<String> selectCity()
	{
		return dao.selectCity();
	}
////////////////////////////////////////////////////////////////////////
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
////////////////////////////////////////////////////////////////////////
	@Override
	public int insertSights(SightsDTO dto)
	{
		return dao.insertSights(dto);
	}
	@Override
	public int insertFestival(FestivalDTO dto)
	{
		return dao.insertFestival(dto);
	}
	@Override
	public int insertVideo(VideoDTO dto)
	{
		return dao.insertVideo(dto);
	}
////////////////////////////////////////////////////////////////////////
	@Override
	public List<SightsDTO> selectSights()
	{
		List<SightsDTO> list = dao.selectSights();
		for(SightsDTO dto : list)
		{	
			dto.setSightsName(toJs(dto.getSightsName()));
			dto.setSightsRegion(toJs(dto.getSightsRegion()));
			dto.setSightsLocation(toJs(dto.getSightsLocation()));
			dto.setSightsDescription(toJs(dto.getSightsDescription()));
			dto.setSightsHomepage(toJs(dto.getSightsHomepage()));
			dto.setSightsLatitude(toJs(dto.getSightsLatitude()));
			dto.setSightsLongitude(toJs(dto.getSightsLongitude()));
		}
		
		return list;
	}
	
	@Override
	public List<FestivalDTO> selectFestival()
	{
		List<FestivalDTO> list = dao.selectFestival();
		for(FestivalDTO dto : list)
		{
			dto.setFestivalName(toJs(dto.getFestivalName()));
			dto.setFestivalLocation(toJs(dto.getFestivalLocation()));
			dto.setFestivalAddress(toJs(dto.getFestivalAddress()));
			dto.setFestivalDescription(toJs(dto.getFestivalDescription()));
			dto.setFestivalStart(toJs(dto.getFestivalStart()));
			dto.setFestivalEnd(toJs(dto.getFestivalEnd()));
			dto.setFestivalPhone(toJs(dto.getFestivalPhone()));
			dto.setFestivalAgency(toJs(dto.getFestivalAgency()));
			dto.setFestivalHomepage(toJs(dto.getFestivalHomepage()));
			dto.setFestivalLatitude(toJs(dto.getFestivalLatitude()));
			dto.setFestivalLongitude(toJs(dto.getFestivalLongitude()));
		}
		
		return list;
	}
	
	@Override
	public List<VideoDTO> selectVideo()
	{
		List<VideoDTO> list = dao.selectVideo();
		for(VideoDTO dto : list)
		{
			dto.setVideoName(toJs(dto.getVideoName()));
			dto.setVideoSrc(toJs(dto.getVideoSrc()));
		}
		
		return list;
	}
////////////////////////////////////////////////////////////////////////
	@Override
	public int deleteSights(String sightsName)
	{
		return dao.deleteSights(sightsName);
	}
	@Override
	public int deleteFestival(String festivalName)
	{
		return dao.deleteFestival(festivalName);
	}
	@Override
	public int deleteVideo(String videoName)
	{
		return dao.deleteVideo(videoName);
	}
////////////////////////////////////////////////////////////////////////
	public static String toJs(String str)
	{
		if(str != null)
		{
			return str.replaceAll("&", "&amp;")
			.replaceAll("<", "&lt;")
			.replaceAll(">", "&gt;")
			.replaceAll("((?<!\\\\)(\\\\\\\\)*)(\\\\\\\")", "$1&quot;")
			.replaceAll("'", "&#x27;")
			.replaceAll("/", "&#x2F;");
		}
		return null;
	}
////////////////////////////////////////////////////////////////////////
	@Override
	public int updateSights(SightsDTO sightsDTO, String selectedSightsName) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("sightsDTO", sightsDTO);
		map.put("selectedSightsName", selectedSightsName);
		return dao.updateSights(map);
	}
	
	@Override
	public int updateFestival(FestivalDTO festivalDTO, String selectedFestivalName) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("festivalDTO", festivalDTO);
		map.put("selectedFestivalName", selectedFestivalName);
		return dao.updateFestival(map);
	}
	
	@Override
	public int updateVideo(VideoDTO videoDTO, String selectedVideoName) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("videoDTO", videoDTO);
		map.put("selectedVideoName", selectedVideoName);
		return dao.updateVideo(map);
	}
	@Override
	public String searchImage(String keyword)
	{
		String clientId = "kDVo8uBXspw_GzF7ECYH";//애플리케이션 클라이언트 아이디값";
        String clientSecret = "ZZZytqspU2";//애플리케이션 클라이언트 시크릿값";
        try
        {
            String text = URLEncoder.encode(keyword, "UTF-8");
            String apiURL = "https://openapi.naver.com/v1/search/image?query="+ text; // json 결과
            //String apiURL = "https://openapi.naver.com/v1/search/blog.xml?query="+ text; // xml 결과
            URL url = new URL(apiURL);
            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            con.setRequestMethod("GET");
            con.setRequestProperty("X-Naver-Client-Id", clientId);
            con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
            int responseCode = con.getResponseCode();
            BufferedReader br;
            if(responseCode==200)// 정상 호출
            { 
            	//br = new BufferedReader(new InputStreamReader(con.getInputStream()));
            	br = new BufferedReader(new InputStreamReader(con.getInputStream(),"UTF-8"));
            }
            else // 에러 발생
            {  
                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
            }
            String inputLine;
            StringBuffer response = new StringBuffer();
            while ((inputLine = br.readLine()) != null)
            {
                response.append(inputLine);
            }
            br.close();
            System.out.println(response.toString());

            return response.toString();
        }
        catch (Exception e)
        {
            System.out.println(e);
        }
        return null;
	}
}
