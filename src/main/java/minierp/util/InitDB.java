package minierp.util;

import minierp.model.User;
import minierp.util.JPAUtil;

import jakarta.persistence.EntityManager;

public class InitDB {
    public static void main(String[] args) {
        EntityManager em = JPAUtil.getEntityManager();
        em.getTransaction().begin();

        // Crée un utilisateur test pour déclencher la création de table
        User u = new User("Commerciale", "commerciale@mini_erp.com", "root", "COM");
        em.persist(u);

        em.getTransaction().commit();
        em.close();

        System.out.println("Tables créées et utilisateur persistant !");
    }
}