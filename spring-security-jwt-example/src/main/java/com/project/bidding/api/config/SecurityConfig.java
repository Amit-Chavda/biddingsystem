package com.project.bidding.api.config;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.BeanIds;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.NoOpPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

import com.project.bidding.api.filter.BidderAuthenticationFilter;
import com.project.bidding.api.filter.JwtFilter;
import com.project.bidding.api.service.BidderDestailsService;
import com.project.bidding.api.service.CustomUserDetailsService;
import com.project.bidding.api.util.JwtUtil;

@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

	@Autowired
	private CustomUserDetailsService userDetailsService;

	@Autowired
	private JwtFilter jwtFilter;

	@Autowired
	private BidderDestailsService bidderDestailsService;

	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		// auth.userDetailsService(bidderDestailsService);
		auth.authenticationProvider(authenticationProvider());
	}

	@Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}

	@Bean
	public AuthenticationManager authenticationManagerBean() throws Exception {
		return super.authenticationManagerBean();
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {

		http.cors().disable().csrf().disable();
		http.authorizeRequests()
				.antMatchers("/authenticate", "/auctionhouse/login", "/auctionhouse/signup", "/bidder/login",
						"/bidder/LoginError", "/bidder/signup", "/css/**", "/scripts/**", "/", "/category/**",
						"/proxibid.com", "/carousel/**", "/auctionimage/**", "/catalogimage/**")
				.permitAll().anyRequest().authenticated();

		http.sessionManagement().sessionCreationPolicy(SessionCreationPolicy.STATELESS);

		http.formLogin().usernameParameter("userName").loginPage("/bidder/login")
				.successHandler(new AuthenticationSuccessHandler() {

					@Override
					public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
							Authentication authentication) throws IOException, ServletException {
						String token = new JwtUtil().generateToken(authentication.getName());
						Cookie cookie = new Cookie("token", token);
						cookie.setMaxAge(60 * 60); // expires in 1 hour
						cookie.setSecure(true);
						cookie.setHttpOnly(true);
						response.addCookie(cookie);
						System.out.println("token" + token);
						new DefaultRedirectStrategy().sendRedirect(request, response, "/bidder/dashboard");
					}
				});

		http.addFilter(new BidderAuthenticationFilter(authenticationManager()));
		http.addFilterBefore(jwtFilter, UsernamePasswordAuthenticationFilter.class);

	}

	DaoAuthenticationProvider authenticationProvider() {
		DaoAuthenticationProvider authenticationProvider = new DaoAuthenticationProvider();
		authenticationProvider.setUserDetailsService(bidderDestailsService);
		authenticationProvider.setPasswordEncoder(passwordEncoder());
		return authenticationProvider;
	}

}
