package minierp.model;

import jakarta.persistence.*;

@Entity
@Table(name = "article")
public class Article {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    // Relation avec Produit (un article correspond à un produit)
    @ManyToOne
    @JoinColumn(name = "id_produit")
    private Produit produit;

    // Relation avec Commande (un article appartient à une commande)
    @ManyToOne
    @JoinColumn(name = "id_commande")
    private Commande commande;

    private double quantiteProduit;

    private double montantArticle;

    public Article() {}

    public Article(Produit produit, Commande commande, double quantiteProduit) {
        this.produit = produit;
        this.commande = commande;
        this.quantiteProduit = quantiteProduit;
        this.calculerMontant(); // calcul automatique au moment de la création
    }

    // Calcul automatique du montant de l'article
    public void calculerMontant() {
        if (produit != null) {
            this.montantArticle = this.quantiteProduit * produit.getPrixUnite();
        }
    }

    // Getters et setters
    public Long getId() { return id; }
    public void setId(Long id) { 
        this.id = id; 
    }
    
    public Produit getProduit() { return produit; }
    public void setProduit(Produit produit) { 
        this.produit = produit; 
        calculerMontant(); // recalcul si produit change
    }

    public Commande getCommande() { return commande; }
    public void setCommande(Commande commande) { this.commande = commande; }

    public double getQuantiteProduit() { return quantiteProduit; }
    public void setQuantiteProduit(double quantiteProduit) { 
        this.quantiteProduit = quantiteProduit; 
        calculerMontant(); // recalcul si quantité change
    }

    public double getMontantArticle() { return montantArticle; }
    public void setMontantArticle(double montantArticle) { this.montantArticle = montantArticle; }
}