package com.Group5.procedures;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.json.JSONArray;

public class Module {
	static PreparedStatement initStatement (String statement) throws SQLException, ClassNotFoundException{
    	Class.forName("com.mysql.jdbc.Driver"); 
        String host="jdbc:mysql://localhost:3306/vgu1";
        String username="root";
        String password="123456";
        Connection conn = DriverManager.getConnection(host, username, password);
        return conn.prepareStatement(statement);
    }
	
	//Get all modules that a student attends
    public static JSONArray getAllModulesStudentAttend (int student_id) throws SQLException, ClassNotFoundException{
        PreparedStatement statement = initStatement("call GetAllModulesStudentAttend(?)");
        statement.setInt(1, student_id);
        ResultSet rs = statement.executeQuery();
        return ResultsetConverter.convertAll(rs);
    }
}
