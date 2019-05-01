package com.Group5;

//import java.sql.Date;
import java.sql.SQLException;
import com.Group5.StoredProcedure;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//import org.json.JSONArray;
@Path("/module")
@WebServlet("/ModuleResources")
//import org.json.JSONArray;


public class ModuleResources extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public ModuleResources() {
        super();
        // TODO Auto-generated constructor stub
    }
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/plain");
		PrintWriter out = response.getWriter();
		String action = request.getParameter("action");
		if (action.equals("demo1")) {
			String fullname = request.getParameter("fullname");
			out.print("Hello " + fullname);
		} else if (action.equals("demo2")) {
			int number1 = Integer.parseInt(request.getParameter("number1"));
			int number2 = Integer.parseInt(request.getParameter("number2"));
			out.print(number1+number2);
		} else if (action.equals("test")) {
			try {
				int studentId = Integer.parseInt(request.getParameter("student_id"));
				//int number1 = Integer.parseInt(request.getParameter("number1"));
				out.println(studentId);
				out.println(StoredProcedure.getAllModulesStudentAttend(studentId).toString());
				//out.println(StoredProcedure.getAllModulesStudentAttend(1).toString());
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if (action.equals("login")) {
			String username = request.getParameter("username");
			String password = request.getParameter("password");
						
			try {
				if (StoredProcedure.checkAccountExist(username, password).toString().equals("[{\"1\":1}]")) {
					out.print("true");
				} else {
					out.print("false");
				}
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	}/*
	@POST
	public String getAllModulesStudentAttend() throws SQLException, ClassNotFoundException {
  
         return StoredProcedure.getAllModulesStudentAttend(1).toString();

    }*/
	/*
	@Path("/student/{studentId}")
	@GET
	public String getAllModulesStudentAttends(@PathParam("studentId") int student_id) throws ClassNotFoundException, SQLException {
	    return StoredProcedure.getAllModulesStudentAttend(student_id).toString();
	}
	
	@Path("/semester/{semesterId}")
	@GET	
	@Produces("application/json")
	public String getAllModulesInSemester(@PathParam("semesterId") int semester_id) throws ClassNotFoundException, SQLException {
	    return StoredProcedure.getAllModulesInSemester(semester_id).toString();
	}*/
	
}



