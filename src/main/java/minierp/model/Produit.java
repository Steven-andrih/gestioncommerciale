package minierp.model;

import jakarta.persistence.*;

@Entity
@Table(name = "produit")
public class Produit {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String nomProduit;

    private double quantite;

    private double prixUnite;

    @ManyToOne
    @JoinColumn(name = "id_categorie")
    private Categorie categorie;
    
    private String unite;

    public Produit() {
    }

    public Produit(String nomProduit, double quantite, double prixUnite, Categorie categorie, String unite) {
        this.nomProduit = nomProduit;
        this.quantite = quantite;
        this.prixUnite = prixUnite;
        this.categorie = categorie;
        this.unite = unite;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getId() {
        return id;
    }

    public String getNomProduit() {
        return nomProduit;
    }

    public void setNomProduit(String nomProduit) {
        this.nomProduit = nomProduit;
    }

    public double getQuantite() {
        return quantite;
    }

    public void setQuantite(double quantite) {
        this.quantite = quantite;
    }

    public double getPrixUnite() {
        return prixUnite;
    }

    public void setPrixUnite(double prixUnite) {
        this.prixUnite = prixUnite;
    }

    public Categorie getCategorie() {
        return categorie;
    }

    public void setCategorie(Categorie categorie) {
        this.categorie = categorie;
    }
    
    public String getUnite() {
        return unite;
    }

    public void setUnite(String unite) {
        this.unite = unite;
    }
}