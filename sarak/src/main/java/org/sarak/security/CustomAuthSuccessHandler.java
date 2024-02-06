package org.sarak.security;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

@Component
public class CustomAuthSuccessHandler extends SimpleUrlAuthenticationSuccessHandler{
	
    private final RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
            Authentication authentication) throws IOException {
    	
    	// 이전 url로 redirect
    	String prevPage = (String) request.getSession().getAttribute("prevPage");
    	
    	redirectStrategy.sendRedirect(request, response, prevPage);
    	
    }
    
}