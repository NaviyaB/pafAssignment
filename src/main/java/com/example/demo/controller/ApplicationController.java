package com.example.demo.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.model.Product;
import com.example.demo.services.ProductService;


@Controller
public class ApplicationController {
	
	@Autowired
	private ProductService productService;
	
	@RequestMapping("/welcome")
	public String welcome(HttpServletRequest request) {
		
		request.setAttribute("mode", "MODE_HOME");
		return "welcome";
	}
	
	@RequestMapping("/addProduct") 
	public String addition(HttpServletRequest request) {
		
		request.setAttribute("mode", "MODE_ADDPRODUCT");
		return "welcome";
	}
	
	@PostMapping("/save-product")
	public String addProduct(@ModelAttribute Product product , BindingResult bindingResult , HttpServletRequest request ) {
	productService.savemyproduct(product);
	request.setAttribute("mode", "MODE_HOME");	
		return "welcome";
		
	}
	
	@GetMapping("/show-products")
	public String showAllProducts(HttpServletRequest request) {
		request.setAttribute("products", productService.showAllProducts());
		request.setAttribute("mode", "ALL_PRODUCTS");
		return "welcome";
	}
	
	@RequestMapping("/delete-product")
	public String deleteProduct(@RequestParam int id , HttpServletRequest request) {
		productService
		.deletemyproduct(id);
		request.setAttribute("products", productService.showAllProducts());
		request.setAttribute("mode", "ALL_PRODUCTS");
		return "welcome";
	}
	
	@RequestMapping("/edit-product")
	public String editProduct(@RequestParam int id , HttpServletRequest request) {
		request.setAttribute("product", productService.editProduct(id));
		request.setAttribute("mode", "MODE_UPDATE");
		return "welcome";
	}
	

} 
