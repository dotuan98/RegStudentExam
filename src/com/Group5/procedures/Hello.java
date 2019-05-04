package com.Group5.procedures;
import java.sql.SQLException;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
@Path("/hello")

public class Hello {
	@GET
	public String hello() throws ClassNotFoundException, SQLException {
		if (StoredProcedure.checkAccountExist("tuan", "123456") != null) {
			return "true";
		} else {
			return "Hello";
		}
		
	}
}
