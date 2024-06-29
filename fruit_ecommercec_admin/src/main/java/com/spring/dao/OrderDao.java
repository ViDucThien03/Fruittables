package com.spring.dao;

import com.spring.model.OrderDetail;
import com.spring.model.OrderDetailMapper;

import com.spring.model.OrderMapper;
import com.spring.model.Orders;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import java.util.ArrayList;
import java.util.List;

@Repository
public class OrderDao {
    @Autowired
    private JdbcTemplate jdbcTemplate;

    public int countOrder(){
        String sql = "select count(*) from orders";
        int count = jdbcTemplate.queryForObject(sql, new Object[]{},Integer.class);
        return count;
    }
    public List<Orders> getAllOrder(int index){
        List<Orders> list = new ArrayList<Orders>();
        String sql = "SELECT * FROM orders limit 10 offset ?";
        int page = (index-1) * 10;
        Object[] params = new Object[]{page};
        list = jdbcTemplate.query(sql,params,new OrderMapper());
        return list;
    }
    public void updateDeliveryStatus(int orderId, String status) {
        String sql = "UPDATE orders SET status = ? WHERE id = ?";
        jdbcTemplate.update(sql, status, orderId);
    }
    public List<OrderDetail> getOrderDetailByOrder(int orderId){
        List<OrderDetail> list = new ArrayList<OrderDetail>();
        String sql = "SELECT od.*, product_name, product_price " +
                "FROM order_detail od " +
                "INNER JOIN product p ON od.product_id = p.id " +
                "WHERE od.order_id = ?";
        list = jdbcTemplate.query(sql, new Object[]{orderId}, new OrderDetailMapper());
        return list;
    }
    public Orders orderById(int orderId){
        Orders orders = new Orders();
        String sql = "Select *  from orders where id=?";
        orders = jdbcTemplate.queryForObject(sql,new Object[]{orderId}, new OrderMapper());
        return orders;
    }
}
