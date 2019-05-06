package com.Group5.view;

import java.net.URI;
import java.sql.SQLException;

import javax.ws.rs.Consumes;
import javax.ws.rs.FormParam;
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

@Path("/view/delete_module/{id}")
public class DeleteModule{
    @POST
    public Response doPost(@PathParam("id") int moduleID) throws SQLException, ClassNotFoundException {
        Module.deleteModule(moduleID);
        return Response.seeOther(URI.create("/RegStudentExam/html/assisstant/modules.html")).build();
    }
}
