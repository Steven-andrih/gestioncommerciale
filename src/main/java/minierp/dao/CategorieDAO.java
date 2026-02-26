package minierp.dao;

import minierp.model.Categorie;
import java.util.List;

public interface CategorieDAO {

	Categorie save(String nomCategorie);

	Categorie update(Categorie categorie);

	void delete(Long id);

	Categorie findById(Long id);

	List<Categorie> findAll();
}
