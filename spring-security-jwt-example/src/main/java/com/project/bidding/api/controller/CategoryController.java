package com.project.bidding.api.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.project.bidding.api.entity.Category;
import com.project.bidding.api.service.CategoryService;

@RestController
@RequestMapping("category/")
public class CategoryController {

	@Autowired
	private CategoryService categoryservice;

	@GetMapping("/getAll")
	public List<Category> getAllCategories() {
		return categoryservice.getAllCategories();
	}
}
