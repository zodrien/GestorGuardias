package entitites;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the profesor database table.
 * 
 */
@Entity
@NamedQuery(name="Profesor.findAll", query="SELECT p FROM Profesor p")
public class Profesor implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private String email;

	private String apellidos;

	private String contraseña;

	private String idProfesor;

	private String nombre;

	private int numeroGuardias;

	//bi-directional many-to-one association to Guardia
	@OneToMany(mappedBy="profesor")
	private List<Guardia> guardias;

	public Profesor() {
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getApellidos() {
		return this.apellidos;
	}

	public void setApellidos(String apellidos) {
		this.apellidos = apellidos;
	}

	public String getContraseña() {
		return this.contraseña;
	}

	public void setContraseña(String contraseña) {
		this.contraseña = contraseña;
	}

	public String getIdProfesor() {
		return this.idProfesor;
	}

	public void setIdProfesor(String idProfesor) {
		this.idProfesor = idProfesor;
	}

	public String getNombre() {
		return this.nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public int getNumeroGuardias() {
		return this.numeroGuardias;
	}

	public void setNumeroGuardias(int numeroGuardias) {
		this.numeroGuardias = numeroGuardias;
	}

	public List<Guardia> getGuardias() {
		return this.guardias;
	}

	public void setGuardias(List<Guardia> guardias) {
		this.guardias = guardias;
	}

	public Guardia addGuardia(Guardia guardia) {
		getGuardias().add(guardia);
		guardia.setProfesor(this);

		return guardia;
	}

	public Guardia removeGuardia(Guardia guardia) {
		getGuardias().remove(guardia);
		guardia.setProfesor(null);

		return guardia;
	}

}