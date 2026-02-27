package minierp.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.time.LocalDateTime;
import java.util.List;

import minierp.model.Commande;
import minierp.model.User;
import minierp.service.CommandeService;
import minierp.service.UserService;
import minierp.service.impl.CommandeServiceImpl;
import minierp.service.impl.UserServiceImpl;

public class CommandeServlet extends HttpServlet {

    private CommandeService commandeService = new CommandeServiceImpl();
    private UserService userService = new UserServiceImpl();

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
//        List<User> users = userService.findAll();

        request.setAttribute("commandes", commandes);
//        request.setAttribute("users", users);

        request.getRequestDispatcher("views/commande/commande.jsp")
               .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Récupérer l'utilisateur connecté depuis la session
        User connectedUser = (User) request.getSession().getAttribute("user");
        if (connectedUser == null) {
            response.sendRedirect("login.jsp"); // Pas connecté
            return;
        }

        String id = request.getParameter("id");
        String etat = request.getParameter("etat");
        double montantTotal = Double.parseDouble(request.getParameter("montantTotal"));
        String nomClient = request.getParameter("nomClient"); // peut garder si tu veux saisir le client réel

        Commande commande = new Commande(connectedUser, etat, montantTotal, nomClient);
        commande.setDateHeure(LocalDateTime.now()); // <-- ici

        if (id == null || id.isEmpty()) {
            commandeService.save(commande);
        } else {
            commande.setId(Long.parseLong(id));
            commandeService.update(commande);
        }

        response.sendRedirect("CommandeServlet");
    }
}