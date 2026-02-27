package minierp.model;

import jakarta.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "approvisionnement")
public class Approvisionnement {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    // Relation ManyToOne avec Produit
    @ManyToOne
    @JoinColumn(name = "id_produit", nullable = false)
    private Produit produit;

    private double quantiteAjoute;

    private LocalDateTime dateHeure;

    public Approvisionnement() {
    }
    
    public Approvisionnement(Produit produit, double quantiteAjoute) {
        this.produit = produit;
        this.quantiteAjoute = quantiteAjoute;
    }

    public Approvisionnement(Produit produit, double quantiteAjoute, LocalDateTime dateHeure) {
        this.produit = produit;
        this.quantiteAjoute = quantiteAjoute;
        this.dateHeure = dateHeure;
    }

    @PrePersist
    public void prePersist() {
        if (this.dateHeure == null) {
            this.dateHeure = LocalDateTime.now();
        }
    }
    
    // Getters & Setters

    public void setId(Long id) {
        this.id = id;
    }
    
    public Long getId() {
        return id;
    }

    public Produit getProduit() {
        return produit;
    }

    public void setProduit(Produit produit) {
        this.produit = produit;
    }

    public double getQuantiteAjoute() {
        return quantiteAjoute;
    }

    public void setQuantiteAjoute(double quantiteAjoute) {
        this.quantiteAjoute = quantiteAjoute;
    }

    public LocalDateTime getDateHeure() {
        return dateHeure;
    }

    public void setDateHeure(LocalDateTime dateHeure) {
        this.dateHeure = dateHeure;
    }
}