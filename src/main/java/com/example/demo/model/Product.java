package com.example.demo.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "products")
public class Product {
	
	@Id
	private int id;
	private String itemName;
	private String content;
	private double price; 
	
	public Product() {
			
	}
	public Product(int id, String itemName, String content, double price) {
		super();
		this.id = id;
		this.itemName = itemName;
		this.content = content;
		this.price = price;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}
	
	@Override
	public String toString() {
		return "Product [id=" + id + ", itemName=" + itemName + ", content=" + content + ", price=" + price + "]";
	}
	
}
