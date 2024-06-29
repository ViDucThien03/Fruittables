package com.spring.Service;

import com.spring.DAO.CartDAO;
import com.spring.model.Cart;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;

@Service
public class CartServiceImpl implements CartService
{
    @Autowired
    private CartDAO cartDAO = new CartDAO();

    @Override
    public HashMap<Integer, Cart> addCart(int id, HashMap<Integer, Cart> cart, int quantity) {
        return cartDAO.addCart(id, cart, quantity);
    }

    @Override
    public HashMap<Integer, Cart> editCart(int id, int quantity, HashMap<Integer, Cart> cart) {
        return cartDAO.editCart(id, quantity, cart);
    }

    @Override
    public HashMap<Integer, Cart> deleteCart(int id, HashMap<Integer, Cart> cart) {
        return cartDAO.deleteCart(id, cart);
    }

    @Override
    public int totalQuantity(HashMap<Integer, Cart> cart) {
        return cartDAO.totalQuantity(cart);
    }

    @Override
    public double totalPrice(HashMap<Integer, Cart> cart) {
        return cartDAO.totalPrice(cart);
    }
}
