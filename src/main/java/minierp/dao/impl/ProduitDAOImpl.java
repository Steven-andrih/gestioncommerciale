package minierp.dao.impl;

import java.util.List;

import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;

import minierp.dao.ProduitDAO;
import minierp.model.Produit;
import minierp.util.JPAUtil;

public class ProduitDAOImpl implements ProduitDAO {

    @Override
    public Produit save(Produit produit) {
        EntityManager em = JPAUtil.getEntityManager();

        try {
            em.getTransaction().begin();
            em.persist(produit);
            em.getTransaction().commit();
        } catch (Exception e) {
            em.getTransaction().rollback();
            e.printStackTrace();
        }
        return produit;
    }

    @Override
    public Produit update(Produit produit) {
        EntityManager em = JPAUtil.getEntityManager();

        try {
            em.getTransaction().begin();
            produit = em.merge(produit);
            em.getTransaction().commit();
            System.out.println("Mis à jour éffectuer !");

        } catch (Exception e) {
            em.getTransaction().rollback();
            e.printStackTrace();
        }
        return produit;
    }

    @Override
    public void delete(Long id) {
        EntityManager em = JPAUtil.getEntityManager();

        try {
            em.getTransaction().begin();
            Produit p = em.find(Produit.class, id);
            if (p != null)
                em.remove(p);
            em.getTransaction().commit();
        } catch (Exception e) {
            em.getTransaction().rollback();
            e.printStackTrace();
        }
    }

    @Override
    public Produit findById(Long id) {
        EntityManager em = JPAUtil.getEntityManager();

        return em.find(Produit.class, id);
    }

    @Override
    public List<Produit> findAll() {
        EntityManager em = JPAUtil.getEntityManager();

        TypedQuery<Produit> query = em.createQuery("SELECT p FROM Produit p", Produit.class);
        return query.getResultList();
    }
}