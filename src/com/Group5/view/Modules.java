package com.Group5.view;


import org.json.JSONArray;
import com.Group5.procedures.Module;

import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import java.io.IOException;
import java.sql.SQLException;


@Path("/view/modules/")
public class Modules{

    @POST
    @Produces(MediaType.APPLICATION_JSON)
    public Response doPost() throws SQLException, ClassNotFoundException {
        JSONArray modules = Module.getAllModulesStudentAttend(1);
        return Response.ok(modules.toString()).build();
    }
}
