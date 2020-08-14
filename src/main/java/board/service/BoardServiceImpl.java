package board.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.commons.collections4.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import board.bean.BoardDTO;
import board.bean.BoardPaging;
import board.dao.BoardDAO;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDAO boardDAO;
	@Autowired
	private HttpSession session;
	@Autowired
	private BoardPaging boardPaging;
	
	@Override
	public void boardWrite(Map<String, String> map) {
		
		map.put("id", (String) session.getAttribute("memId"));
		map.put("name", (String) session.getAttribute("memName"));
		map.put("email", (String) session.getAttribute("memEmail"));
		
		boardDAO.boardWrite(map);
	}

	@Override
	public List<BoardDTO> getBoardList(String pg) {
		
		int endNum = Integer.parseInt(pg) * 5;
		int startNum = endNum - 4;
		
		Map<String, Integer> map = new HashedMap<String, Integer>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		
		return boardDAO.getBoardList(map);
	}

	@Override
	public BoardPaging boardPaging(String pg) {
		
		//총글수
		int totalA = boardDAO.getBoardTotalA();
		
		boardPaging.setCurrentPage(Integer.parseInt(pg));
		boardPaging.setPageBlock(3);
		boardPaging.setPageSize(5);
		boardPaging.setTotalA(totalA);
		boardPaging.makePagingHTML();
		
		return boardPaging;
	}

	@Override
	public List<BoardDTO> boardSearch(Map<String, String> map) {
		
		int endNum = Integer.parseInt(map.get("pg")) * 5;
		int startNum = endNum - 4;
		
		map.put("startNum", startNum+"");
		map.put("endNum", endNum+"");
		
		return boardDAO.boardSearch(map);
	}

	@Override
	public BoardPaging boardPaging(Map<String, String> map) {
		
		//검색한 총 글수
		int totalA = boardDAO.getBoardSearchTotalA(map);
		
		boardPaging.setCurrentPage(Integer.parseInt(map.get("pg")));
		boardPaging.setPageBlock(3);
		boardPaging.setPageSize(5);
		boardPaging.setTotalA(totalA);
		boardPaging.makePagingHTML();
		
		return boardPaging;
	}

	@Override
	public BoardDTO getBoard(String seq) {
		
		return boardDAO.getBoard(seq);
	}

	@Override
	public void boardReply(Map<String, String> map) {
		
		//원글
		BoardDTO pDTO = boardDAO.getBoard(map.get("pseq"));
		
		//map에 pseq, pg, subject, content
		map.put("id", (String) session.getAttribute("memId"));
		map.put("name", (String) session.getAttribute("memName"));
		map.put("email", (String) session.getAttribute("memEmail"));
		map.put("ref", pDTO.getRef()+""); //원글의 그룹번호
		map.put("lev", pDTO.getLev()+""); //원글의 lev+1
		map.put("step", pDTO.getStep()+""); //원글의 step+1
		
		boardDAO.boardReply(map);
		
	}

	@Override
	public void boardModify(Map<String, Object> map) {
		boardDAO.boardModify(map);
	}

	@Override
	public void boardDelete(String seq) {
		boardDAO.boardDelete(seq);
	}

	@Override
	public void hitUp(String seq) {
		boardDAO.hitUp(seq);
	}

}
















