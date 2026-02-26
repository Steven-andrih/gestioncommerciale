package minierp.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

import minierp.model.Categorie;
import minierp.service.CategorieService;
import minierp.service.impl.CategorieServiceImpl;

public class CategorieServlet extends HttpServlet {

    private CategorieService service = new CategorieServiceImpl();

    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if ("delete".equals(action)) {
            Long id = Long.parseLong(request.getParameter("id"));
            service.delete(id);
            response.sendRedirect("CategorieServlet");
            return;
        }

        List<Categorie> categories = service.findAll();
        request.setAttribute("categories", categories);
        request.getRequestDispatcher("views/categorie/categorie.jsp")
                .forward(request, response);
    }

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String id = request.getParameter("id");
        String nom = request.getParameter("nomCategorie");

        if (id == null || id.isEmpty()) {
            service.save(nom);
        } else {
            service.update(Long.parseLong(id), nom);
        }

        response.sendRedirect("CategorieServlet");
    }
}