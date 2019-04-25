package com.Group5;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
@Path("/hello")

public class Hello {
	@GET
	public String hello() {
		return "Hello";
	}
}
