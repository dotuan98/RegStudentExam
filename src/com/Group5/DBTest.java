package com.Group5;

import org.json.JSONArray;
import org.json.JSONObject;
import org.junit.Test;
import org.junit.*;
import org.junit.jupiter.api.BeforeEach;
import org.skyscreamer.jsonassert.JSONAssert;
import org.skyscreamer.jsonassert.JSONCompareMode;

import java.sql.*;


public class DBTest {

    @BeforeEach
    public void intializeDB() {
        try (Connection conn = DBConnect.getConnection()) {
            Statement stmt = null;
            stmt = conn.createStatement();
            stmt.executeQuery("{ CALL TruncateAll() }");
            stmt.executeQuery("{ CALL InitializeInstances() }");
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
    }

    @Test
    public void testListAbsentStudentsOfSession() throws SQLException, ClassNotFoundException {
        int sessionId = 1;
        Integer[] expectedStudentIds = new Integer[]{1, 6};

        JSONArray students = StoredProcedure.listAbsentStudentsOfSession(sessionId);
        Assert.assertEquals(expectedStudentIds.length, students.length());

        //compare each element
        for (int i = 0; i < students.length(); i++) {
            int actualId = ((JSONObject)students.get(i)).getInt("stuId");
            System.out.println(actualId + " " + expectedStudentIds[i]);
            Assert.assertEquals(actualId, (int)expectedStudentIds[i]);
        }
    }

    @Test
    public void testListParticipatedStudentsOfSession() throws SQLException, ClassNotFoundException {
        int sessionId = 1;
        Integer[] expectedStudentIds = new Integer[]{2, 3, 4, 5};

        JSONArray students = StoredProcedure.listParticipatedStudentsOfSession(sessionId);
        Assert.assertEquals(expectedStudentIds.length, students.length());

        //compare each element
        for (int i = 0; i < students.length(); i++) {
            int actualId = ((JSONObject)students.get(i)).getInt("stuId");
            System.out.println(actualId + " " + expectedStudentIds[i]);
            Assert.assertEquals(actualId, (int)expectedStudentIds[i]);
        }
    }

    @Test
    public void testGetAllModulesStudentAttend() throws SQLException, ClassNotFoundException {
        Integer[] studentIds = new Integer[]{1, 2, 3};
        String[] expectedModules = new String[]{
                "[{\"name\":\"Database\"},{\"name\":\"Software\"},{\"name\":\"Java\"}]",
                "[{\"name\":\"Statistics\"},{\"name\":\"C Programming\"},{\"name\":\"Math\"}]",
                "[{\"name\":\"Discrete Math\"},{\"name\":\"Statistics\"}]"
        };
        for (int i = 0; i < studentIds.length; i++){
            String result = StoredProcedure.getAllModulesStudentAttend(studentIds[i]).toString();
            JSONAssert.assertEquals(expectedModules[i], result, JSONCompareMode.LENIENT);
        }

    }

    @Test
    public void testGetAllExamsOverlappedInDay() throws SQLException, ClassNotFoundException {
        String[] examDates = new String[]{
                "2018-05-21",
                "2018-10-30"
        };
        String[] expectedResults = new String[]{
                "[{\"examFrom\":\"09:00:00\", \"examTo\":\"10:30:00\", \"modId\":13}]",
                "[]"
        };
        String[] column = new String[] {"modId", "examFrom", "examTo", "modId1"};
        for (int i = 0; i < examDates.length; i++){
            String result = StoredProcedure.getAllExamsOverlappedInDay(Date.valueOf(examDates[i]), column).toString();
            JSONAssert.assertEquals(expectedResults[i], result, JSONCompareMode.LENIENT);
        }
    }
}
