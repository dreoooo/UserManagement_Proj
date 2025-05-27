package com.xadmin.usermanagement.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import com.xadmin.usermanagement.bean.User;

public class UserDAO {

	private String jdbcURL = "jdbc:mysql://localhost:3306/userdb?useSSL=false&serverTimezone=UTC";
    private String jdbcUsername = "root";
    private String jdbcPassword = "dreo123";

    private static final String INSERT_USERS_SQL = "INSERT INTO users" +
            " (first_name, middle_name, last_name, email, country, region) VALUES (?, ?, ?, ?, ?, ?);";

    private static final String SELECT_USER_BY_ID = "SELECT id, first_name, middle_name, last_name, email, country, region FROM users WHERE id = ?";

    private static final String SELECT_ALL_USERS = "SELECT * FROM users";

    private static final String DELETE_USERS_SQL = "DELETE FROM users WHERE id = ?;";

    private static final String UPDATE_USERS_SQL = "UPDATE users SET first_name = ?, middle_name = ?, last_name = ?, email = ?, country = ?, region = ? WHERE id = ?;";

    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); // or your driver
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return connection;
    }

    // Insert ng User
    public void insertUser(User user) throws SQLException {
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USERS_SQL)) {

            preparedStatement.setString(1, user.getFirstName());
            preparedStatement.setString(2, user.getMiddleName());
            preparedStatement.setString(3, user.getLastName());
            preparedStatement.setString(4, user.getEmail());
            preparedStatement.setString(5, user.getCountry());
            preparedStatement.setString(6, user.getRegion());

            preparedStatement.executeUpdate();
        } 
    }

    // Select User By ID
    public User selectUser(int id) {
        User user = null;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_ID);) {

            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();

            if (rs.next()) {
                String firstName = rs.getString("first_name");
                String middleName = rs.getString("middle_name");
                String lastName = rs.getString("last_name");
                String email = rs.getString("email");
                String country = rs.getString("country");
                String region = rs.getString("region");

                user = new User(id, firstName, middleName, lastName, email, country, region);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

    // Select all Users
    public List<User> selectAllUsers() {

        List<User> users = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_USERS);) {

            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                String firstName = rs.getString("first_name");
                String middleName = rs.getString("middle_name");
                String lastName = rs.getString("last_name");
                String email = rs.getString("email");
                String country = rs.getString("country");
                String region = rs.getString("region");

                users.add(new User(id, firstName, middleName, lastName, email, country, region));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return users;
    }

    // Updating User
    public boolean updateUser(User user) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(UPDATE_USERS_SQL);) {

            statement.setString(1, user.getFirstName());
            statement.setString(2, user.getMiddleName());
            statement.setString(3, user.getLastName());
            statement.setString(4, user.getEmail());
            statement.setString(5, user.getCountry());
            statement.setString(6, user.getRegion());
            statement.setInt(7, user.getId());

            rowUpdated = statement.executeUpdate() > 0;
        }
        return rowUpdated;
    }

    // Deleting User
    public boolean deleteUser(int id) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(DELETE_USERS_SQL);) {

            statement.setInt(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }
}
