package minierp.dao.impl;

import java.util.List;

import minierp.dao.CategorieDAO;
import minierp.util.JPAUtil;
import minierp.model.Categorie;

import jakarta.persistence.EntityManager;

public class CategorieDAOImpl implements CategorieDAO {

	@Override
	public Categorie save(String nomCategorie) {

		EntityManager em = JPAUtil.getEntityManager();

		em.getTransaction().begin();

		Categorie c = new Categorie(nomCategorie);

		try {
			em.persist(c);
			em.getTransaction().commit();
			em.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return c;

	}

	@Override
	public Categorie update(Categorie categorie) {

		EntityManager em = JPAUtil.getEntityManager();

		try {
			em.getTransaction().begin();
			categorie = em.merge(categorie);
			em.getTransaction().commit();
		} finally {
			em.close();
		}

		return categorie;
	}

	@Override
	public void delete(Long id) {

		EntityManager em = JPAUtil.getEntityManager();

		try {
			em.getTransaction().begin();
			Categorie c = em.find(Categorie.class, id);
			if (c != null) {
				em.remove(c);
			}
			em.getTransaction().commit();
		} finally {
			em.close();
		}
	}

	@Override
	public Categorie findById(Long id) {

		EntityManager em = JPAUtil.getEntityManager();
		Categorie c = em.find(Categorie.class, id);
		em.close();
		return c;
	}

	@Override
	public List<Categorie> findAll() {

		EntityManager em = JPAUtil.getEntityManager();
		List<Categorie> list = em.createQuery("SELECT c FROM Categorie c", Categorie.class)
				.getResultList();
		em.close();
		return list;
	}
}
