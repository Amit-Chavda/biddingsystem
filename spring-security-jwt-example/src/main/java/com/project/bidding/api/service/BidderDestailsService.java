package com.project.bidding.api.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.project.bidding.api.entity.Bidder;
import com.project.bidding.api.repository.BidderRepository;

@Service
public class BidderDestailsService implements UserDetailsService {

	@Autowired
	private BidderRepository bidderRepository;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		
		Bidder bidder = bidderRepository.findByBidderEmail(username).orElseThrow(() -> {
			throw new UsernameNotFoundException("Bidder with " + username + " does not exists!");
		});
		return bidder;
	}

}
