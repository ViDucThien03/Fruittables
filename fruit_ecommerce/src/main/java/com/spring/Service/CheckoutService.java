package com.spring.Service;

import com.spring.model.Cart;
import com.spring.model.Checkout;
import com.spring.model.CheckoutDetail;
import com.spring.model.OrderDetail;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public interface CheckoutService
{
    public int addCheckout(Checkout checkout);
    public void addCheckoutDetail(HashMap<Integer, Cart> carts);
    public List<Checkout> getOrder(int userID);
    public List<OrderDetail> getOrderDetail(int checkoutid);
    public OrderDetail getOneOrderDetail(int checkoutid);
    public void cancelOrder(int checkoutid);
    public List<OrderDetail> getOrderDetailByOrder(int orderId);
    public Checkout orderById(int orderId);
}
