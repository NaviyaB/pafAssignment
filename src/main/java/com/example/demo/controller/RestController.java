 package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.model.Product;
import com.example.demo.services.ProductService;

@org.springframework.web.bind.annotation.RestController
public class RestController {
	
	@Autowired
	private ProductService productService;
	
	@GetMapping("saveproduct")
	public String saveProduct(@RequestParam int id , @RequestParam String itemName, @RequestParam String content , @RequestParam double price ) {
		
		Product product = new Product(id , itemName, content , price );
		productService.savemyproduct(product);
		return "Product Saved!!";
	}

}
