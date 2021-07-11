package com.controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dao.CategoryDao;
import com.dao.ProductDao;
import com.dao.SupplierDao;
import com.model.Category;
import com.model.Product;
import com.model.Supplier;

@Controller
public class productcontroller {

	@Autowired
	private ProductDao productdao;
	@Autowired
	private CategoryDao categorydao;
	@Autowired
	private SupplierDao supplierdao;

	public productcontroller() {
		System.out.println("ProductController instantiated");
	}

	/* REQUEST MAPPING OF OF ADMIN PAGE FOR GETTING PRODUCT FORM */
	@RequestMapping("/addproduct")
	public String productform(Model model, HttpSession session) {

		List<Product> products = productdao.getAllProducts();
		for (Product p : products) {
			System.out.println("categrory id is" + p.getCategory_id());
			System.out.println("productname is" + p.getName());
		}
		model.addAttribute("product", new Product());
		model.addAttribute("products", products);
		// model.addAttribute("categorys",categorydao.list());
		// model.addAttribute("Supplier",supplierdao.List());
		return "addproduct";

	}

	@RequestMapping(value = "/product/add", method = RequestMethod.POST)
	public String saveProduct(@ModelAttribute("product") Product product, HttpServletRequest request,
			RedirectAttributes redirectAttributes) {

		HttpSession s = request.getSession();

		Category category = categorydao.getCategoryByName(product.getCategory().getCategoryName());
		// categoryDAO.save(category);
		Supplier supplier = supplierdao.getSupplierByName(product.getSupplier().getName());
		// supplierDAO.save(supplier);

		product.setCategory(category);
		product.setSupplier(supplier);
		product.setCategory_id(category.getId());
		product.setSupplier_id(supplier.getId());
		if (product.getId() == 0) {

			productdao.save(product);
			MultipartFile file = product.getImage();
			// String originalfile=file.getOriginalFilename();
			String fileloc = s.getServletContext().getRealPath("/resources");
			System.out.println(fileloc);
			String filename = fileloc + "\\" + product.getId() + ".jpg";
			System.out.println(filename);

			try {
				byte b[] = file.getBytes();
				FileOutputStream fos = new FileOutputStream(filename);
				fos.write(b);
				fos.close();
				System.out.println(filename);

			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		} else

		{

			System.out.println("edit product");
			productdao.update(product);
		}
		return "redirect:/adminHome/manageProducts";

	}

	@RequestMapping("/edit/{id}")
	public String update(@PathVariable("id") int id, Model model) {

		System.out.println("edit");
		model.addAttribute("product", productdao.getProductBYID(id));

		model.addAttribute("categorys", categorydao.list());
		model.addAttribute("suppliers", supplierdao.List());
		// model.addAttribute("listProducts",productdao.getAllProducts());

		return "addproduct";
	}

	@RequestMapping("/remove/{id}")
	public String remove(@PathVariable("id") int id) {
		productdao.delete(id);

		return "redirect:/addproduct";
	}

	

}
