package com.controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dao.CategoryDao;
import com.dao.ProductDao;
import com.dao.SupplierDao;
import com.model.Supplier;
import com.model.Category;
import com.model.Product;

@Controller
public class AdminController {
	
	@Autowired
	ProductDao productdao;
	@Autowired
	CategoryDao categoryDao;
	@Autowired
	SupplierDao  supplierDao;
	
	@RequestMapping("/AdminHome")
	public String admin()
	{
		return "AdminHome";
	}
	
	/*
	@RequestMapping("/AdminHome")
	public String adminHome(){
	return "AdminHome";
	}*/
	
	@RequestMapping("/adminHome/manageCategories")
	public ModelAndView categories(){
	ModelAndView mv = new ModelAndView("addcategory");
	mv.addObject("category", new Category());
	mv.addObject("isAdminClickedCategories" ,"true");
	mv.addObject("categorys", categoryDao.list());
	return mv;
	}
	
	@RequestMapping("/adminHome/manageProducts")
	public ModelAndView products(){
	ModelAndView mv = new ModelAndView("/addproduct");
	mv.addObject("product", new Product());
	mv.addObject("isAdminClickedProducts", "true");
	mv.addObject("products",productdao.list());
	
	/*mv.addObject("listproduct", productdao.getAllProducts());*/
	mv.addObject("categorys", categoryDao.list());
	mv.addObject("suppliers", supplierDao.List());
	/*mv.addObject("listsupplier", supplierDao.List());*/
	return mv;
	}
	@RequestMapping("/adminHome/manageSuppliers")
	public ModelAndView supplier(){
	ModelAndView mv = new ModelAndView("/addsupplier");
	mv.addObject("supplier", new Supplier());
	mv.addObject("isAdminClickedsupplier", "true");
	mv.addObject("suppliers", supplierDao.List());

	return mv;
	}
	

}
