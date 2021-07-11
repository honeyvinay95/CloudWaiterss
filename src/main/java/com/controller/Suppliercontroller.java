package com.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dao.CategoryDao;
import com.dao.SupplierDao;
import com.model.Category;
import com.model.Supplier;


@Controller
public class Suppliercontroller {
	@Autowired
	private SupplierDao SupplierDao;
	

	

	@RequestMapping(value="/addSupplier",method=RequestMethod.GET)
	public String listCategory(Model model)
	{ 
		
		
		List<Supplier> list=SupplierDao.List();
		for(Supplier s:list)
		{
			System.out.println("address is" +s.getAddress());
		}
		model.addAttribute("supplier",new Supplier());
		model.addAttribute("listsupplier", list);
	
	
		return "addsupplier";
		
	}
	
	@RequestMapping(value="/newSupplier",method=RequestMethod.POST)
	public String addcategory(@ModelAttribute("supplier")  Supplier supplier)
	{

	

	if(supplier.getId()==0)
	{

		SupplierDao.save(supplier);
	}
	else
	{
		SupplierDao.update(supplier);
	}

	
	  return "redirect:/adminHome/manageSuppliers";
	 // return "${session.getContextPath()}/CloudWaiters/addsupplier";
	

	}
	
	
	
	@RequestMapping(value="/editSupplier/{id}")
	public String editP(@ModelAttribute("id") int id,Model model)
	{
		model.addAttribute("supplier", SupplierDao.get(id));
		
	//	return "AdminHome";
		return "addsupplier";
	}
	
 
	@RequestMapping(value="/deleteSupplier/{id}")
	public String deletesupplier(@PathVariable("id") int id,Model model)
	{
		
		SupplierDao.delete(id);
	   
		return "redirect:/adminHome/manageSuppliers";
	}
 
	
	
	
	

}

