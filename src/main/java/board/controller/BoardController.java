package board.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import board.bean.BoardDTO;
import board.bean.BoardPaging;
import board.service.BoardService;

@Controller
@RequestMapping(value = "board")
public class BoardController {

	@Autowired
	private BoardService boardService;

	@RequestMapping(value = "boardWriteForm", method = RequestMethod.GET)
	public String boardWriteForm(Model model) {

		model.addAttribute("display", "/board/boardWriteForm.jsp");

		return "/main/index";
	}

	@RequestMapping(value = "boardWrite", method = RequestMethod.POST)
	public String board(@RequestParam Map<String, String> map, Model model) {

		boardService.boardWrite(map);

		model.addAttribute("display", "/board/boardWrite.jsp");

		return "/main/index";
	}

	@RequestMapping(value = "boardList", method = RequestMethod.GET)
	public String boardList(@RequestParam(required = false, defaultValue = "1") String pg, Model model) {
		// required = false는 값이 안들어올수도 있다라는 의미이고 defaultValue="1"은 만약에 값이 안들어오면
		// default값을 지정해준다.

		model.addAttribute("pg", pg);
		model.addAttribute("display", "/board/boardList.jsp");

		return "/main/index";

	}

	@RequestMapping(value = "getBoardList", method = RequestMethod.POST)
	public @ResponseBody ModelAndView getBoardList(@RequestParam(required = false, defaultValue = "1") String pg,
			HttpSession session, HttpServletResponse response) {

		String memId = (String) session.getAttribute("memId");
		
		//쿠키
		if(memId != null) {
			Cookie cookie = new Cookie("memHit", "ok");
			cookie.setMaxAge(30*60);//30분
			cookie.setPath("/"); // 외부에서 들어오는 사람한테는 쿠키가 생성안되기때문에 써준다.
			response.addCookie(cookie);//클라이언트에 보내기
		}

		List<BoardDTO> list = boardService.getBoardList(pg);
		
		ModelAndView mav = new ModelAndView();
			
		// 페이징 처리
		BoardPaging boardPaging = boardService.boardPaging(pg);

		mav.addObject("pg", pg);
		mav.addObject("list", list);
		mav.addObject("boardPaging", boardPaging);
		mav.addObject("memId", memId);
		mav.setViewName("jsonView");

		return mav;
	}

	@RequestMapping(value = "boardSearch", method = RequestMethod.POST)
	public @ResponseBody ModelAndView boardSearch(@RequestParam Map<String, String> map) {

		System.out.println(map.get("search") + ", " + map.get("keyword"));
		List<BoardDTO> list = boardService.boardSearch(map);

		BoardPaging boardPaging = boardService.boardPaging(map);

		ModelAndView mav = new ModelAndView();
		mav.addObject("pg", map.get("pg"));
		mav.addObject("list", list);
		mav.addObject("search", map.get("search"));
		mav.addObject("keyword", map.get("keyword"));
		mav.addObject("boardPaging", boardPaging);
		mav.setViewName("jsonView");

		return mav;
	}

	@RequestMapping(value = "boardView", method = RequestMethod.GET)
	public String boardView(@RequestParam String seq, @RequestParam String pg, Model model) {

		model.addAttribute("seq", seq);
		model.addAttribute("pg", pg);
		model.addAttribute("display", "/board/boardView.jsp");

		return "/main/index";

	}

	@RequestMapping(value = "getBoardView", method = RequestMethod.POST)
	public @ResponseBody ModelAndView getBoardView(@RequestParam String seq, HttpSession session, 
												   @CookieValue(value="memHit", required=false) Cookie cookie, 
												   HttpServletResponse response)  {

		BoardDTO boardDTO = boardService.getBoard(seq);

		String memId = (String) session.getAttribute("memId");
		
		if(cookie != null) {
			boardService.hitUp(seq);
			
			// 쿠키삭제
			cookie.setMaxAge(0);
			cookie.setPath("/");
			response.addCookie(cookie);
		}
		

		ModelAndView mav = new ModelAndView();
		mav.addObject("boardDTO", boardDTO);
		mav.addObject("memId", memId);
		mav.setViewName("jsonView");

		return mav;
	}

	@RequestMapping(value = "boardReplyForm", method = RequestMethod.POST)
	public String boardReplyForm(@RequestParam String seq, @RequestParam String pg, Model model) {

		model.addAttribute("pseq", seq); // 원글번호
		model.addAttribute("pg", pg); // 원글이 있는 페이지 번호
		model.addAttribute("display", "/board/boardReplyForm.jsp");

		return "/main/index";

	}

	@RequestMapping(value = "boardReply", method = RequestMethod.POST)
	public String boardReply(@RequestParam Map<String, String> map, Model model) {

		boardService.boardReply(map);
		model.addAttribute("display", "/board/boardReply.jsp");

		return "/main/index";
	}

	@RequestMapping(value = "boardModifyForm", method = RequestMethod.POST)
	public String boardModifyForm(@RequestParam String seq, @RequestParam String pg, Model model) {

		model.addAttribute("seq", seq);
		model.addAttribute("pg", pg);
		model.addAttribute("display", "/board/boardModifyForm.jsp");

		return "/main/index";

	}
	
	@RequestMapping(value = "boardModify", method = RequestMethod.POST)
	@ResponseBody
	public void boardModify(@RequestParam Map<String, Object> map) {
		
		boardService.boardModify(map);
	}
	
	@RequestMapping(value = "boardDelete", method = RequestMethod.POST)
	public String boardDelete(@RequestParam String seq, Model model) {

		boardService.boardDelete(seq);
		
		model.addAttribute("display", "/board/boardDelete.jsp");

		return "/main/index";

	}
	
	
}
