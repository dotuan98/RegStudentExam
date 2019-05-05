package com.Group5;
import java.sql.SQLException;

import javax.ws.rs.*;
import javax.ws.rs.core.*;

@Path("/hello")
public class Hello {
	@GET
	public Response hello() {
		return Response.ok("HOOLOS").build();
	}
}
