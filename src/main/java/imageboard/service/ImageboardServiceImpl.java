package imageboard.service;

import java.util.List;
import java.util.Map;

import org.apache.commons.collections4.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import imageboard.bean.ImageboardDTO;

import imageboard.dao.ImageboardDAO;



@Service
public class ImageboardServiceImpl implements ImageboardService {
	
	@Autowired
	private ImageboardDAO imageboardDAO;

	@Override
	public void imageboardWrite(ImageboardDTO imageboardDTO) {
		imageboardDAO.imageboardWrite(imageboardDTO);
	}

	@Override
	public List<ImageboardDTO> getImageboardList(String pg) {
		//1페이지당 3개씩
		int endNum = Integer.parseInt(pg) * 3;
		int startNum = endNum - 2;
		
		Map<String, Integer> map = new HashedMap<String, Integer>();
		map.put("endNum", endNum);
		map.put("startNum", startNum);
		
		return imageboardDAO.getImageboardList(map);
	}

}
