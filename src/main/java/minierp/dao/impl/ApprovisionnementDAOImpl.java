package minierp.dao.impl;

import java.util.List;

import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;

import minierp.dao.ApprovisionnementDAO;
import minierp.model.Approvisionnement;
import minierp.util.JPAUtil;

public class ApprovisionnementDAOImpl implements ApprovisionnementDAO {

    EntityManager em = JPAUtil.getEntityManager();

    @Override
    public Approvisionnement save(Approvisionnement approvisionnement) {
        try {
            em.getTransaction().begin();
            em.persist(approvisionnement);
            em.getTransaction().commit();
        } catch (Exception e) {
            em.getTransaction().rollback();
            e.printStackTrace();
        }
        return approvisionnement;
    }

    @Override
    public Approvisionnement update(Approvisionnement approvisionnement) {
        try {
            em.getTransaction().begin();
            approvisionnement = em.merge(approvisionnement);
            em.getTransaction().commit();
        } catch (Exception e) {
            em.getTransaction().rollback();
            e.printStackTrace();
        }
        return approvisionnement;
    }

    @Override
    public void delete(Long id) {
        try {
            em.getTransaction().begin();
            Approvisionnement a = em.find(Approvisionnement.class, id);
            if (a != null)
                em.remove(a);
            em.getTransaction().commit();
        } catch (Exception e) {
            em.getTransaction().rollback();
            e.printStackTrace();
        }
    }

    @Override
    public Approvisionnement findById(Long id) {
        return em.find(Approvisionnement.class, id);
    }

    @Override
    public List<Approvisionnement> findAll() {
        TypedQuery<Approvisionnement> query =
                em.createQuery("SELECT a FROM Approvisionnement a", Approvisionnement.class);
        return query.getResultList();
    }

    @Override
    public List<Approvisionnement> findByProduitId(Long produitId) {
        TypedQuery<Approvisionnement> query =
                em.createQuery(
                    "SELECT a FROM Approvisionnement a WHERE a.produit.id = :id",
                    Approvisionnement.class
                );
        query.setParameter("id", produitId);
        return query.getResultList();
    }
}