package com.Group5.procedures;

import static com.Group5.procedures.ResultsetConverter.*;

import java.sql.PreparedStatement;
import java.sql.SQLException;

import org.json.JSONArray;
import org.json.JSONObject;

public class Account {

	// Create a new student
	public static JSONObject addNewStudent(String login, String password, String name, String surname, String code)
			throws SQLException, ClassNotFoundException {
		PreparedStatement statement = initStatement("CALL AddStudent(?, ?, ?, ?, ?)");
		statement.setString(1, login);
		statement.setString(2, password);
		statement.setString(3, name);
		statement.setString(4, surname);
		statement.setString(5, code);
		return convertOne(statement.executeQuery());

	}

	// Create a new lecturer
	public static JSONObject addNewLecturer(String login, String password, String name, String surname)
			throws SQLException, ClassNotFoundException {
		PreparedStatement statement = initStatement("CALL AddLecturer(?, ?, ?, ?)");
		statement.setString(1, login);
		statement.setString(2, password);
		statement.setString(3, name);
		statement.setString(4, surname);
		return convertOne(statement.executeQuery());
	}

	// Remove an account
	public static void removeAccount(String login) throws SQLException, ClassNotFoundException {
		PreparedStatement statement = initStatement("CALL RemoveAccount(?)");
		statement.setString(1, login);
		statement.executeQuery();
	}

	// Modify information of an account
	public static JSONObject modifyAccount(String login, String name, String surname, int id)
			throws SQLException, ClassNotFoundException {
		PreparedStatement statement = initStatement("CALL ModifyAccount(?, ?, ?, ?)");
		statement.setString(1, login);
		statement.setString(2, name);
		statement.setString(3, surname);
		statement.setInt(4, id);
		return convertOne(statement.executeQuery());
	}

	// Modify information of a student
	public static JSONObject modifyStudent(String login, String name, String surname, int id, String code)
			throws SQLException, ClassNotFoundException {
		PreparedStatement statement = initStatement("CALL ModifyStudent(?, ?, ?, ?, ?)");
		statement.setString(1, login);
		statement.setString(2, name);
		statement.setString(3, surname);
		statement.setInt(4, id);
		statement.setString(5, code);
		return convertOne(statement.executeQuery());
	}
	
	// Get all students
	public static JSONArray getAllStudent () throws SQLException, ClassNotFoundException {
    	PreparedStatement statement = initStatement("call GetAllStudent()");
        return convertAll(statement.executeQuery());
    }

}
