package minierp.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

import minierp.model.Commande;
import minierp.model.User;
import minierp.service.CommandeService;
import minierp.service.impl.CommandeServiceImpl;

public class CommandeServlet extends HttpServlet {

    private CommandeService commandeService = new CommandeServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if ("delete".equals(action)) {
            Long id = Long.parseLong(request.getParameter("id"));
            commandeService.delete(id);
            response.sendRedirect("CommandeServlet");
            return;
        }

        List<Commande> commandes = commandeService.findAll();
        request.setAttribute("commandes", commandes);
        request.getRequestDispatcher("views/commande/commande.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idStr = request.getParameter("id");

        HttpSession session = request.getSession();
        User userConnecte = (User) session.getAttribute("userConnecte");

        if (userConnecte == null) {
            response.sendRedirect(request.getContextPath() + "/views/login.jsp");
            return;
        }

        Commande commande;
        if (idStr == null || idStr.isEmpty()) {
            // Création nouvelle commande
            String nomClient = request.getParameter("nomClient"); // <-- Récupère le nom du client
            commande = new Commande();
            commande.setUser(userConnecte);        // commercial connecté
            commande.setNomClient(nomClient);      // set nom client
            commande.setEtat("en_traitement");

            commandeService.save(commande);

            // Redirection vers ArticleServlet pour ajouter les articles
            response.sendRedirect(request.getContextPath() + "/ArticleServlet?idCommande=" + commande.getId());
        } else {
            // Modification d'une commande existante (changer l'état)
            Long id = Long.parseLong(idStr);
            commande = commandeService.findById(id);
            if (commande != null) {
                String etat = request.getParameter("etat");
                commande.setEtat(etat);
                commandeService.update(commande);
            }
            response.sendRedirect("CommandeServlet");
        }
    }
}