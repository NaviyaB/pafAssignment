package com.example.demo.services;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.example.demo.model.Product;
import com.example.demo.repository.ProductRepository;

@Service
@Transactional
public class ProductService {

	private final ProductRepository productRepository;
	
	public ProductService(ProductRepository productRepository) {
		
		this.productRepository = productRepository;
	}
	
	public void savemyproduct(Product product) {
		
		productRepository.save(product);
	}
	
	public List<Product>showAllProducts(){
		
		List<Product>products = new ArrayList<Product>();
		for(Product product : productRepository.findAll()) {
			
			products.add(product); 
			
		}
		
		return products;
	}
	
	public void deletemyproduct(int id) {
		
		productRepository.deleteById(id);
	}
	
	public Product editProduct(int id) {
		
		return productRepository.findById(id).orElse(null); 
	}
}

