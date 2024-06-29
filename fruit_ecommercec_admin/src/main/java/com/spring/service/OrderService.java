package com.spring.service;

import com.spring.model.OrderDetail;
import com.spring.model.Orders;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface OrderService {
    public int countOrder();
    public List<Orders> getAllOrder(int index);
    public void updateDeliveryStatus(int orderId, String status);
    public List<OrderDetail> getOrderDetailByOrder(int orderId);
    public Orders orderById( int orderId);
}
