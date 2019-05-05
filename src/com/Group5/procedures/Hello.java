package com.Group5.procedures;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
@Path("/hello")

public class Hello {
	@GET
	public String hello() {
		return "hello";
		//return StoredProcedure.getAllModulesStudentAttend(1).toString();
	}
}
