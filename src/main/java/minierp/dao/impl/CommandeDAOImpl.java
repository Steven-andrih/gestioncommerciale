package minierp.dao.impl;

import java.util.List;
import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;

import minierp.dao.CommandeDAO;
import minierp.model.Commande;
import minierp.util.JPAUtil;

public class CommandeDAOImpl implements CommandeDAO {

    EntityManager em = JPAUtil.getEntityManager();

    @Override
    public Commande save(Commande commande) {
        try {
            em.getTransaction().begin();
            em.persist(commande);
            em.getTransaction().commit();
        } catch (Exception e) {
            em.getTransaction().rollback();
            e.printStackTrace();
        }
        return commande;
    }

    @Override
    public Commande update(Commande commande) {
        try {
            em.getTransaction().begin();
            commande = em.merge(commande);
            em.getTransaction().commit();
        } catch (Exception e) {
            em.getTransaction().rollback();
            e.printStackTrace();
        }
        return commande;
    }

    @Override
    public void delete(Long id) {
        try {
            em.getTransaction().begin();
            Commande c = em.find(Commande.class, id);
            if (c != null)
                em.remove(c);
            em.getTransaction().commit();
        } catch (Exception e) {
            em.getTransaction().rollback();
            e.printStackTrace();
        }
    }

    @Override
    public Commande findById(Long id) {
        return em.find(Commande.class, id);
    }

    @Override
    public List<Commande> findAll() {
        TypedQuery<Commande> query = em.createQuery("SELECT c FROM Commande c", Commande.class);
        return query.getResultList();
    }

    @Override
    public List<Commande> findByUserId(Long userId) {
        TypedQuery<Commande> query = em.createQuery(
            "SELECT c FROM Commande c WHERE c.user.id = :id", Commande.class);
        query.setParameter("id", userId);
        return query.getResultList();
    }
}