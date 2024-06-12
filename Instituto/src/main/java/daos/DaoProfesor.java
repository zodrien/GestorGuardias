package daos;

import java.sql.SQLException;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import entitites.Profesor;

public class DaoProfesor extends BaseJPADao {
	public DaoProfesor() {
		
	}
	
	public Profesor buscarProfesor(String email) throws SQLException, Exception{
		EntityManager em = getEntityManager();
		Profesor profesor = em.find(Profesor.class, email);
		em.close();
		return profesor;
	}
	public Profesor buscarProfesorNombre(String nombre, String apellidos) throws SQLException, Exception {
	    EntityManager em = getEntityManager();
	    Query query = em.createQuery("SELECT p FROM Profesor p WHERE p.nombre = :nombre AND p.apellidos = :apellidos");
	    query.setParameter("nombre", nombre);
	    query.setParameter("apellidos", apellidos);
	    Profesor profesor = (Profesor) query.getSingleResult(); // Suponiendo que solo hay un profesor con el mismo nombre y apellido
	    em.close();
	    return profesor;
	}
	
	
}
