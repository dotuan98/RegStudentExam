package com.Group5.view;

import java.sql.SQLException;

import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import org.json.JSONArray;

import com.Group5.procedures.Account;
import com.Group5.procedures.Module;

@Path("/assisstant")
public class Accounts {
	
	@Path("/students")
	@POST
	@Produces(MediaType.APPLICATION_JSON)
	public Response getAllStudents() throws SQLException, ClassNotFoundException {
        JSONArray modules = Account.getAllStudent();
        return Response.ok(modules.toString()).build();
    }
	

}
