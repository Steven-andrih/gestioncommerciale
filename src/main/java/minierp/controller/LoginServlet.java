package minierp.controller;

import minierp.model.User;
import minierp.service.UserService;
import minierp.service.impl.UserServiceImpl;
import minierp.util.*;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;

public class LoginServlet extends HttpServlet {

    private UserService userService = new UserServiceImpl();

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        User user = userService.login(email, password);

        if (user != null) {

            request.getSession().setAttribute("user", user);

            if (user.getRole().equals("ADMIN")) {
                response.sendRedirect("views/dashboard_admin.jsp");
            } else {
                response.sendRedirect("views/dashboard_commercial.jsp");
            }

        } else {
            response.sendRedirect("views/login.jsp?error=1");
        }
    }
    
    @Override
	protected void doGet(HttpServletRequest request,
	            HttpServletResponse response)
	throws ServletException, IOException {
    	
    	request.getRequestDispatcher("views/login.jsp").forward(request, response);
	
	}
    
    @Override
    public void init() {
//        JPAUtil.getEntityManagerFactory();
    }
}
