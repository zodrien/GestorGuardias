package entitites;

import java.io.Serializable;
import javax.persistence.*;
import java.sql.Time;
import java.util.Date;


/**
 * The persistent class for the guardias database table.
 * 
 */
@Entity
@Table(name="guardias")
@NamedQuery(name="Guardia.findAll", query="SELECT g FROM Guardia g")
public class Guardia implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private String idguardia;

	private String apellido;

	private String aula;
	
	@Column(name = "COMPLETADA")
	private boolean completada;

	@Temporal(TemporalType.DATE)
	private Date fecha;

	private Time hora;

	private String nombre;

	//bi-directional many-to-one association to Profesor
	@ManyToOne
	@JoinColumn(name="idProfesor")
	private Profesor profesor;

	public Guardia() {
	}

	public String getIdguardia() {
		return this.idguardia;
	}

	public void setIdguardia(String idguardia) {
		this.idguardia = idguardia;
	}

	public String getApellido() {
		return this.apellido;
	}

	public void setApellido(String apellido) {
		this.apellido = apellido;
	}

	public String getAula() {
		return this.aula;
	}

	public void setAula(String aula) {
		this.aula = aula;
	}

	public boolean isCompletada() {
	    return completada;
	}

	public void setCompletada(boolean completada) {
	    this.completada = completada;
	}

	public Date getFecha() {
		return this.fecha;
	}

	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}

	public Time getHora() {
		return this.hora;
	}

	public void setHora(Time hora) {
		this.hora = hora;
	}

	public String getNombre() {
		return this.nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public Profesor getProfesor() {
		return this.profesor;
	}

	public void setProfesor(Profesor profesor) {
		this.profesor = profesor;
	}

}