package com.Group5.procedures;

import static com.Group5.procedures.ResultsetConverter.*;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Time;

import org.json.JSONArray;
import org.json.JSONObject;

public class Exam {
	//public static Date currDate = new Date();

	// ------------------ Basic Operation ------------------

	// Add exam
	public static void addExam(Date exam_deadline, Date exam_date, Time exam_from, Time exam_to, int moduleID)
			throws SQLException, ClassNotFoundException {
		PreparedStatement statement = initStatement("CALL AddExam(?, ?, ?, ?, ?)");
		statement.setDate(1, exam_deadline);
		statement.setDate(2, exam_date);
		statement.setTime(3, exam_from);
		statement.setTime(4, exam_to);
		statement.setInt(5, moduleID);
		statement.executeQuery();
	}

	// Remove exam
	public static void removeExam(int exam_id) throws SQLException, ClassNotFoundException {
		PreparedStatement statement = initStatement("CALL RemoveExam(?)");
		statement.setInt(1, exam_id);
		statement.executeQuery();
	}

	// Modify exam
	public static void modifyExam(Date exam_deadline, Date exam_date, Time exam_from, Time exam_to, int exam_id)
			throws SQLException, ClassNotFoundException {
		PreparedStatement statement = initStatement("CALL ModifyExam (?, ?, ?, ?, ?, ?)");
		statement.setDate(1, exam_deadline);
		statement.setDate(2, exam_date);
		statement.setTime(3, exam_from);
		statement.setTime(4, exam_to);
		statement.setInt(5, exam_id);
		statement.executeQuery();
	}

	// ------------------ Student - Exam ------------------
	// A student register for an exam
	public static void registerExam(int student_id, int exam_id) throws SQLException, ClassNotFoundException {
		PreparedStatement statement = initStatement("CALL RegisterStudentForExam(?,?)");
		statement.setInt(1, student_id);
		statement.setInt(2, exam_id);
		statement.executeQuery();
	}

	// Unregister a student for an exam
	public static void cancelExam(int student_id, int exam_id) throws SQLException, ClassNotFoundException {
		PreparedStatement statement = initStatement("CALL UnregisterExam(?,?)");
		statement.setInt(1, student_id);
		statement.setInt(2, exam_id);
		statement.executeQuery();
	}

	// Get participant list of an exam
	public static JSONArray getParticipantsOfExam(int exam_id) throws SQLException, ClassNotFoundException {
		PreparedStatement statement = initStatement("CALL GetParticipantsOfExam(?)");
		statement.setInt(1, exam_id);
		return convertAll(statement.executeQuery());
	}

	// Student sees registered exams in a semester
	public static JSONArray viewRegisteredExam(int student_id) throws SQLException, ClassNotFoundException {
		PreparedStatement statement = initStatement("CALL RegisteredExamsOfStudent(?)");
		statement.setInt(1, student_id);
		return convertAll(statement.executeQuery());
	}
	
	// List available exams for student to register
	public static JSONArray listAvailableExams(int student_id, java.sql.Date currDate) throws SQLException, ClassNotFoundException {
		PreparedStatement statement = initStatement("CALL ListAvailableExams(?, ?)");
		statement.setInt(1, student_id);
		statement.setDate(2, currDate);
		return convertAll(statement.executeQuery());
	}
	public static JSONArray listCancellableExams(int student_id) throws SQLException, ClassNotFoundException {
		PreparedStatement statement = initStatement("CALL ListCancellableExams(?)");
		statement.setInt(1, student_id);
		//statement.setDate(2, currDate);
		return convertAll(statement.executeQuery());
	}

	// ------------------ Semester - Exam ------------------
	
	//List all exams of a semester
	public static JSONArray listExamsOfSemester(int exam_id) throws SQLException, ClassNotFoundException {
		PreparedStatement statement = initStatement("CALL ListExamsOfSemester(?)");
		statement.setInt(1, exam_id);
		return convertAll(statement.executeQuery());
	}
}
