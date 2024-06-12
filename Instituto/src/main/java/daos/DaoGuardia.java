package daos;

import java.sql.SQLException;
import java.sql.Time;
import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;

import entitites.Guardia;
import entitites.Profesor;


public class DaoGuardia extends BaseJPADao{
	public DaoGuardia () {
		
	}
	
	public List<Guardia> todasGuardias()  throws SQLException, Exception{
		EntityManager em = getEntityManager();
		String jpql = "SELECT g FROM Guardia g";
		List<Guardia> listaTodasGuardias = em.createQuery(jpql, Guardia.class).getResultList();
		return listaTodasGuardias;
		
	}
	public Guardia buscarGuardia(String idguardia) throws SQLException, Exception{
		EntityManager em = getEntityManager();
		Guardia guardia = em.find(Guardia.class, idguardia);
		em.close();
		return guardia;
	}
	
	public void borrarGuardia(String idguardia) throws SQLException, Exception {
	    EntityManager em = getEntityManager();
	    EntityTransaction transaction = null;

	    try {
	        transaction = em.getTransaction();
	        transaction.begin();

	        Guardia guardia = em.find(Guardia.class, idguardia);
	        if (guardia != null) {
	            em.remove(guardia);
	        }

	        transaction.commit();
	    } catch (Exception e) {
	        if (transaction != null && transaction.isActive()) {
	            transaction.rollback();
	        }
	        throw e;
	    } finally {
	        if (em != null && em.isOpen()) {
	            em.close();
	        }
	    }
	}
	
	public Guardia crearGuardia(String nombre, String apellido, String aula, Date fecha, Time hora, Profesor profesor) {
		EntityManager em = getEntityManager();
		EntityTransaction transaction = em.getTransaction(); 
		Guardia guardia = new Guardia();
		guardia.setNombre(nombre);
		guardia.setApellido(apellido);
		guardia.setAula(aula);
		guardia.setFecha(fecha);
		guardia.setHora(hora);
		guardia.setProfesor(profesor);
		guardia.setIdguardia("10");
        transaction.begin();
        em.persist(guardia);
        transaction.commit();
        em.close();
		return guardia;
	}
	
	public void updateGuardiaCompletada(String idguardia) throws SQLException, Exception {
	    EntityManager em = getEntityManager();
	    EntityTransaction transaction = null;

	    try {
	        transaction = em.getTransaction();
	        transaction.begin();

	        Guardia guardia = em.find(Guardia.class, idguardia);
	        if (guardia != null) {
	            guardia.setCompletada(true); 
	            em.merge(guardia);
	        }

	        transaction.commit();
	    } catch (Exception e) {
	        if (transaction != null && transaction.isActive()) {
	            transaction.rollback();
	        }
	        throw e; 
	    } finally {
	        if (em != null && em.isOpen()) {
	            em.close();
	        }
	    }
	}
	
	
}
