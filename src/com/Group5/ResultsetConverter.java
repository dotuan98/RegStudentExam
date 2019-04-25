package com.Group5;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Types;

public class ResultsetConverter {
    static JSONObject convertOne(ResultSet rs, String[] fieldNames) throws SQLException, JSONException {
        ResultSetMetaData rsmd = rs.getMetaData();
        int numColumns = rsmd.getColumnCount();
        JSONObject obj = new JSONObject();

        for (int i = 1; i < numColumns + 1; i++) {
            String fieldName = fieldNames[i - 1];
            String columnName = rsmd.getColumnName(i);
            int columnType = rsmd.getColumnType(i);

            if (columnType == Types.ARRAY) {
                obj.put(fieldName, rs.getArray(columnName));
            } else if (columnType == Types.BIGINT) {
                obj.put(fieldName, rs.getInt(columnName));
            } else if (columnType == Types.BOOLEAN) {
                obj.put(fieldName, rs.getBoolean(columnName));
            } else if (columnType == Types.BLOB) {
                obj.put(fieldName, rs.getBlob(columnName));
            } else if (columnType == Types.DOUBLE) {
                obj.put(fieldName, rs.getDouble(columnName));
            } else if (columnType == Types.FLOAT) {
                obj.put(fieldName, rs.getFloat(columnName));
            } else if (columnType == Types.INTEGER) {
                obj.put(fieldName, rs.getInt(columnName));
            } else if (columnType == Types.NVARCHAR) {
                obj.put(fieldName, rs.getNString(columnName));
            } else if (columnType == Types.VARCHAR) {
                obj.put(fieldName, rs.getString(columnName));
            } else if (columnType == Types.TINYINT) {
                obj.put(fieldName, rs.getInt(columnName));
            } else if (columnType == Types.SMALLINT) {
                obj.put(fieldName, rs.getInt(columnName));
            } else if (columnType == Types.DATE) {
                obj.put(fieldName, rs.getDate(columnName));
            } else if (columnType == Types.TIMESTAMP) {
                obj.put(fieldName, rs.getTimestamp(columnName));
            } else {
                obj.put(fieldName, rs.getObject(columnName));
            }
        }
        return obj;
    }
    static JSONObject convertOne(ResultSet rs) throws SQLException, JSONException {
        return convertOne(rs, getFieldNames(rs));
    }

    static JSONArray convertAll(ResultSet rs, String[] fieldNames) throws SQLException, JSONException {
        JSONArray jsonArray = new JSONArray();
        while (rs.next()) {
            jsonArray.put(convertOne(rs, fieldNames));
        }
        return jsonArray;
    }

    public static JSONArray convertToJSON(ResultSet resultSet) throws Exception {
        JSONArray jsonArray = new JSONArray();
        while (resultSet.next()) {
            int total_rows = resultSet.getMetaData().getColumnCount();
            for (int i = 0; i < total_rows; i++) {
                JSONObject obj = new JSONObject();
                obj.put(resultSet.getMetaData().getColumnLabel(i + 1)
                        .toLowerCase(), resultSet.getObject(i + 1));
                jsonArray.put(obj);
            }
        }
        return jsonArray;
    }

    static JSONArray convertAll(ResultSet rs) throws SQLException, JSONException {
        return convertAll(rs, getFieldNames(rs));
    }

    private static String[] getFieldNames(ResultSet rs) throws SQLException, JSONException {
        ResultSetMetaData rsmd = rs.getMetaData();
        int columnCount = rsmd.getColumnCount();
        String[] fieldNames = new String[columnCount];
        for (int i = 0; i < columnCount; i++) {
            fieldNames[i] = rsmd.getColumnName(i + 1);
        }
        return fieldNames;
    }

}
