package com.project.bidding.api.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.project.bidding.api.entity.Bidder;

@Repository
public interface BidderRepository extends JpaRepository<Bidder, String> {

	Bidder save(Bidder bidder);

	Optional<Bidder> findByBidderEmail(String bidderEmail);// this is used in login but right now we havent made login
															// 17 feb

}
