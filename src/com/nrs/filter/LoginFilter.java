package com.nrs.filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebFilter(value = "/*")
public class LoginFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        String url = request.getRequestURI();

        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        if (url.contains("login.jsp") || url.contains("login") || url.contains(".png") || url.contains("/images/mountain.jpg") || url.contains("register.jsp") || url.contains("register")) {
            filterChain.doFilter(request, response);
            return;
        } else if (request.getSession().getAttribute("username") == null || request.getSession().getAttribute("username").equals("")) {
            request.getSession().setAttribute("Error", "❗ 您还未登录!");
            response.sendRedirect("login.jsp");
        } else {
            filterChain.doFilter(request, response);
            return;
        }
        filterChain.doFilter(request, response);
    }

    @Override
    public void destroy() {

    }
}
