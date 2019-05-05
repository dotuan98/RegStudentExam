package com.Group5.procedures;

import static com.Group5.procedures.ResultsetConverter.*;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import org.json.JSONArray;
import org.json.JSONObject;

public class Module {

	// ------------------ Basic Operation ------------------
	// Add module
	public static void addModule(String mod_name, String mod_code, int sem_id)
			throws SQLException, ClassNotFoundException {
		PreparedStatement statement = initStatement("CALL AddModule(?, ?, ?)");
		statement.setString(1, mod_name);
		statement.setString(2, mod_code);
		statement.setInt(3, sem_id);
		statement.executeQuery();
	}

	// Modify module
	public static void modifyModule(String mod_name, String mod_code, int sem_id)
			throws SQLException, ClassNotFoundException {
		PreparedStatement statement = initStatement("CALL ModifyModule(?, ?, ?)");
		statement.setString(1, mod_name);
		statement.setString(2, mod_code);
		statement.setInt(3, sem_id);
		statement.executeQuery();
	}

	// Remove module
	public static void removeModule(int mod_id) throws SQLException, ClassNotFoundException {
		PreparedStatement statement = initStatement("CALL RemoveModule(?)");
		statement.setInt(1, mod_id);
		statement.executeQuery();
	}

	// Get all of modules
	public static JSONArray listAllModules() throws SQLException, ClassNotFoundException {
		PreparedStatement statement = initStatement("CALL GetAllModule()");
		return ResultsetConverter.convertAll(statement.executeQuery());
	}

	// Get a Module
	public static JSONObject getModule(int mod_id) throws SQLException, ClassNotFoundException {
		PreparedStatement statement = initStatement("CALL GetModule(?)");
		statement.setInt(1, mod_id);
		return convertOne(statement.executeQuery());
	}

	// ------------------ Student - Modules ------------------
	// Get all modules that a student attends
	public static JSONArray getAllModulesStudentAttend(int student_id) throws SQLException, ClassNotFoundException {
		PreparedStatement statement = initStatement("call GetAllModulesStudentAttend(?)");
		statement.setInt(1, student_id);
		return ResultsetConverter.convertAll(statement.executeQuery());
	}

	// ------------------ Lecturer - Modules ------------------
	// Assign a lecturer to teach a module
	public static void assignLecturerToModule(int lec_id, int mod_id) throws SQLException, ClassNotFoundException {
		PreparedStatement statement = initStatement("CALL AssignLecturerToModule(?, ?)");
		statement.setInt(1, lec_id);
		statement.setInt(2, mod_id);
		statement.executeQuery();
	}

	// Remove a lecturer of a module
	public static void removeLecturerOfModule(int lec_id, int mod_id) throws SQLException, ClassNotFoundException {
		PreparedStatement statement = initStatement("CALL RemoveLecturerOfModule(?, ?)");
		statement.setInt(1, lec_id);
		statement.setInt(2, mod_id);
		statement.executeQuery();
	}
}
