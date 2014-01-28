package spring.board.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import com.board.beans.Board;

@Controller	// 
public abstract class BoardController  {

	@RequestMapping("/list/{page}")	// url ¸
	public abstract ModelAndView listAction(@PathVariable Integer page) throws Exception;
																								// Restful : url
	//(value="/insert", method=RequestMethod.POST);
	@RequestMapping( "/insert")
	public abstract ModelAndView insertAction(@ModelAttribute Board article, HttpServletRequest request) throws Exception;
																									 
	@RequestMapping("/ajaxList")
	public abstract ModelAndView ajaxListAction(@RequestParam Integer page) throws Exception;
	
	@RequestMapping("/write")
	public abstract ModelAndView writeAction() throws Exception;
	
	@RequestMapping("/count")
	public abstract ModelAndView countAction(@RequestParam Integer idx, HttpServletRequest request) throws Exception;
	
	@RequestMapping("/content")
	public abstract ModelAndView contentAction(@RequestParam Integer idx) throws Exception;
	
	@RequestMapping("/delete")
	public abstract ModelAndView deleteAction(@RequestParam Integer idx, HttpServletRequest request) throws Exception;
	
	@RequestMapping("/download/{idx}")
	public abstract ModelAndView downloadAction(@PathVariable Integer idx, HttpServletRequest request) throws Exception;
	
}


