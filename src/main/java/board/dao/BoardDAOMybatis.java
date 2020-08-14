package board.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import board.bean.BoardDTO;

@Repository
@Transactional
public class BoardDAOMybatis implements BoardDAO{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void boardWrite(Map<String, String> map) {
		sqlSession.insert("boardSQL.boardWrite", map);
	}

	@Override
	public List<BoardDTO> getBoardList(Map<String, Integer> map) {
		
		List<BoardDTO> list = null;
		
		list = sqlSession.selectList("boardSQL.getBoardList", map);
		
		return list;
		
		
	}

	@Override
	public int getBoardTotalA() {
		return sqlSession.selectOne("boardSQL.getBoardTotalA");
	}

	@Override
	public List<BoardDTO> boardSearch(Map<String, String> map) {
		
		return sqlSession.selectList("boardSQL.boardSearch", map);
	}

	@Override
	public int getBoardSearchTotalA(Map<String, String> map) {
		
		return sqlSession.selectOne("boardSQL.getBoardSearchTotalA", map);
	}

	@Override
	public BoardDTO getBoard(String seq) {
		
		return sqlSession.selectOne("boardSQL.getBoard", Integer.parseInt(seq));
	}

	@Override
	public void boardReply(Map<String, String> map) {
		sqlSession.insert("boardSQL.boardReply", map);
	}

	@Override
	public void boardModify(Map<String, Object> map) {
		sqlSession.update("boardSQL.boardModify", map);
	}

	@Override
	public void boardDelete(String seq) {
		sqlSession.delete("boardSQL.boardDelete", Integer.parseInt(seq));
	}

	@Override
	public void hitUp(String seq) {
		sqlSession.update("boardSQL.hitUp", Integer.parseInt(seq));
	}
	
}
