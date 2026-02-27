package minierp.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

import minierp.model.Produit;
import minierp.model.Categorie;
import minierp.service.ProduitService;
import minierp.service.CategorieService;
import minierp.service.impl.ProduitServiceImpl;
import minierp.service.impl.CategorieServiceImpl;

public class ProduitServlet extends HttpServlet {

    private ProduitService produitService = new ProduitServiceImpl();
    private CategorieService categorieService = new CategorieServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if ("delete".equals(action)) {
            Long id = Long.parseLong(request.getParameter("id"));
            produitService.delete(id);
            response.sendRedirect("ProduitServlet");
            return;
        }

        List<Produit> produits = produitService.findAll();
        List<Categorie> categories = categorieService.findAll(); 

        request.setAttribute("produits", produits);
        request.setAttribute("categories", categories);
        request.getRequestDispatcher("views/produit/produit.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String id = request.getParameter("id");
        String nom = request.getParameter("nomProduit");
        double quantite = Double.parseDouble(request.getParameter("quantite"));
        double prix = Double.parseDouble(request.getParameter("prixUnite"));
        Long idCategorie = Long.parseLong(request.getParameter("idCategorie"));
        String unite = request.getParameter("unite");

        Categorie categorie = categorieService.findById(idCategorie);
        Produit produit = new Produit(nom, quantite, prix, categorie,unite);

        if (id == null || id.isEmpty()) {
            produitService.save(produit);
        } else {
            produit.setId(Long.parseLong(id));
            produitService.update(produit);
        }

        response.sendRedirect("ProduitServlet");
    }
}