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

@Path("/view/modify_module/{module-id}")
public class ModifyModule {
    @POST
    @Consumes(MediaType.APPLICATION_FORM_URLENCODED)
    //@Produces(MediaType.APPLICATION_JSON)
    public Response doPost(@FormParam("module-name") String moduleName,
                           @FormParam("module-code") String moduleCode,
                           @FormParam("semester-id") int semesterID,
                           @PathParam("module-id") int moduleID) throws SQLException, ClassNotFoundException {
    	System.out.println("lnnnn");
        Module.modifyModule(moduleName, moduleCode, semesterID, moduleID);
        return Response.seeOther(URI.create("/RegStudentExam/html/assistant/modules.html")).build();
    }
}

