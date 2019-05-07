package com.Group5.view;
import java.sql.SQLException;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import org.json.JSONArray;
import org.json.JSONObject;

import com.Group5.procedures.Module;

@Path("/view/get_module/{id}")
public class GetModule{

	@GET
    @Produces(MediaType.APPLICATION_JSON)
    public Response doGet(@PathParam("id") int moduleId) throws SQLException, ClassNotFoundException {
        JSONObject module = Module.getModule(moduleId);
        return Response.ok(module.toString()).build();
    }
}