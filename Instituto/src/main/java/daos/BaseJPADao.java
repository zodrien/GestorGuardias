package daos;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;

public class BaseJPADao {
	
	public BaseJPADao() {
	}
	public static EntityManager getEntityManager() {
		EntityManagerFactory emf = PersistenceManagerSingleton.getInstance().getEntityManagerFactory();
		return emf.createEntityManager();
	}

}
