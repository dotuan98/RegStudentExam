package com.Group5.procedures;

import static com.Group5.procedures.ResultsetConverter.*;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Time;

import org.json.JSONArray;
import org.json.JSONObject;

public class Session {
	//------------------ Basic Operation ------------------
	//Add session
    public static void addSession(Date ses_date, Time ses_start, Time ses_end, int mod_id) throws SQLException, ClassNotFoundException {
        PreparedStatement statement = initStatement("CALL AddSession(?,?,?,?)");
        statement.setDate(1, ses_date);
        statement.setTime(2, ses_start);
        statement.setTime(3, ses_end);
        statement.setInt(4, mod_id);
        statement.executeQuery();
    }
    
 // Modify session
    public static void modifySession(Date ses_date, Time ses_start, Time ses_end, int ses_id) throws SQLException, ClassNotFoundException {
        PreparedStatement statement = initStatement("CALL ModifySession(?,?,?,?)");
        statement.setDate(1, ses_date);
        statement.setTime(2, ses_start);
        statement.setTime(3, ses_end);
        statement.setInt(4, ses_id);
        statement.executeQuery();
    }
    
  //Remove session
    public static void removeSession(int ses_id) throws SQLException, ClassNotFoundException {
        PreparedStatement statement = initStatement("CALL RemoveSession(?)");
        statement.setInt(1, ses_id);
        statement.executeQuery();
    }
    
    // ------------------ Student - Session ------------------
    
 // A student sign a session ((Still has problem with time sign)
    public static void sign(int stud_id, int ses_id) throws SQLException, ClassNotFoundException {
        PreparedStatement statement = initStatement("CALL SignInSession(?,?)");
        statement.setInt(1, stud_id);
        statement.setInt(2, ses_id);
        statement.executeQuery();
    }
    
    
    //List all participated students of a session
    public static void listParticipatedStudentsOfSession( int ses_id) throws SQLException, ClassNotFoundException {
        PreparedStatement statement = initStatement("CALL ListParticipatedStudentsOfSession(?)");
        statement.setInt(1, ses_id);
        statement.executeQuery();
    }
    
    //List all absent students of a session
    public static void listAbsentStudentsOfSession( int ses_id) throws SQLException, ClassNotFoundException {
        PreparedStatement statement = initStatement("CALL ListAbsentStudentsOfSession(?)");
        statement.setInt(1, ses_id);
        statement.executeQuery();
    }
    
    
    
    // ------------------ Module - Session ------------------
    
    //List all sessions of a module
    public static JSONArray listAllSessionsOfModule(int mod_id) throws SQLException, ClassNotFoundException {
        PreparedStatement statement = initStatement("CALL ListAllSessionsOfModule(?)");
        statement.setInt(1, mod_id);
        return convertAll(statement.executeQuery());
    }
}
