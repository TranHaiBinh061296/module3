package com.codegym.searchcountry.model;

import com.codegym.searchcountry.view.Country;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CountryDAO implements ICountryDAO{

    private static final String SELECT_ALL_COUNTRY = "SELECT * FROM country";
    private static final String SELECT_COUNTRY = "SELECT * FROM country where id = ?;";
    private String jdbcURL = "jdbc:mysql://localhost:3306/user_bt?useSSL=false";
    private String jdbcUsername = "root";
    private String jdbcPassword = "haibinh";

    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return connection;
    }
    @Override
    public void insertCountry(Country country) throws SQLException {

    }

    @Override
    public Country selectCountry(int id) {
        try{
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_COUNTRY);
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()){
                int idCountry = rs.getInt("id");
                String name = rs.getString("name");
                Country country = new Country(id, name);
                return country;
            }
        }catch (SQLException ex){
            printSQLException(ex);
        }
        return null;
    }

    @Override
    public List<Country> selectAllCountry() {
        List<Country> listCountry = new ArrayList<>();
        try{
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_COUNTRY);
            ResultSet rs = preparedStatement.executeQuery();
            System.out.println(this.getClass() + " selectAllCountry " + preparedStatement);
            while (rs.next()){
                int id = rs.getInt("id");
                String name = rs.getString("name");
                Country country = new Country(id, name);
                listCountry.add(country);
            }
        }catch (SQLException ex){
            printSQLException(ex);
        }

        return listCountry;
    }

    @Override
    public boolean deleteCountry(int id) throws SQLException {
        return false;
    }

    @Override
    public boolean updateCountry(Country country) throws SQLException {
        return false;
    }
    private void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
}
