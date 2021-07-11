
package com.controller;
 
import java.util.List;
import java.util.logging.Logger;
 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
 
import com.dao.CategoryDao;
import com.model.Category;
import com.model.Product;
 
@Controller
public class CategoryController {
                @Autowired
                private CategoryDao categoryDAO;
               
 
               
 
                @RequestMapping(value="/addCategory",method=RequestMethod.GET)
                public String listCategory(Model model)
                {
                               
                               
                                List<Category> list=categoryDAO.list();
                                model.addAttribute("category",new Category());
                                model.addAttribute("categorys", list);
               
               
                                return "AdminHome";
                               
                }
               
                @RequestMapping(value="/newCategory",method=RequestMethod.POST)
                public String addCategory(@ModelAttribute("category")  Category category)
                {
 
              
 
                if(category.getId()==0)
                {
 
                                categoryDAO.save(category);
                }
                else
                {
                                categoryDAO.update(category);
                }
 
               
                //  return "redirect:/categoryTable";
                  return "redirect:/AdminHome";
                }
               
               
               
                @RequestMapping(value="/editCategory/{id}")
                public String editP(@ModelAttribute("id") String id,Model model)
                {
                                model.addAttribute("category", categoryDAO.get(id));
                               
                                return "AdminHome";
                }
               
                @RequestMapping(value="/deleteCategory/{id}")
                public String deleteCategory(@PathVariable("id") int id,Model model)
                {
                               
                     categoryDAO.delete(id);
                  
                                return "redirect:/AdminHome";
                }
}
