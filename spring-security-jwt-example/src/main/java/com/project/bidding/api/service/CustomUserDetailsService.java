package com.project.bidding.api.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import com.project.bidding.api.entity.Bidder;
import com.project.bidding.api.entity.Seller;
import com.project.bidding.api.repository.BidderRepository;
import com.project.bidding.api.repository.SellerRepository;

import java.util.ArrayList;

@Service
public class CustomUserDetailsService implements UserDetailsService {
	@Autowired
	private SellerRepository repository;

	@Autowired
	private BidderRepository bidderRepository;

	@Override
	public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {

		Seller seller = repository.findByEmail(email);

		if (seller == null) {
			Bidder bidder = bidderRepository.findByBidderEmail(email).get();

			return new org.springframework.security.core.userdetails.User(bidder.getBidderEmail(),
					new BCryptPasswordEncoder().encode(bidder.getBidderPassword()), new ArrayList<>());
		} else {
			return new org.springframework.security.core.userdetails.User(seller.getEmail(), seller.getPassword(),
					new ArrayList<>());
		}

	}
}
