package minierp.model;

import jakarta.persistence.*;

@Entity
@Table(name = "categorie")
public class Categorie {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	private String nomCategorie;

	public Categorie() {
	}

	public Categorie(String nomCategorie) {
		this.nomCategorie = nomCategorie;
	}

	public Long getId() {
		return id;
	}

	public String getNomCategorie() {
		return nomCategorie;
	}

	public void setNomCategorie(String nomCategorie) {
		this.nomCategorie = nomCategorie;
	}
}