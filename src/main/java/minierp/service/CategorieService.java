package minierp.service;

import java.util.List;
import minierp.model.Categorie;

public interface CategorieService {

	Categorie save(String nomCategorie);

	Categorie update(Long id, String nomCategorie);

	void delete(Long id);

	List<Categorie> findAll();
}