package member.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import member.bean.LikeDTO;
import member.bean.MemberDTO;
import member.bean.MyblogDTO;
import member.bean.ZipcodeDTO;
import member.bean.FollowDTO;
import member.dao.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDAO memberDAO;
	
	@Autowired
	private HttpSession session;
	
	@Override
	public MemberDTO login(Map<String, String> map) {
		
		return memberDAO.login(map);
	}

	@Override
	public String checkId(String id) {
		
		MemberDTO memberDTO = memberDAO.checkId(id);
		
		if(memberDTO == null) {
			return "non_exist"; //사용가능
		}else {
			return "exist";
		}
	}

	@Override
	public List<ZipcodeDTO> postSearch(Map<String, String> map) {
		
		List<ZipcodeDTO> list = memberDAO.postSearch(map);
		
		return list;
	}

	@Override
	public void write(MemberDTO memberDTO) {
		memberDAO.write(memberDTO);
	}

	@Override
	public MemberDTO getMember(String id) {
		return memberDAO.checkId(id);
	}

	@Override
	public void modify(MemberDTO memberDTO) {
		memberDAO.modify(memberDTO);
	}

	@Override
	public List<MyblogDTO> infinityScroll(Map<String, Integer> map) {
		
		return memberDAO.infinityScroll(map);
	}

	@Override
	public void like(Map<String, String> map) {
		
		String id = (String) session.getAttribute("memName");
		
		map.put("id", id);
		
		memberDAO.like(map);
	}
	
	@Override
	public void unlike(Map<String, String> map) {
		
		String id = (String) session.getAttribute("memId");
		
		map.put("nickname", id);
		
		memberDAO.unlike(map);
	}
	
	@Override
	public List<LikeDTO> likeCheck() {
		
		String id = (String) session.getAttribute("memId");
		
		return memberDAO.likeCheck(id);
	}
}
