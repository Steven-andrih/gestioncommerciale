package minierp.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

import minierp.model.Article;
import minierp.model.Commande;
import minierp.model.Produit;
import minierp.service.ArticleService;
import minierp.service.CommandeService;
import minierp.service.ProduitService;
import minierp.service.impl.ArticleServiceImpl;
import minierp.service.impl.CommandeServiceImpl;
import minierp.service.impl.ProduitServiceImpl;

public class ArticleServlet extends HttpServlet {

    private ArticleService articleService = new ArticleServiceImpl();
    private CommandeService commandeService = new CommandeServiceImpl();
    private ProduitService produitService = new ProduitServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idCommandeStr = request.getParameter("idCommande");
        if (idCommandeStr == null) {
            response.sendRedirect("CommandeServlet");
            return;
        }

        Long idCommande = Long.parseLong(idCommandeStr);
        Commande commande = commandeService.findById(idCommande);
        List<Article> articles = articleService.findByCommande(idCommande);
        List<Produit> produits = produitService.findAll();

        request.setAttribute("commande", commande);
        request.setAttribute("articles", articles);
        request.setAttribute("produits", produits);

        request.getRequestDispatcher("views/article/article.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String validerCommande = request.getParameter("validerCommande");
        String idCommandeStr = request.getParameter("idCommande");

        if (idCommandeStr == null) {
            response.sendRedirect("CommandeServlet");
            return;
        }

        Long idCommande = Long.parseLong(idCommandeStr);
        Commande commande = commandeService.findById(idCommande);

        if ("true".equals(validerCommande)) {
            // Valider la commande → changer état
            commande.setEtat("valide");
            commandeService.update(commande);
            response.sendRedirect(request.getContextPath() + "/CommandeServlet");
            return;
        }

        // Ajout d'un article
        Long idProduit = Long.parseLong(request.getParameter("idProduit"));
        double quantite = Double.parseDouble(request.getParameter("quantite"));

        Produit produit = produitService.findById(idProduit);

        Article article = new Article();
        article.setCommande(commande);
        article.setProduit(produit);
        article.setQuantiteProduit(quantite);
        article.setMontantArticle(produit.getPrixUnite() * quantite);

        articleService.save(article);

        // Mise à jour montant total de la commande
        double total = articleService.findByCommande(idCommande)
                .stream().mapToDouble(Article::getMontantArticle).sum();
        commande.setMontantTotal(total);
        commandeService.update(commande);

        response.sendRedirect(request.getContextPath() + "/ArticleServlet?idCommande=" + idCommande);
    }
}