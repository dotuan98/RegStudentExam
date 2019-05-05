package com.Group5.procedures;
import static com.Group5.procedures.ResultsetConverter.*;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import org.json.JSONArray;

public class Module {
	
	// ------------------ Student - Modules ------------------
	//Get all modules that a student attends
    public static JSONArray getAllModulesStudentAttend (int student_id) throws SQLException, ClassNotFoundException{
        PreparedStatement statement = initStatement("call ListModulesOfStudent(?)");
        statement.setInt(1, student_id);
        return ResultsetConverter.convertAll(statement.executeQuery());
    }
}
