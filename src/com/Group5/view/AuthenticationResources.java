package com.Group5.view;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.NamingException;
import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import com.Group5.RegisteredUser;
import com.Group5.User;

import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import test.DBConnect;

@Path("/authentication")
public class AuthenticationResources {
	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	public Response authenticateUser(User user) {
		String login = user.getLogin();
		String password = user.getPassword();
		try {
			RegisteredUser authUser = authenticate(login, password);
			System.out.println(authUser.getId());
			System.out.println(authUser.getRole());
			String authToken = issueToken(authUser);
		}
	}
	
	private RegisteredUser authenticate(String login, String password) throws SQLException {
		Connection db = null;
		RegisteredUser authUser = null;
		
		try {
			db = DBConnect.getConnection();
			
			PreparedStatement state = db.prepareStatement("SELECT A.accID, S.code FROM account A JOIN student S ON (A.accId = S.accId) WHERE A.login = ? AND A.password = ?");
			state.setString(1, login);
			state.setString(2, password);
			
			ResultSet rs = state.executeQuery();
			
			if (rs.next()) {
				authUser = new RegisteredUser();
				authUser.setId(rs.getInt("accId"));
				if (rs.getString("code") != null) {
					authUser.setId(1);
				} else {
					authUser.setId(2);
				}
			} else {
				throw new SecurityException("101");
			}
			return authUser;
		}
		finally {
			try {
				if(db != null) {
					db.close();
				}
			} finally {
				
			}
		}
	}
	
	private String issueToken(RegisteredUser authUser) throws NamingException{
	
		
		String authToken = Jwts.builder()
				.claim("user", authUser.getId())
				.claim("role", authUser.getRole())
				.signWith(SignatureAlgorithm.HS512, "vgu2016")
				.compact();
		
		return authToken;
	}
}
