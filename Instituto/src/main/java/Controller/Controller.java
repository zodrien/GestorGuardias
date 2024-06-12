package Controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.io.IOException;
import java.math.BigDecimal;
import java.sql.SQLException;
import java.sql.Time;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.persistence.EntityManager;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import daos.BaseJPADao;
import daos.DaoGuardia;
import daos.DaoProfesor;
import entitites.Guardia;
import entitites.Profesor;





/**
 * Servlet implementation class Controller
 */
@WebServlet("/Controller")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Controller() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		String op = request.getParameter("op");
		DaoProfesor daoProfesor = new DaoProfesor();
		DaoGuardia daoGuardia = new DaoGuardia();
		Profesor profesor = null;
		Guardia guardia = null;
		List <Guardia> listaGuardias = null;
		List <Guardia> listaTodasGuardias = null;
		String msgError = null;
		BaseJPADao baseJpaDao = new BaseJPADao();

		switch (op) {
		case "inicio":
			
			request.getRequestDispatcher("web.jsp").forward(request, response);
			break;
			
		case "login":
			String email = request.getParameter("email");
			String contraseña = request.getParameter("pass");
			
			
			try {
				profesor = daoProfesor.buscarProfesor(email);
				if (profesor == null) {
				    msgError = "Email incorrecto";
				    session.setAttribute("msgError", msgError);
				    request.getRequestDispatcher("web.jsp").forward(request, response);
				} else if (profesor != null) {
				    String matchingPass = profesor.getContraseña();
				    if (!contraseña.equals(matchingPass) ) {
				        msgError = "Contraseña incorrecta";
				        session.setAttribute("msgError", msgError);
				        request.getRequestDispatcher("web.jsp").forward(request, response);
				    } else {
				        // Lógica para el inicio de sesión exitoso
				    	session.removeAttribute("msgError");
				        session.setAttribute("profesor", profesor);
				        request.getRequestDispatcher("home.jsp").forward(request, response);
				    }
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
			
		case "logout":

			session.removeAttribute("profesor");
			request.getRequestDispatcher("web.jsp").forward(request, response);

			break;
		
		case "vaGuardias":
				profesor = (Profesor) session.getAttribute("profesor");
				String jpql = "SELECT g FROM Guardia g WHERE g.profesor = :profesor";
				
				EntityManager em = BaseJPADao.getEntityManager();
				listaGuardias = em.createQuery(jpql, Guardia.class)
				                                  .setParameter("profesor", profesor)
				                                  .getResultList();
				listaGuardias = profesor.getGuardias();
				session.setAttribute("listaGuardias",listaGuardias);
				//session.removeAttribute("listaTodasGuardias");
				request.getRequestDispatcher("home.jsp").forward(request, response);
			break;
		case "vaTodasGuardias":
			profesor = (Profesor) session.getAttribute("profesor");
			try {
				listaTodasGuardias = daoGuardia.todasGuardias();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			//session.removeAttribute("listaGuardias");
			request.getRequestDispatcher("home.jsp").forward(request, response);
		break;
		case "vaAnadir":
			request.getRequestDispatcher("nuevasGuardias.jsp").forward(request, response);
			break;
			
		case "vaNuevaGuardia":
			String nombre = request.getParameter("nombre");
			String apellido = request.getParameter("apellido");
			String aula = request.getParameter("aula");
			String fechaStr = request.getParameter("fecha");
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			String horaStr = request.getParameter("hora");
			SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm");
			
			try {
				Date fecha = dateFormat.parse(fechaStr);
				Date date = timeFormat.parse(horaStr); // conviertess a tipo date
				Time hora = new Time(date.getTime()); // de aqui sacas ahora la hora. Conversiones necesarias por mismatch de tipos
				profesor = daoProfesor.buscarProfesorNombre(nombre, apellido);
				//daoGuardia.crearGuardia(nombre, apellido, aula, fecha, hora, profesor.getIdProfesor());
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			request.getRequestDispatcher("home.jsp").forward(request, response);
			break;

		case "vueltaInicio":
			session.removeAttribute("listaGuardias");
			session.removeAttribute("listaTodasGuardias");
			request.getRequestDispatcher("home.jsp").forward(request, response);
			break;
	
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
