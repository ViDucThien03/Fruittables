package com.spring.DAO;

import com.spring.model.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Repository
public class CheckoutDAO
{
    @Autowired
    JdbcTemplate jdbcTemplate;

    public int addCheckout(Checkout checkout)
    {
        String sql = "INSERT INTO orders \n" +
                "(fullname, total_price, total_product, address, desc_order, email, customer_id, phone, payment_method,status_payment) \n" +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
        return jdbcTemplate.update(sql, checkout.getFullName(), checkout.getTotal(), checkout.getQuantity(), checkout.getAddress(), checkout.getDesc_order(), checkout.getEmail(), checkout.getUserid(), checkout.getPhone(), checkout.getPaymentMethod(), checkout.getStatusPayment());
    }

    public int getIDLastBill(){
        String sql = "select max(id) from orders";
        int checkoutid = jdbcTemplate.queryForObject(sql,new Object[]{},Integer.class );
        return checkoutid;
    }

    public int addCheckoutDetail(CheckoutDetail checkoutDetail)
    {
       String sql = "insert into order_detail (product_id, order_id, quantity, total_piad) values(?,?,?,?)";
        return jdbcTemplate.update(sql, checkoutDetail.getProductID(), checkoutDetail.getCheckoutID(), checkoutDetail.getQuantity(), checkoutDetail.getTotal());
    }

    public void updateQuantity(CheckoutDetail checkoutDetail)
    {
        String sql = "UPDATE product SET quantity = quantity - ? WHERE id = ?";
        jdbcTemplate.update(sql, checkoutDetail.getQuantity(), checkoutDetail.getProductID());
    }
    public void updateSellQuantity(CheckoutDetail checkoutDetail)
    {
        String sql = "UPDATE product SET sell_quantity = sell_quantity + ? WHERE id = ?";
        jdbcTemplate.update(sql, checkoutDetail.getQuantity(), checkoutDetail.getProductID());
    }

    public List<Checkout> getOrder(int userID)
    {
        List<Checkout> list = new ArrayList<Checkout>();
        String sql = "select * from orders where customer_id=?";
        list = jdbcTemplate.query(sql, new Object[]{userID}, new CheckoutMapper());
        return list;
    }

    public List<OrderDetail> getOrderDetail(int checkoutid) {
        String sql = "select fullname, product_img, product_name, product_price,  order_detail.quantity, total_price, orders.status, orders.id from order_detail \n" +
                "inner join product on order_detail.product_id = product.id\n" +
                "inner join orders on order_detail.order_id = orders.id\n" +
                "where orders.id = ?";
        return jdbcTemplate.query(sql, new Object[]{checkoutid}, new OrderDetailMapper());
    }

    public OrderDetail getOneOrderDetail(int checkoutid)
    {
        String sql = "select fullname, product_img, product_name, product_price,  order_detail.quantity, total_price, orders.status, orders.id from order_detail \n" +
                "inner join product on order_detail.product_id = product.id\n" +
                "inner join orders on order_detail.order_id = orders.id\n" +
                "where orders.id = ? limit 1";
        return jdbcTemplate.queryForObject(sql, new Object[]{checkoutid}, new OrderDetailMapper());
    }

    //===========================================================

    public Checkout findById(int id) {
        String sql = "SELECT * FROM orders WHERE id = ?";
        return jdbcTemplate.queryForObject(sql, new Object[]{id}, new CheckoutMapper());
    }

    public void updateOrderStatus(int id, String status) {
        String sql = "UPDATE orders SET status = ? WHERE id = ?";
        jdbcTemplate.update(sql, status, id);
    }

    // Thêm phương thức để xóa chi tiết đơn hàng
    public void deleteCheckoutDetails(int checkoutid) {
        String sql = "DELETE FROM order_detail WHERE order_id = ?";
        jdbcTemplate.update(sql, checkoutid);
    }

    // Thêm phương thức để cập nhật số lượng sản phẩm trong kho khi hủy đơn hàng
    public void updateQuantityOnCancel(int productId, int quantity) {
        String sql = "UPDATE product SET quantity = quantity + ? WHERE id = ?";
        jdbcTemplate.update(sql, quantity, productId);
    }

    // Lấy danh sách chi tiết đơn hàng
    public List<CheckoutDetail> getCheckoutDetails(int checkoutid) {
        String sql = "SELECT * FROM order_detail WHERE order_id = ?";
        return jdbcTemplate.query(sql, new Object[]{checkoutid}, new CheckoutDetailMapper());
    }
    public List<OrderDetail> getOrderDetailByOrder(int orderId){
        List<OrderDetail> list = new ArrayList<OrderDetail>();
        String sql = "SELECT od.*, product_name, product_price, product_img " +
                "FROM order_detail od " +
                "INNER JOIN product p ON od.product_id = p.id " +
                "WHERE od.order_id = ?";
        list = jdbcTemplate.query(sql, new Object[]{orderId}, new OrderDetailMapper());
        return list;
    }
    public Checkout orderById(int orderId){
        Checkout orders = new Checkout();
        String sql = "Select *  from orders where id=?";
        orders = jdbcTemplate.queryForObject(sql,new Object[]{orderId}, new CheckoutMapper());
        return orders;

    }
}
