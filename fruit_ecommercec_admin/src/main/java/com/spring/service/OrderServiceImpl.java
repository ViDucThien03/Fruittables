package com.spring.service;

import com.spring.dao.OrderDao;
import com.spring.model.OrderDetail;
import com.spring.model.Orders;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class OrderServiceImpl implements OrderService{
    @Autowired
    private OrderDao orderDao;
    @Override
    public int countOrder() {
        return orderDao.countOrder();
    }

    @Override
    public List<Orders> getAllOrder(int index) {
        return orderDao.getAllOrder(index);
    }

    @Override
    public void updateDeliveryStatus(int orderId, String status) {
        orderDao.updateDeliveryStatus(orderId,status);
    }

    @Override
    public List<OrderDetail> getOrderDetailByOrder(int orderId) {
        return orderDao.getOrderDetailByOrder(orderId);
    }

    @Override
    public Orders orderById(int orderId) {
        return orderDao.orderById(orderId);
    }
}
