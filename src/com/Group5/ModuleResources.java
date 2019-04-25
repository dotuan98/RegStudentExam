package com.Group5;

import java.sql.SQLException;
import com.Group5.StoredProcedure;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
@Path("/test")

public class ModuleResources {
	@GET

	public String getAllModulesStudentAttend() throws SQLException, ClassNotFoundException {
  
         return StoredProcedure.getAllModulesStudentAttend(2).toString();

    }
	
	
}



