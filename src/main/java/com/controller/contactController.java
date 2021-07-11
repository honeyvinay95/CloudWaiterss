package com.controller;




//import javax.validation.Valid;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dao.contactusDao;

import com.model.contactus;




@Controller
public class contactusController {
	@Autowired
private contactusDao contactusDao;
	
	public contactusController(){
		System.out.println("ContactController instantiated");
	}

	@RequestMapping(value="/Contact" ,method=RequestMethod.GET)
	 public String getContact( Model model) {
		//contact = new Contact(); 
		model.addAttribute("contactus",new contactus());
		
		
		return "contactus";
	}
	
	
		
		@RequestMapping(value = "/savecontact", method = RequestMethod.POST)
	public String saveContact (@ModelAttribute("contact")contactus contactus,
			Model model){
			
	
				contactusDao.saveContact(contactus);
		    
			return "index";
}
}