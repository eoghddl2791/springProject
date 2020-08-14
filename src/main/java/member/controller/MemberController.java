package member.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import member.bean.LikeDTO;
import member.bean.MemberDTO;
import member.bean.MyblogDTO;
import member.bean.ZipcodeDTO;
import member.bean.FollowDTO;
import member.service.MemberService;

@Controller
@RequestMapping("member")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value="login", method = RequestMethod.POST)
	public @ResponseBody String login(@RequestParam Map<String, String> map, HttpSession session) {
		
		MemberDTO memberDTO = memberService.login(map);
		
		String loginFail = null;
		if(memberDTO == null) {
			loginFail = "fail";
		}else {
			session.setAttribute("memName", memberDTO.getName());
			session.setAttribute("memId", memberDTO.getId());
			session.setAttribute("memEmail", memberDTO.getEmail1()+"@"+memberDTO.getEmail2());
			
			loginFail = "success";
		}
		
		return loginFail;
	}
	
	@RequestMapping(value="logout", method = RequestMethod.GET)
	public ModelAndView logout(HttpSession session, Model model) {
		
		session.invalidate();
		
		return new ModelAndView("redirect:/main/index");
	}
	
	@RequestMapping(value="writeForm", method = RequestMethod.GET)
	public String writeForm(Model model) {
		
		model.addAttribute("display", "/member/writeForm.jsp");
		
		return "/main/index";
	}
	
	@RequestMapping(value="checkId", method = RequestMethod.POST)
	public @ResponseBody String checkId(@RequestParam String id) {
		
		return memberService.checkId(id);
	}
	
	@RequestMapping(value="checkPost", method = RequestMethod.GET)
	public String checkPost() {
		
		return "/member/checkPost";
	}
	
	@RequestMapping(value="postSearch", method = RequestMethod.POST)
	public @ResponseBody ModelAndView postSearch(@RequestParam Map<String, String> map){
		
		System.out.println(map.get("sido")+","+map.get("sigungu")+","+map.get("roadname"));
		
		List<ZipcodeDTO> list = memberService.postSearch(map);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("jsonView");
		
		return mav;
	}
	
	@RequestMapping(value="write", method = RequestMethod.POST)
	public String write(@ModelAttribute MemberDTO memberDTO, Model model) {
		
		memberService.write(memberDTO);
		
		model.addAttribute("display", "/member/write.jsp");
		
		return "/main/index";
	}
	
	@RequestMapping(value="modifyForm", method = RequestMethod.GET)
	public String modifyForm(HttpSession session, Model model) {
		
		String id = (String) session.getAttribute("memId");
		MemberDTO memberDTO = memberService.getMember(id);
		
		model.addAttribute("memberDTO", memberDTO);
		model.addAttribute("display", "/member/modifyForm.jsp");
		
		return "/main/index";
	}
	
	@RequestMapping(value="modify", method = RequestMethod.POST)
	public @ResponseBody void modify(@ModelAttribute MemberDTO memberDTO) {
		
		memberService.modify(memberDTO);
		
	}
	
	@RequestMapping(value="mypage", method = RequestMethod.GET)
	public String mypage() {
		
		return "../member/mypage";
	}
	
	@RequestMapping(value="mypageInfi", method = RequestMethod.POST)
	public ModelAndView mypageInfi(Model model, int pg) {
		System.out.println("infinityScroll 실행됨"+pg);
		int endNum = pg * 9;
		int startNum = endNum - 8;
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("endNum", endNum);
		map.put("startNum", startNum);

		List <MyblogDTO> list = memberService.infinityScroll(map);
		System.out.println(list.size());
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.addObject("pg", pg);
		mav.setViewName("jsonView");
		
		return mav;
	}
	
	@RequestMapping(value="like", method = RequestMethod.POST)
	@ResponseBody
	public void like(@RequestParam Map<String, String> map) {
		
		memberService.like(map);
		
	}
	
	@RequestMapping(value="unlike", method = RequestMethod.POST)
	@ResponseBody
	public void unlike(@RequestParam Map<String, String> map) {
		
		memberService.unlike(map);
		
	}
	
	@RequestMapping(value="likeCheck", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView likeCheck() {
		
		List<LikeDTO> list = memberService.likeCheck();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("jsonView");
		
		return mav;
	}
	

}
