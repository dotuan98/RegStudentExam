 package com.Group5.view;

import java.sql.SQLException;

import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import org.json.JSONArray;

import com.Group5.procedures.Account;
import com.Group5.procedures.Module;

@Path("/view/check_student_attendances_of_module/{id}")
public class CheckStudentAttendancesOfModule {

	@GET
    @Produces(MediaType.APPLICATION_JSON)
    public Response doPost(@PathParam("id") int moduleID) throws SQLException, ClassNotFoundException {
        JSONArray modules = Module.checkStudentAttendancesofModule(3, moduleID);
        return Response.ok(modules.toString()).build();
    }
}