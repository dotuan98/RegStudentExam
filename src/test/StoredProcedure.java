package test;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.sql.*;

public class StoredProcedure {
    static PreparedStatement initStatement (String statement) throws SQLException, ClassNotFoundException{
    	Class.forName("com.mysql.jdbc.Driver"); 
        String host="jdbc:mysql://localhost:3306/vgu1";
        String username="root";
        String password="123456";
        Connection conn = DriverManager.getConnection(host, username, password);
        return conn.prepareStatement(statement);
    }
    
    static JSONArray countStudentAttendanceOfModule(String student_name, String module_name) throws SQLException, ClassNotFoundException {
        PreparedStatement statement = initStatement("call StudentCountAttendanceOfModule(?, ?)");
        statement.setString(1,student_name);
        statement.setString(2,module_name);
        ResultSet rs = statement.executeQuery();
        return ResultsetConverter.convertAll(rs);
    }
    static JSONArray getStudentRegExam(String student_name) throws SQLException, ClassNotFoundException {
        PreparedStatement statement = initStatement("call GetStudentRegExam(?)");
        statement.setString(1,student_name);
        ResultSet rs = statement.executeQuery();
        return ResultsetConverter.convertAll(rs);
    }
    /*static JSONArray getAllExamsOverlappedInDay(Date exam_date) throws SQLException {
        PreparedStatement statement = initStatement("call GetStudentRegExam(?)");
        statement.setDate(1,exam_date);
        ResultSet rs = statement.executeQuery();
        return ResultsetConverter.convertAll(rs);
    }*/

    static JSONArray listAbsentStudentsOfSession(int session_id) throws SQLException, ClassNotFoundException {
        PreparedStatement statement = initStatement("call ListAbsentStudentsOfSession(?)");
        statement.setInt(1,session_id);
        ResultSet rs = statement.executeQuery();
        return ResultsetConverter.convertAll(rs);
    }
    
    static JSONArray listParticipatedStudentsOfSession(int session_id) throws SQLException, ClassNotFoundException {
        PreparedStatement statement = initStatement("call ListParticipatedStudentsOfSession(?)");
        statement.setInt(1,session_id);
        ResultSet rs = statement.executeQuery();
        return ResultsetConverter.convertAll(rs);
    }

    static void removeSessionInModel(Date session_date, Time session_from, Time session_to, int module_id) throws SQLException, ClassNotFoundException{
        PreparedStatement statement = initStatement("call RemoveSessionInModel(?, ?, ?, ?)");
        statement.setDate(1, session_date);
        statement.setTime(2, session_from);
        statement.setTime(3, session_to);
        statement.setInt(4, module_id);
        statement.executeQuery();
    }

    //Modules procedures
    
    //Get all modules that a student attends
    static JSONArray getAllModulesStudentAttend (int student_id) throws SQLException, ClassNotFoundException{
        PreparedStatement statement = initStatement("call GetAllModulesStudentAttend(?)");
        statement.setInt(1, student_id);
        ResultSet rs = statement.executeQuery();
        return ResultsetConverter.convertAll(rs);
    }

    
    //Get all teachers teaching a same module
    static JSONArray getAllLecturersTeachModule (int module_id) throws SQLException, ClassNotFoundException{
        PreparedStatement statement = initStatement("call GetAllLecturersTeachModule(?)");
        statement.setInt(1, module_id);
        ResultSet rs = statement.executeQuery();
        return ResultsetConverter.convertAll(rs);
    }

    //Get all modules in a semester
    static JSONArray getAllModulesInSemester (int semester_id) throws SQLException, ClassNotFoundException{
        PreparedStatement statement = initStatement("call GetAllModulesInSemester(?)");
        statement.setInt(1, semester_id);
        ResultSet rs = statement.executeQuery();
        return ResultsetConverter.convertAll(rs);
    }
    
  //Count sessions of a module
    static JSONArray countSessionOfModule(String module_name) throws SQLException, ClassNotFoundException {
        PreparedStatement statement = initStatement("call CountSessionOfModule(?)");
        statement.setString(1,module_name);
        ResultSet rs = statement.executeQuery();
        return ResultsetConverter.convertAll(rs);
    }
    
    //special
    //Get all overlapped exams in a day
    static JSONArray getAllExamsOverlappedInDay (Date exam_date, String[] column) throws SQLException, ClassNotFoundException{
        PreparedStatement statement = initStatement("call AllExamsOverlappedInDay(?)");
        statement.setDate(1, exam_date);
        ResultSet rs = statement.executeQuery();
        return ResultsetConverter.convertAll(rs, column);
    }
    
    static JSONArray checkAccountExist (String username, String password) throws SQLException, ClassNotFoundException{
    	PreparedStatement statement = initStatement("call CheckAccountExist(?, ?)");
        statement.setString(1, username);
        statement.setString(2, password);
        ResultSet rs = statement.executeQuery();
        return ResultsetConverter.convertAll(rs);
    }
    
    static JSONArray getAllStudent () throws SQLException, ClassNotFoundException {
    	PreparedStatement statement = initStatement("call GetAllStudent()");
        ResultSet rs = statement.executeQuery();
        return ResultsetConverter.convertAll(rs);
    }
    
}
