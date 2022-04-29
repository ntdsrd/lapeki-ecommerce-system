package com.ecommerce.service;

import com.ecommerce.model.User;

import java.sql.Date;
import java.util.List;

/**
 * @author Nguyen The Dat
 * @overview
 */
public interface UserService {

    /**
     * Insert new user
     *
     * @param user
     */
    void insertUser(User user);

    /**
     * Update user information
     *
     * @param user
     * @return
     */
    boolean updateUser(User user);

    /**
     * Delete a user
     *
     * @param user
     * @return
     */
    boolean deleteUser(int userId);


    /**
     * Search user using id
     *
     * @param userId
     * @return
     */
    User getUserById(int userId);


    /**
     * Search user using name
     *
     * @param userName
     * @return
     */
    User getUserByUsername(String username);

    /**
     * Search user using keyword
     *
     * @param keyword
     * @return
     */
    List<User> searchUserByKeyword(String keyword);

    /**
     * Check exist email in
     *
     * @param email
     * @return
     */
    boolean checkExistEmail(String email);


    /**
     * Check exist username
     *
     * @param userName
     * @return
     */
    boolean checkExistUsername(String username);

    /**
     * Check exist phone
     *
     * @param mobile
     * @return
     */
    boolean checkExistMobile(String mobile);

    /**
     * Login to website
     *
     * @param username
     * @param password
     * @return
     */
    User login(String username, String password);

    /**
     * Sign up a new account
     *
     * @param username
     * @param password
     * @param fullname
     * @param mobile
     * @param email
     * @param address
     * @param gender
     * @param dob
     * @return
     */
    boolean register(String username, String password, String fullname, String mobile, String email,
                     String address, String gender, Date dob);

    /**
     * get all user
     *
     * @return
     */
    List<User> getAllUsers();


}
