package minierp.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

import minierp.model.Approvisionnement;
import minierp.model.Produit;
import minierp.service.ApprovisionnementService;
import minierp.service.ProduitService;
import minierp.service.impl.ApprovisionnementServiceImpl;
import minierp.service.impl.ProduitServiceImpl;

public class ApprovisionnementServlet extends HttpServlet {

    private ApprovisionnementService approService =
            new ApprovisionnementServiceImpl();

    private ProduitService produitService =
            new ProduitServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if ("delete".equals(action)) {
            Long id = Long.parseLong(request.getParameter("id"));
            approService.delete(id);
            response.sendRedirect("ApprovisionnementServlet");
            return;
        }

        List<Approvisionnement> approvisionnements =
                approService.findAll();

        List<Produit> produits =
                produitService.findAll();

        request.setAttribute("approvisionnements", approvisionnements);
        request.setAttribute("produits", produits);

        request.getRequestDispatcher("views/approvisionnement/approvisionnement.jsp")
               .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String id = request.getParameter("id");
        Long idProduit = Long.parseLong(request.getParameter("idProduit"));
        double quantiteAjoute =
                Double.parseDouble(request.getParameter("quantiteAjoute"));

        Produit produit = produitService.findById(idProduit);

        Approvisionnement appro =
                new Approvisionnement(produit, quantiteAjoute);

        if (id == null || id.isEmpty()) {
            approService.save(appro);
        } else {
            appro.setId(Long.parseLong(id));
            approService.update(appro);
        }

        response.sendRedirect("ApprovisionnementServlet");
    }
}