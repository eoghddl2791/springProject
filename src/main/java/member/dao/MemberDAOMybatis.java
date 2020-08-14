package member.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import member.bean.LikeDTO;
import member.bean.MemberDTO;
import member.bean.MyblogDTO;
import member.bean.ZipcodeDTO;
import member.bean.FollowDTO;

@Repository
@Transactional
public class MemberDAOMybatis implements MemberDAO {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public MemberDTO login(Map<String, String> map) {
		
		MemberDTO memberDTO = sqlSession.selectOne("memberSQL.login", map);
		
		return memberDTO;
	}

	@Override
	public MemberDTO checkId(String id) {
		
		
		return sqlSession.selectOne("memberSQL.checkId", id);
	}

	@Override
	public List<ZipcodeDTO> postSearch(Map<String, String> map) {
		
		List<ZipcodeDTO> list = sqlSession.selectList("memberSQL.postSearch", map);
		System.out.println(list.size());
		
		return list;
	}

	@Override
	public void write(MemberDTO memberDTO) {
		sqlSession.insert("memberSQL.write", memberDTO);
	}

	@Override
	public void modify(MemberDTO memberDTO) {
		sqlSession.update("memberSQL.modify", memberDTO);
	}

	@Override
	public List<MyblogDTO> infinityScroll(Map<String, Integer> map) {
		
		return sqlSession.selectList("memberSQL.infinityScroll", map);
	}

	@Override
	public void like(Map<String, String> map) {
		
		sqlSession.insert("memberSQL.like", map);
	}
	
	@Override
	public void unlike(Map<String, String> map) {
		
		sqlSession.delete("memberSQL.unlike", map);
	}
	
	@Override
	public List<LikeDTO> likeCheck(String id) {
		
		List<LikeDTO> list = null;
		
		list = sqlSession.selectList("memberSQL.likeCheck", id);
		
		return list;
	}
}
