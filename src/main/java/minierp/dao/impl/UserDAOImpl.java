package minierp.dao.impl;

import minierp.dao.UserDAO;
import minierp.model.User;
import minierp.util.JPAUtil;

import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;

public class UserDAOImpl implements UserDAO {

    @Override
    public User findByEmailAndPassword(String email, String password) {

        EntityManager em = JPAUtil.getEntityManager();
        User user = null;

        try {
            TypedQuery<User> query = em.createQuery(
                "SELECT u FROM User u WHERE u.email = :email AND u.motDePasse = :password",
                User.class
            );

            query.setParameter("email", email);
            query.setParameter("password", password);

            user = query.getSingleResult();

        } catch (Exception e) {
            user = null;
        } finally {
            em.close();
        }

        return user;
    }
}