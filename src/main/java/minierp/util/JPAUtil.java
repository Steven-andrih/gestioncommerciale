package minierp.util;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

public class JPAUtil {

	private static final EntityManagerFactory emf =
	        Persistence.createEntityManagerFactory("MiniErpPU");
	static {
	    System.out.println("EntityManagerFactory created");
	}

    public static EntityManager getEntityManager() {
        return emf.createEntityManager();
    }
    
    public static EntityManagerFactory getEntityManagerFactory() {
        return emf;
    }
    
    static {
        System.out.println("EMF initialized for MiniErpPU");
    }
}