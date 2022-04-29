package com.ecommerce.dao;

import com.ecommerce.model.User;

import java.util.List;

/**
 * @author Do Duc Dung
 * @overview UserDAO is an abstract interface which facilitates communication to
 * User table in database.
 */
public interface UserDAO {

    /**
     * Insert a new User to database
     *
     * @param user - a customer or admin to be inserted to databse
     */
    void insertUser(User user);

    /**
     * Update an existing User in database
     *
     * @param user - a user to be updated in database
     * @return true if the user is updated, or false if not
     */
    boolean updateUser(User user);

    /**
     * Delete an existing User
     *
     * @param userID - the id of the user to be deleted
     * @return true if the user is deleted, or false if not
     */
    boolean deleteUser(int userID);

    /**
     * Get a User from database by its id
     *
     * @param userID - the id of the desired User
     * @return Either the desired User if found or null if not
     */
    User getUserByID(int userID);

    /**
     * Get a User from database by its username
     *
     * @param username - the username of the desired User
     * @return Either the desired User if found or null if not
     */
    User getUserByUsername(String username);

    /**
     * Get all Users that exist in database
     *
     * @return Either the list of Users or null if there is no User
     */
    List<User> getAllUsers();

    /**
     * Search for a User by keyword
     *
     * @param keyword - the keyword to be searched for (eg: username, email, phone)
     * @return Either the list of matching result or null if there is no matches
     */
    List<User> searchUserByKeyword(String keyword);

    /**
     * Check if an email address exists in database
     *
     * @param email - the email address to be checked
     * @return True if it is found, or false if not
     */
    boolean checkExistEmail(String email);

    /**
     * Check if a username exists in database
     *
     * @param username - the username string to be checked
     * @return
     */
    boolean checkExistUsername(String username);

    /**
     * Check if a phone exists in database
     *
     * @param phone - the phone to be checked
     * @return
     */
    boolean checkExistPhone(String phone);
}
