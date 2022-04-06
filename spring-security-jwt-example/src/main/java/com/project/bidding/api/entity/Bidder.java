package com.project.bidding.api.entity;

import java.util.Collection;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
@Entity
@Table(name="Bidder")
public class Bidder implements UserDetails{
	@Id
	private String bidderEmail;
	private String bidderFirstName;
	private String bidderLastName;
	private long bidderContact;
	private String bidderPassword;
	
	
	public Bidder(String bidderEmail, String bidderFirstName, String bidderLastName, long bidderContact,
			String bidderPassword) {
		super();
		this.bidderEmail = bidderEmail;
		this.bidderFirstName = bidderFirstName;
		this.bidderLastName = bidderLastName;
		this.bidderContact = bidderContact;
		this.bidderPassword = bidderPassword;
	}
	public Bidder() {
		super();
	}
	public Bidder(String bidderEmail, String bidderPassword) {
		super();
		this.bidderEmail = bidderEmail;
		this.bidderPassword = bidderPassword;
	}
	public String getBidderEmail() {
		return bidderEmail;
	}
	public void setBidderEmail(String bidderEmail) {
		this.bidderEmail = bidderEmail;
	}
	public String getBidderFirstName() {
		return bidderFirstName;
	}
	public void setBidderFirstName(String bidderFirstName) {
		this.bidderFirstName = bidderFirstName;
	}
	public String getBidderLastName() {
		return bidderLastName;
	}
	public void setBidderLastName(String bidderLastName) {
		this.bidderLastName = bidderLastName;
	}
	public long getBidderContact() {
		return bidderContact;
	}
	public void setBidderContact(long bidderContact) {
		this.bidderContact = bidderContact;
	}
	public String getBidderPassword() {
		return bidderPassword;
	}
	public void setBidderPassword(String bidderPassword) {
		this.bidderPassword = bidderPassword;
	}
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		return null;
	}
	@Override
	public String getPassword() {
		return bidderPassword;
	}
	@Override
	public String getUsername() {
		return bidderEmail;
	}
	@Override
	public boolean isAccountNonExpired() {
		return true;
	}
	@Override
	public boolean isAccountNonLocked() {
		// TODO Auto-generated method stub
		return true;
	}
	@Override
	public boolean isCredentialsNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}
	@Override
	public boolean isEnabled() {
		// TODO Auto-generated method stub
		return true;
	}
	
	
}
