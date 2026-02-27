package minierp.dao.impl;

import java.util.List;

import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;

import minierp.dao.ArticleDAO;
import minierp.model.Article;
import minierp.util.JPAUtil;

public class ArticleDAOImpl implements ArticleDAO {

    @Override
    public Article save(Article article) {
        EntityManager em = JPAUtil.getEntityManager();
        try {
            em.getTransaction().begin();
            em.persist(article);
            em.getTransaction().commit();
        } catch (Exception e) {
            em.getTransaction().rollback();
            e.printStackTrace();
        } finally {
            em.close(); // IMPORTANT
        }
        return article;
    }

    @Override
    public Article update(Article article) {
        EntityManager em = JPAUtil.getEntityManager();
        try {
            em.getTransaction().begin();
            article = em.merge(article);
            em.getTransaction().commit();
        } catch (Exception e) {
            em.getTransaction().rollback();
            e.printStackTrace();
        } finally {
            em.close(); // IMPORTANT
        }
        return article;
    }

    @Override
    public void delete(Long id) {
        EntityManager em = JPAUtil.getEntityManager();
        try {
            em.getTransaction().begin();
            Article a = em.find(Article.class, id);
            if (a != null) {
                em.remove(a);
            }
            em.getTransaction().commit();
        } catch (Exception e) {
            em.getTransaction().rollback();
            e.printStackTrace();
        } finally {
            em.close(); // IMPORTANT
        }
    }

    @Override
    public Article findById(Long id) {
        EntityManager em = JPAUtil.getEntityManager();
        Article article = null;
        try {
            article = em.find(Article.class, id);
        } finally {
            em.close(); // IMPORTANT
        }
        return article;
    }

    @Override
    public List<Article> findAll() {
        EntityManager em = JPAUtil.getEntityManager();
        List<Article> articles = null;
        try {
            TypedQuery<Article> query =
                em.createQuery("SELECT a FROM Article a", Article.class);
            articles = query.getResultList();
        } finally {
            em.close(); // IMPORTANT
        }
        return articles;
    }

    @Override
    public List<Article> findByCommande(Long idCommande) {
        EntityManager em = JPAUtil.getEntityManager();
        List<Article> articles = null;
        try {
            TypedQuery<Article> query = em.createQuery(
                "SELECT a FROM Article a WHERE a.commande.id = :idCommande",
                Article.class
            );
            query.setParameter("idCommande", idCommande);
            articles = query.getResultList();
        } finally {
            em.close(); // IMPORTANT
        }
        return articles;
    }
}