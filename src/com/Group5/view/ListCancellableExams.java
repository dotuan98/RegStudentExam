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
import com.Group5.procedures.Exam;
import com.Group5.procedures.Module;

@Path("/view/list_cancellable_exams")
public class ListCancellableExams {

	@GET
    @Produces(MediaType.APPLICATION_JSON)
    public Response doPost() throws SQLException, ClassNotFoundException {
        JSONArray exams = Exam.listCancellableExams(1);
        return Response.ok(exams.toString()).build();
    }
}
