package minierp.service.impl;

import java.util.List;

import minierp.dao.CategorieDAO;
import minierp.dao.impl.CategorieDAOImpl;
import minierp.model.Categorie;
import minierp.service.CategorieService;

public class CategorieServiceImpl implements CategorieService {

	private CategorieDAO dao = new CategorieDAOImpl();

	@Override
	public Categorie save(String nomCategorie) {
		return dao.save(nomCategorie);
	}

	@Override
	public Categorie update(Long id, String nomCategorie) {

		Categorie c = dao.findById(id);
		if (c != null) {
			c.setNomCategorie(nomCategorie);
			return dao.update(c);
		}
		return null;
	}

	@Override
	public void delete(Long id) {
		dao.delete(id);
	}

	@Override
	public List<Categorie> findAll() {
		return dao.findAll();
	}

	@Override
	public Categorie findById(Long id) {
		return dao.findById(id);
	}
}