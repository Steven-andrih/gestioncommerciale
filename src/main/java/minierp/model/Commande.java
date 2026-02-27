package minierp.model;

import jakarta.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "commande")
public class Commande {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    // Relation ManyToOne avec User
    @ManyToOne
    @JoinColumn(name = "id_user", nullable = false)
    private User user;

    // Etat : en_traitement ou valide
    private String etat;

    private double montantTotal;

    private String nomClient;

    private LocalDateTime dateHeure;

    public Commande() {}

    // Constructeur simple (sans id et dateHeure)
    public Commande(User user, String etat, double montantTotal, String nomClient) {
        this.user = user;
        this.etat = etat;
        this.montantTotal = montantTotal;
        this.nomClient = nomClient;
    }

    // 🔥 Auto date avant persistance
    @PrePersist
    public void prePersist() {
        if (this.dateHeure == null) {
            this.dateHeure = LocalDateTime.now();
        }
    }

    // GETTERS & SETTERS
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }


    public User getUser() { return user; }
    public void setUser(User user) { this.user = user; }

    public String getEtat() { return etat; }
    public void setEtat(String etat) { this.etat = etat; }

    public double getMontantTotal() { return montantTotal; }
    public void setMontantTotal(double montantTotal) { this.montantTotal = montantTotal; }

    public String getNomClient() { return nomClient; }
    public void setNomClient(String nomClient) { this.nomClient = nomClient; }

    public LocalDateTime getDateHeure() { return dateHeure; }
    public void setDateHeure(LocalDateTime dateHeure) { this.dateHeure = dateHeure; }
}