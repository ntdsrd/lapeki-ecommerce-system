package com.ecommerce.dao.impl;

import com.ecommerce.connection.DatabaseConnection;
import com.ecommerce.dao.CategoryDAO;
import com.ecommerce.dao.ProductDAO;
import com.ecommerce.model.Category;
import com.ecommerce.model.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 * @author Nguyen Tung Lam
 * @overview ProductDAO is an abstract interface which facilitates communication
 * to Product table in database.
 */

public class ProductDAOImpl implements ProductDAO {
    Connection connection = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    CategoryDAO categoryDao = new CategoryDAOImpl();

    /**
     * Insert a new Product to database
     *
     * @param product - a thing, real-life object to be inserted to database
     */
    @Override
    public void insertProduct(Product product) {
        connection = DatabaseConnection.getConnection();
        String sql = "INSERT INTO product(category_id, product_name, product_img, product_price, instock, product_description)"
                + "VALUES (?, ?, ?, ?, ?, ?)";

        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, product.getCategory().getCategoryID());
            ps.setString(2, product.getProductName());
            ps.setString(3, product.getProductImg());
            ps.setLong(4, product.getProductPrice());
            ps.setInt(5, product.getInstock());
            ps.setString(6, product.getProductDesc());

            ps.executeUpdate();


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
    }

    /**
     * Update an existing Product in database
     *
     * @param product - a thing, real-life object to be inserted to database
     * @return true if the product is updated, or false if not
     */
    @Override
    public boolean updateProduct(Product product) {
        connection = DatabaseConnection.getConnection();
        String sql = "UPDATE product SET category_id = ?, product_name = ?, product_img = ?, product_price = ?, instock = ?, product_description = ? WHERE product_id = ?";
        boolean isUpdated = false;
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, product.getCategory().getCategoryID());
            ps.setString(2, product.getProductName());
            ps.setString(3, product.getProductImg());
            ps.setLong(4, product.getProductPrice());
            ps.setInt(5, product.getInstock());
            ps.setString(6, product.getProductDesc());
            ps.setInt(7, product.getProductID());

            ps.executeUpdate();


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
     * Delete an existing Product
     *
     * @param product - a thing, real-life object to be inserted to database
     * @return true if the product is deleted, or false if not
     */
    @Override
    public boolean deleteProduct(int productID) {
        connection = DatabaseConnection.getConnection();
        String sql = "DELETE FROM product WHERE product_id = ?";
        boolean isDeleted = false;
        try {
            ps = connection.prepareStatement(sql);

            ps.setInt(1, productID);
            isDeleted = ps.executeUpdate() > 0;


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
        return isDeleted;
    }

    /**
     * Get a Product from database by its id
     *
     * @param productID - the id of the desired Product
     * @return Either the desired Product if found or null if not
     */
    @Override
    public Product getProductByID(int productID) {
        connection = DatabaseConnection.getConnection();
        String sql = "SELECT " + "product.product_id, " + "category.category_id, " + "product.product_name, "
                + "product.product_img, " + "product.product_price, " + "product.instock, "
                + "product.product_description " + "FROM product " + "INNER JOIN category "
                + "ON product.category_id = category.category_id " + "WHERE product.product_id = ?";
        Product product = null;

        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, productID);
            rs = ps.executeQuery();

            if (rs.next()) {
                Category category = categoryDao.getCategoryByID(rs.getInt("category_id"));

                int productid = rs.getInt("product_id");
                String productName = rs.getString("product_name");
                String productImg = rs.getString("product_img");
                long productPrice = rs.getLong("product_price");
                int productInstock = rs.getInt("instock");
                String productDesc = rs.getString("product_description");

                product = new Product(productid, productName, productImg, productPrice, category, productInstock,
                        productDesc);
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
        return product;
    }

    /**
     * Get all Products that exist in database
     *
     * @return Either the list of Products or null if there is no Product
     */
    @Override
    public List<Product> getAllProducts() {
        connection = DatabaseConnection.getConnection();
        String sql = "SELECT " + "product.product_id, " + "category.category_id, " + "product.product_name, "
                + "product.product_img, " + "product.product_price, " + "product.instock, "
                + "product.product_description " + "FROM product " + "INNER JOIN category "
                + "ON product.category_id = category.category_id; ";
        List<Product> products = new ArrayList<>();
        Product product = null;
        try {
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                Category category = categoryDao.getCategoryByID(rs.getInt("category_id"));

                int productid = rs.getInt("product_id");
                String productName = rs.getString("product_name");
                String productImg = rs.getString("product_img");
                long productPrice = rs.getLong("product_price");
                int productInstock = rs.getInt("instock");
                String productDesc = rs.getString("product_description");

                product = new Product(productid, productName, productImg, productPrice, category, productInstock,
                        productDesc);
                products.add(product);
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
        return products;
    }

    /**
     * Search for a Product by name
     *
     * @param productName - the name to be searched for
     * @return Either the list of matching result or null if there is no matches
     */
    @Override
    public List<Product> searchProductByName(String productName) {
        connection = DatabaseConnection.getConnection();
        List<Product> list = new ArrayList<Product>();
        Product product = null;

        String sql = "SELECT * FROM product p INNER JOIN category c ON p.category_id = c.category_id WHERE product_name LIKE ? OR c.category_name LIKE ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + productName + "%");
            ps.setString(2, "%" + productName + "%");
            rs = ps.executeQuery();

            while (rs.next()) {
                Category category = categoryDao.getCategoryByID(rs.getInt("category_id"));

                int productid = rs.getInt("product_id");
                String name = rs.getString("product_name");
                String productImg = rs.getString("product_img");
                long productPrice = rs.getLong("product_price");
                int productInstock = rs.getInt("instock");
                String productDesc = rs.getString("product_description");

                product = new Product(productid, name, productImg, productPrice, category, productInstock,
                        productDesc);

                list.add(product);
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
     * Search for a Product by Category
     *
     * @param categoryID - the ID to be searched for
     * @return Either the list of matching result or null if there is no matches
     */
    @Override
    public List<Product> searchProductByCategory(int categoryID) {
        connection = DatabaseConnection.getConnection();
        List<Product> list = new ArrayList<Product>();
        Product product = null;

        String sql = "SELECT * FROM product WHERE category_id LIKE ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + categoryID + "%");
            rs = ps.executeQuery();

            while (rs.next()) {
                Category category = categoryDao.getCategoryByID(rs.getInt("category_id"));
                int productid = rs.getInt("product_id");
                String productName = rs.getString("product_name");
                String productImg = rs.getString("product_img");
                long productPrice = rs.getLong("product_price");
                int Instock = rs.getInt("instock");
                String productDesc = rs.getString("product_description");

                product = new Product(productid, productName, productImg, productPrice, category, Instock,
                        productDesc);

                list.add(product);
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
