package model.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 * The DAOAPersonalInfo class provides methods for creating a user's personal info registry in the database.
 */
public class DAOAPersonalInfo {

    /**
     * Creates a user's personal info registry in the database.
     *
     * @param id      the ID of the user
     * @param name    the first name of the user
     * @param surname the last name of the user
     * @return {@code true} if the user's personal info registry is created successfully,
     * {@code false} otherwise
     */
    public boolean createRegistry(int id, String name, String surname) {
        Connection connection = null;
        PreparedStatement preparedStatementPersonalInfo = null;

        try {
            connection = DAOConnection.getConnection();
            connection.setAutoCommit(false);  // Start a transaction

            // Insert user data into personal_info table
            String queryAnagrafica = "INSERT INTO personal_info (ID_user, Firstname, Lastname) VALUES (?, ?, ?)";
            preparedStatementPersonalInfo = connection.prepareStatement(queryAnagrafica);
            preparedStatementPersonalInfo.setInt(1, id);
            preparedStatementPersonalInfo.setString(2, name);
            preparedStatementPersonalInfo.setString(3, surname);
            preparedStatementPersonalInfo.executeUpdate();

            connection.commit();  // Commit the transaction
            return true;  // User created successfully

        } catch (SQLException e) {
            // Handle the exception (e.g., log or throw)
            e.printStackTrace();
            try {
                if (connection != null) {
                    connection.rollback();  // Rollback the transaction in case of an exception
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        } finally {
            try {
                if (preparedStatementPersonalInfo != null) preparedStatementPersonalInfo.close();
                DAOConnection.releaseConnection(connection);
            } catch (SQLException e) {
                // Handle the exception (e.g., log or throw)
                e.printStackTrace();
            }
        }

        return false;  // Default to false if an exception occurs
    }
}

