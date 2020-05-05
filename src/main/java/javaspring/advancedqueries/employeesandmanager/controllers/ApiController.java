package javaspring.advancedqueries.employeesandmanager.controllers;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import javaspring.advancedqueries.employeesandmanager.models.Employee;
import javaspring.advancedqueries.employeesandmanager.services.ApiService;

@Controller
public class ApiController {
	private final ApiService s;

	public ApiController(ApiService s) {
		super();
		this.s = s;
	}
	
	@RequestMapping("/index")
	public String index(Model model, @ModelAttribute Employee m) {
		model.addAttribute("employees", s.findEmployees());
		model.addAttribute("managers", s.findManagers());
		return "index.jsp";
	}
	
	@RequestMapping("/newmanager")
	public String newManager(@Valid @ModelAttribute Employee m, BindingResult rslt) {
		if(rslt.hasErrors()) {
			return "index.jsp";
		}
		else {
			s.createEmployee(m);
			return "redirect:/index";
		}
	}
	
	@RequestMapping("/newemployee")
	public String newEmployee(@Valid @ModelAttribute Employee e, BindingResult rslt) {
		if(rslt.hasErrors()) {
			return "index.jsp";
		}
		else {
			s.createEmployee(e);
			return "redirect:/index";
		}
	}
}
