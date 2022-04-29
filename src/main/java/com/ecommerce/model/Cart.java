package com.ecommerce.model;


import java.io.Serializable;
import java.sql.Date;


/**
 * @author Do Duc Dung
 * @overview Cart is an object storing all the items a customer buy
 * @attributes <pre>
 * cartID 		Integer int
 * user 		User
 * orderDate 	Date
 * status 		String
 * payment 		String
 * voucher 		Voucher
 * total 		Long    long
 * </pre>
 * @abstract_properties mutable(cartID)=false /\ optional(cartID)=false /\ min(cartID)=100000 /\ length(cartID)=6 /\
 * mutable(User)=false/\ optional(User)=false /\
 * mutable(orderDate)=false /\ optional(orderDate)=false /\
 * mutable(status)=true /\ optional(status)=false /\
 * mutable(paymentMode)=false /\ optional(paymentMode)=false /\
 * mutable(voucher)=false /\ optional(voucher)=true /\
 * mutable(total)=false /\ optional(total)=false
 */
public class Cart implements Serializable {

    private static final long serialVersionUID = 1L;

    private int cartID;

    private User user;

    private Date orderDate;

    private String status;

    private String paymentMode;

    private Voucher voucher;

    private long total;

    public Cart() {
        super();
    }

    public Cart(int cartID, User user, Date orderDate, String status, String paymentMode, Voucher voucher, long total) {
        super();
        this.cartID = cartID;
        this.user = user;
        this.orderDate = orderDate;
        this.status = status;
        this.paymentMode = paymentMode;
        this.voucher = voucher;
        this.total = total;
    }


    public Cart(User user, Date orderDate, String status, String paymentMode, Voucher voucher, long total) {
        super();

        this.user = user;
        this.orderDate = orderDate;
        this.status = status;
        this.paymentMode = paymentMode;
        this.voucher = voucher;
        this.total = total;
    }

    public int getCartID() {
        return cartID;
    }

    public void setCartID(int cartID) {
        this.cartID = cartID;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getPaymentMode() {
        return paymentMode;
    }

    public void setPayment(String paymentMode) {
        this.paymentMode = paymentMode;
    }

    public Voucher getVoucher() {
        return voucher;
    }

    public void setVoucher(Voucher voucher) {
        this.voucher = voucher;
    }

    public long getTotal() {
        return total;
    }

    public void setTotal(long total) {
        this.total = total;
    }


}
