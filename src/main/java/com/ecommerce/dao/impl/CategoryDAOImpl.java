package com.ecommerce.dao.impl;

import com.ecommerce.connection.DatabaseConnection;
import com.ecommerce.dao.CategoryDAO;
import com.ecommerce.model.Category;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 * @author Nguyen Khac Hung
 * @overview CategoryDAOImpl is an abstract interface which facilitates
 * communication to Category table in database.
 */
public class CategoryDAOImpl implements CategoryDAO {
    Connection connection = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    /**
     * Insert a new Category to database
     *
     * @param category - a new category
     */
    @Override
    public void insertCategory(Category category) {
        connection = DatabaseConnection.getConnection();
        String sql = "INSERT INTO category(category_name) VALUES (?)";

        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, category.getCategoryName());
            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                ps.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
            try {
                connection.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

    }

    /**
     * Update an existing Category in the database
     *
     * @param category - a category to be updated in the database
     * @return true if category is updated, false if not
     */
    @Override
    public boolean updateCategory(Category category) {
        connection = DatabaseConnection.getConnection();
        boolean isUpdated = false;
        String sql = "UPDATE category SET category_name = ? where category_id = ?";

        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, category.getCategoryName());
            ps.setInt(2, category.getCategoryID());

            isUpdated = ps.executeUpdate() > 0;


        } catch (Exception e) {
            System.err.println(e.getMessage());
        } finally {
            try {
                ps.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
            try {
                connection.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return isUpdated;
    }

    /**
     * Delete an existing Category
     *
     * @param categoryID - the id of the category to be deleted
     * @return true if the category is deleted, or false if not
     */
    @Override
    public boolean deleteCategory(int categoryID) {
        connection = DatabaseConnection.getConnection();
        boolean isDeleted = false;
        String sql = "DELETE FROM category WHERE category_id = ?";

        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, categoryID);

            isDeleted = ps.executeUpdate() > 0;

        } catch (Exception e) {
            System.err.println(e.getMessage());
        } finally {
            try {
                ps.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
            try {
                connection.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return isDeleted;
    }

    /**
     * Get an category from database by its categoryID
     *
     * @param categoryID - the id of desired Category
     * @return Either the desired Category if found or null if not
     */
    @Override
    public Category getCategoryByID(int categoryID) {
        connection = DatabaseConnection.getConnection();
        String sql = "SELECT * FROM category WHERE category_id = ?";
        Category category = null;
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, categoryID);
            rs = ps.executeQuery();

            while (rs.next()) {
                String categoryName = rs.getString("category_name");
                category = new Category(categoryID, categoryName);

            }

        } catch (Exception e) {
            System.err.println(e.getMessage());
        } finally {
            try {
                rs.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
            try {
                ps.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
            try {
                connection.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return category;
    }

    /**
     * Get an CartLine from database by its categoryName
     *
     * @param categoryName - the name of desired Category
     * @return Either the desired Category if found or null if not
     */
    @Override
    public Category getCategoryByName(String categoryName) {
        connection = DatabaseConnection.getConnection();
        String sql = "SELECT * FROM category WHERE category_name = ?";
        Category category = null;
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, categoryName);
            rs = ps.executeQuery();

            while (rs.next()) {
                int categoryID = rs.getInt("category_id");
                category = new Category(categoryID, categoryName);

            }

        } catch (Exception e) {
            System.err.println(e.getMessage());
        } finally {
            try {
                rs.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
            try {
                ps.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
            try {
                connection.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return category;
    }

    /**
     * Get all Categories that exist in the database
     *
     * @return Either the list of Categories or null if there is no Category
     */
    @Override
    public List<Category> getAllCategories() {
        connection = DatabaseConnection.getConnection();
        List<Category> list = new ArrayList<Category>();
        Category category = null;
        String sql = "SELECT * FROM category";

        try {
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                int categoryID = rs.getInt("category_id");
                String categoryName = rs.getString("category_name");
                category = new Category(categoryID, categoryName);

                list.add(category);

            }

        } catch (Exception e) {
            System.err.println(e.getMessage());
        } finally {
            try {
                rs.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
            try {
                ps.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
            try {
                connection.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return list;
    }

    /**
     * Search for a Category by name
     *
     * @param categoryName - the name to be searched for
     * @return Either the list of matching result or null if there is no matches
     */
    @Override
    public List<Category> searchCategoryByName(String categoryName) {
        connection = DatabaseConnection.getConnection();
        List<Category> list = new ArrayList<Category>();
        Category category = null;
        String sql = "SELECT * FROM category WHERE category_name LIKE ?";

        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + categoryName + "%");
            rs = ps.executeQuery();

            while (rs.next()) {
                int categoryID = rs.getInt("category_id");
                category = new Category(categoryID, categoryName);

                list.add(category);

            }

        } catch (Exception e) {
            System.err.println(e.getMessage());
        } finally {
            try {
                rs.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
            try {
                ps.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
            try {
                connection.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return list;
    }

}
