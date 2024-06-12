package daos;

import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class PersistenceManagerSingleton {

	private static final String UNIDAD_PERSISTENCIA = "instituto";

	private static PersistenceManagerSingleton instance = null;

	private EntityManagerFactory emf;

	public static PersistenceManagerSingleton getInstance() {
		if (instance == null) {
			instance = new PersistenceManagerSingleton();
			}
		return instance;
	}

	public PersistenceManagerSingleton() {
	}

	public EntityManagerFactory getEntityManagerFactory() {
		if (emf == null) {
			emf = Persistence.createEntityManagerFactory(UNIDAD_PERSISTENCIA);
			}
		return emf;
	}

	public void closeEntityManagerFactory() {
		if (emf != null) {
			emf.close();
			emf = null;
		}else {
			System.out.println("Entity Manager Factory es nulo");
		}
	}
}
