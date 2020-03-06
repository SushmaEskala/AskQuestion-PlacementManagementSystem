package com.spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.spring.dao.QuestionDAO;
import com.spring.domain.Question;

@Controller
public class QuestionController {

	@Autowired
	private QuestionDAO qdao;
	
	@RequestMapping("/")
	public ModelAndView getMyQuestions() {
		List<Question> qlist = qdao.listQuestions();
		ModelAndView model = new ModelAndView("index");
		model.addObject("list", qlist);
		return model;
	}
	
	@RequestMapping(method=RequestMethod.POST)
	public ModelAndView saveQuestion(@ModelAttribute("question") Question question) {
		
		Boolean res = qdao.saveQuestion(question);
		
		ModelAndView model = new ModelAndView();
		if(res) {
			System.out.println("inserted");
			model = new ModelAndView("index");
		}
		else {
			System.out.println("not inserted");
		}
		return model;
	}
}
