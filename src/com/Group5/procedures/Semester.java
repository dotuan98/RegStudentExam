package com.Group5.procedures;

import static com.Group5.procedures.ResultsetConverter.*;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import org.json.JSONArray;
import org.json.JSONObject;

public class Semester {
	
	//------------------ Basic Operation ------------------
	// Add a new semester
	public static JSONObject addSemester(Date sem_start, Date sem_end) throws SQLException, ClassNotFoundException {
        PreparedStatement statement = initStatement("CALL AddSemester(?, ?)");
        statement.setDate(1, sem_start);
        statement.setDate(2, sem_end);
        return convertOne(statement.executeQuery());
    }
	
	// Modify semester
	public static void modifySemester(int sem_id, Date sem_start, Date sem_end) throws SQLException, ClassNotFoundException {
        PreparedStatement statement = initStatement("CALL ModifySemester(?, ?, ?)");
        statement.setInt(1, sem_id);
        statement.setDate(1, sem_start);
        statement.setDate(2, sem_end);
        statement.executeQuery();
    }
	
	//Remove semester
	public static void removeSemester(int sem_id) throws SQLException, ClassNotFoundException {
		PreparedStatement statement = initStatement("CALL RemoveSemester(?)");
		statement.setInt(1, sem_id);
		statement.executeQuery();
	}
	
	//Get all semester
	public static JSONArray getAllSemester() throws SQLException, ClassNotFoundException {
        PreparedStatement statement = initStatement("CALL GetAllSemester()");
        return convertAll(statement.executeQuery());
    }
	
	//Get a semester
	public static JSONObject getSemester(int semesterId) throws SQLException, ClassNotFoundException {
        PreparedStatement statement = initStatement("CALL GetSemester(?)");
        statement.setInt(1, semesterId);
        return convertOne(statement.executeQuery());
    }
	
}
