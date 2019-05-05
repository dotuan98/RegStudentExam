package com.Group5.procedures;

import java.sql.SQLException;

import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Response;
import javax.ws.rs.core.MediaType;

import org.json.JSONArray;
@Path("/hi")

public class Hi {
	@POST
	@Produces(MediaType.APPLICATION_JSON)
	//@Produces(MediaType.TEXT_HTML)
	/*public String hello() {
		return "hello";
		//return StoredProcedure.getAllModulesStudentAttend(1).toString();
	}*/
	public Response doPost() throws SQLException, ClassNotFoundException {
        JSONArray modules = Account.getAllStudent();
        return Response.ok(modules.toString()).build();
    }
	/*public String doGet() throws ClassNotFoundException, SQLException {
		JSONArray modules = Account.getAllStudent();
		return modules.toString();
	}*/
}