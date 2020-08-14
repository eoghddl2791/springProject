package member.service;

import java.util.List;
import java.util.Map;

import member.bean.LikeDTO;
import member.bean.MemberDTO;
import member.bean.MyblogDTO;
import member.bean.ZipcodeDTO;
import member.bean.FollowDTO;

public interface MemberService {

	public MemberDTO login(Map<String, String> map);

	public String checkId(String id);

	public List<ZipcodeDTO> postSearch(Map<String, String> map);

	public void write(MemberDTO memberDTO);

	public MemberDTO getMember(String id);

	public void modify(MemberDTO memberDTO);

	public List<MyblogDTO> infinityScroll(Map<String, Integer> map);

	public void like(Map<String, String> map);

	public void unlike(Map<String, String> map);

	public List<LikeDTO> likeCheck();


}
