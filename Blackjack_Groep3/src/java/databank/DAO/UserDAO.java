/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package databank.DAO;

import databank.blackjackdb.DatabaseSingleton;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author Anthony Lannoote
 */
public class UserDAO {

    private Connection connectie;
    private Statement statement;

    public UserDAO() {
    }

    public static ResultSet getAllDataUsers(Boolean isHeaduser) {
        String query = "";
        if(isHeaduser){
            query = "SELECT * FROM user";
        }else{
            query = "SELECT * FROM user WHERE id != (SELECT id from headuser)";
        }

        Connection con = DatabaseSingleton.getDatabaseSingleton().getConnection(true);
        ResultSet rs = null;
        PreparedStatement stmt = null;
        try {
            stmt = con.prepareStatement(query);
            rs = stmt.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rs;
    }

    public static ResultSet getUserDataByNickName(String NickName) {

        String query = "SELECT * FROM user where nickname = ?";
        Connection con = DatabaseSingleton.getDatabaseSingleton().getConnection(true);
        ResultSet rs = null;
        PreparedStatement stmt = null;
        try {
            stmt = con.prepareStatement(query);
            stmt.setString(1, NickName);
            rs = stmt.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rs;
    }

    public static void updateUserBalanceByNickName(String nickName, int balance) {
        String query = "UPDATE user SET balance = " + balance + " where user.nickname = '" + nickName + "'";
        Connection con = DatabaseSingleton.getDatabaseSingleton().getConnection(true);

        try {
            Statement stmt = con.createStatement();
            stmt.executeUpdate(query);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
    }
    
    public static ResultSet getUsers(){
        String query = "SELECT nickname FROM user";
        Connection con = DatabaseSingleton.getDatabaseSingleton().getConnection(true);
        ResultSet rs = null;
        PreparedStatement stmt = null;
        try {
            stmt = con.prepareStatement(query);
            rs = stmt.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rs;
    }
    
    public static void deleteUser(String nickName) {
        String query = "Delete from user where nickname = '" + nickName + "'";
        Connection con = DatabaseSingleton.getDatabaseSingleton().getConnection(true);

        try {
            Statement stmt = con.createStatement();
            stmt.executeUpdate(query);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
    }
    
    public static void updateUser(String nickname, String nicknamenew, int balance, int iconid, String email, String password , int isheadhuser) {
        String query = "UPDATE `user` SET `Iconid` = '"+iconid+"', `nickname` = '"+nicknamenew+"', `balance` = '"+balance+"', `isHeadUser` = '"+isheadhuser+"', `email` = '"+email+"', `password` = '"+password+"' WHERE `user`.`"+nickname+"`";
        Connection con = DatabaseSingleton.getDatabaseSingleton().getConnection(true);

        try {
            Statement stmt = con.createStatement();
            stmt.executeUpdate(query);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
    }
    
    public static void insertUser(String iconid, String nickname, int balance, int isadmin, String email, String password) {
        String query = "insert into `user` (`id`, `Iconid`, `nickname`, `balance`, `timePlayed`, `isHeadUser`, `email`, `password`) VALUES ('"+iconid+"', '"+nickname+"', '"+balance+"', '"+isadmin+"', '"+email+"', '"+password+"');";
        Connection con = DatabaseSingleton.getDatabaseSingleton().getConnection(true);

        try {
            Statement stmt = con.createStatement();
            stmt.executeUpdate(query);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
    }
    
    public static void InsertGameUserData(int userId, int gameId, int bet, String status){
        String query = "insert into game_user(userid, gameid, bet, status) values(?, ?, ?, ?)";
        Connection con = DatabaseSingleton.getDatabaseSingleton().getConnection(true);

        try {
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setInt(1, userId);
            stmt.setInt(2, gameId);
            stmt.setInt(3, bet);
            stmt.setString(4, status);
            stmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
}
