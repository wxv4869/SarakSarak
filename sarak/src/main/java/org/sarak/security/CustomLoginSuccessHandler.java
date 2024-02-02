package org.sarak.security;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;

import lombok.extern.log4j.Log4j;

@Log4j
public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler{

	private final RequestCache requestCache = new HttpSessionRequestCache();
	
	private final RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();
	   
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		
		log.warn("Login Success");

		List<String> roleNames = new ArrayList<>();

		authentication.getAuthorities().forEach(authority -> {

			roleNames.add(authority.getAuthority());

		});

		log.warn("ROLE NAMES: " + roleNames);

		if (roleNames.contains("ROLE_ADMIN")) {

			response.sendRedirect("/index/admin");
			
			return;
			
		}

		if (roleNames.contains("ROLE_USER")) {
			
	    	// 이전 url로 redirect
	    	String prevPage = (String) request.getSession().getAttribute("prevPage");

	    	redirectStrategy.sendRedirect(request, response, prevPage);
//			response.sendRedirect("/sarak/main");
			return;
			
		}

		response.sendRedirect("/");
		
	}

}