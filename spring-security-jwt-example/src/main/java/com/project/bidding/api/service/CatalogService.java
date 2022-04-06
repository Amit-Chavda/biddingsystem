package com.project.bidding.api.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.bidding.api.entity.Catalog;
import com.project.bidding.api.repository.CatalogRepository;

@Service
public class CatalogService {

	@Autowired
	private CatalogRepository catalogRepository;

	public List<Catalog> getAll() {

		return catalogRepository.findAll();
	}

	public List<Catalog> getFirstEight() {
		return catalogRepository.findFirstEight();
	}
	
	public List<Catalog> getRandomFive() {
		return catalogRepository.findRandomEight();
	}
}
