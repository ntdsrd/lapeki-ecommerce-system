package com.ecommerce.model;

import java.io.Serializable;
import java.sql.Date;

/**
 * @author Nguyen Khac Hung
 * @overview        <pre>
 * 	User represent people who use the website
 * 	User comprises of Admin and Customer, whose roles are defined by roleID attribute
 * 		</pre>
 * @attributes <pre>
 * userID 	Integer		int
 * username	String
 * fullname	String
 * password	String
 * mobile	String
 * email	String
 * address	String
 * gender	String
 * dob		Date
 * roleID	Integer		int
 * </pre>
 * @abstract_properties    <pre>
 * 	mutable(userID) = false /\ optional(userID) = false /\ min(userID) = 100000 /\ length(userID) = 6 /\
 * 	mutable(username) = false /\ optional(username) = false /\ length(username) = 25 /\
 * 	mutable(fullname) = true /\ optional(fullname) = false /\ length(fullname) = 30 /\
 * 	mutable(password) = true /\ optional(password) = false /\ length(password) = 25 /\
 * 	mutable(mobile) = true /\ optional(mobile) = false /\ length(mobile) = 10 /\
 * 	mutable(email) = true /\ optional(email) = false /\ length(email) = 50 /\
 * 	mutable(address) = true /\ optional(address) = false /\ length(address) = 200 /\
 * 	mutable(gender) = true /\ optional(gender) = false /\ length(gender) = 10 /\
 * 	mutable(dob) = true /\ optional(dob) = false /\ length(dob) = 20 /\
 * 	mutable(roleID) = false /\ optional(roleID) = false
 *
 * 	</pre>
 */
public class User implements Serializable {

    private int userID;

    private String username;

    private String password;

    private String fullname;

    private String mobile;

    private String email;

    private String address;

    private String gender;

    private Date dob;

    private int roleID;


    //Constructor
    public User() {
        super();
    }

    public User(String username, String password, String fullname, String mobile, String email,
                String address, String gender, Date dob, int roleID) {
        super();
        this.username = username;
        this.password = password;
        this.fullname = fullname;
        this.mobile = mobile;
        this.email = email;
        this.address = address;
        this.gender = gender;
        this.dob = dob;
        this.roleID = roleID;
    }

    //for register
    public User(String username, String password, String fullname, String mobile, String email,
                String address, String gender, Date dob) {
        super();
        this.username = username;
        this.password = password;
        this.fullname = fullname;
        this.mobile = mobile;
        this.email = email;
        this.address = address;
        this.gender = gender;
        this.dob = dob;
    }

    public User(int userID, String username, String password, String fullname, String mobile, String email,
                String address, String gender, Date dob, int roleID) {
        super();
        this.userID = userID;
        this.username = username;
        this.password = password;
        this.fullname = fullname;
        this.mobile = mobile;
        this.email = email;
        this.address = address;
        this.gender = gender;
        this.dob = dob;
        this.roleID = roleID;
    }

    //Getters & Setters
    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public Date getDob() {
        return dob;
    }

    public void setDob(Date dob) {
        this.dob = dob;
    }

    public int getRoleID() {
        return roleID;
    }

    public void setRoleID(int roleID) {
        this.roleID = roleID;
    }


}
