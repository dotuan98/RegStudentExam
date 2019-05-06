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
    
    public static JSONArray listAllModules() throws SQLException, ClassNotFoundException{
        PreparedStatement statement = initStatement("call ListAllModules()");
        return ResultsetConverter.convertAll(statement.executeQuery());
    }
    
    public static void addModule(String moduleName, String moduleCode, int semesterId) throws SQLException, ClassNotFoundException {
        PreparedStatement statement = initStatement("CALL AddModule(?, ?, ?)");
        statement.setString(1, moduleName);
        statement.setString(2, moduleCode);
        statement.setInt(3, semesterId);
        statement.executeQuery();
    }
    
    public static void deleteModule(int moduleId) throws SQLException, ClassNotFoundException {
        PreparedStatement statement = initStatement("CALL DeleteModule(?)");
        statement.setInt(1, moduleId);
        statement.executeQuery();
    }   
}
