package com.project.bidding.api.filter;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import com.project.bidding.api.util.JwtUtil;

public class BidderAuthenticationFilter extends UsernamePasswordAuthenticationFilter {

//	private static final Logger log = LoggerFactory.getLogger(BidderAuthenticationFilter.class);

	AuthenticationManager authenticationManager;

	public BidderAuthenticationFilter(AuthenticationManager authenticationManager) {
		this.authenticationManager = authenticationManager;
		System.out.println("Inside bidder authfilter");
	}

	
	
	@Override
	public Authentication attemptAuthentication(HttpServletRequest request, HttpServletResponse response)
			throws AuthenticationException {
		String username = request.getParameter("userName");
		String password = request.getParameter("password");
	//	log.warn(request.getParameter("userName") + " tried to login!");
		System.out.println(request.getParameter("username") + " tried to login!");

		UsernamePasswordAuthenticationToken authenticationToken = new UsernamePasswordAuthenticationToken(username,
				password);
		return authenticationManager.authenticate(authenticationToken);
	}

	@Override
	protected void successfulAuthentication(HttpServletRequest request, HttpServletResponse response, FilterChain chain,
			Authentication authResult) throws IOException, ServletException {

		String token = new JwtUtil().generateToken(authResult.getName());
		Cookie cookie = new Cookie("token", token);
		cookie.setMaxAge(60 * 60); // expires in 1 hour
		cookie.setSecure(true);
		cookie.setHttpOnly(true);
		response.addCookie(cookie);
		System.out.println("token" + token);
		super.successfulAuthentication(request, response, chain, authResult);
	}



	@Override
	public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
			throws IOException, ServletException {
		System.out.println("Inside do filter");
		super.doFilter(req, res, chain);
	}



	@Override
	protected void unsuccessfulAuthentication(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException failed) throws IOException, ServletException {
System.out.println("unsuccessful");
		super.unsuccessfulAuthentication(request, response, failed);
	}

}
