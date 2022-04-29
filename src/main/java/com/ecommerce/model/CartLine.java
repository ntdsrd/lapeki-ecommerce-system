package com.ecommerce.model;


import java.io.Serializable;


/**
 * @author Do Duc Dung
 * @overview CartLine indicates a separate product in a cart with a specific quantity.
 * @attributes <pre>
 * cartLineID		Integer		int
 * quantity			Integer		int
 * unitPrice		Long		long
 * product			Product
 * cart				Cart
 * </pre>
 * @abstract_properties <pre>
 * mutable(cartLineID)=false /\ optional(cartLineID)=false /\ length=(6) /\
 * mutable(quantity)=true /\ optional(quantity)=false /\ min(quantity)=1 /\
 * mutable(unitPrice)=false /\ optional(unitProce)=false /\
 * mutable(product)=false /\ optional(product)=fasle /\
 * mutable(cart)=false /\ optional(cart)=true
 * </pre>
 */
public class CartLine implements Serializable {

    private static final long serialVersionUID = 1L;

    private int cartLineID;

    private int quantity;

    private long unitPrice;

    private Product product;

    private Cart cart;

    public CartLine() {
        super();

    }

    public CartLine(int cartLineID, int quantity, long unitPrice, Product product, Cart cart) {
        super();
        this.cartLineID = cartLineID;
        this.quantity = quantity;
        this.unitPrice = unitPrice;
        this.product = product;
        this.cart = cart;
    }

    public CartLine(int quantity, long unitPrice, Product product, Cart cart) {
        super();

        this.quantity = quantity;
        this.unitPrice = unitPrice;
        this.product = product;
        this.cart = cart;
    }

    public int getCartLineID() {
        return cartLineID;
    }

    public void setCartLineID(int cartLineID) {
        this.cartLineID = cartLineID;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public long getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(long unitPrice) {
        this.unitPrice = unitPrice;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public Cart getCart() {
        return cart;
    }

    public void setCart(Cart cart) {
        this.cart = cart;
    }

    @Override
    public String toString() {
        return "CartLine [cartLineID=" + cartLineID + ", quantity=" + quantity + ", unitPrice=" + unitPrice
                + ", product=" + product + ", cart=" + cart + "]";
    }


}
