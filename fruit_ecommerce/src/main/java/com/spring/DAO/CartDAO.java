package com.spring.DAO;

import com.spring.model.Cart;

import com.spring.model.Products;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import java.util.HashMap;
import java.util.Map;

@Repository
public class CartDAO
{
    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Autowired
    ProductDetailDAO productDAO = new ProductDetailDAO();

    // ITEM IN CART
    public HashMap<Integer, Cart> addCart(int id, HashMap<Integer, Cart> cart, int quantity)
    {
        Cart itemCart = new Cart();
        Products product = productDAO.FindProductByID(id);
        if(product != null && cart.containsKey(id))
        {
            itemCart = cart.get(id);
            itemCart.setQuantity(itemCart.getQuantity() + quantity);
            itemCart.setTotalPrice(itemCart.getProduct().getProductPrice() * itemCart.getQuantity());
        }
        else
        {
            itemCart.setProduct(product);
            itemCart.setQuantity(quantity);
            itemCart.setTotalPrice(product.getProductPrice());
        }
        cart.put(id, itemCart);
        return cart;
    }

    public HashMap<Integer, Cart> editCart(int id, int quantity, HashMap<Integer, Cart> cart)
    {
        if(cart == null) return cart;

        Cart itemCart = new Cart();
        if(cart.containsKey(id))
        {
            itemCart = cart.get(id);
            itemCart.setQuantity(quantity);
            itemCart.setTotalPrice(itemCart.getProduct().getProductPrice() * quantity);
        }
        cart.put(id, itemCart);
        return cart;
    }

    public HashMap<Integer, Cart> deleteCart(int id, HashMap<Integer, Cart> cart)
    {
        if(cart == null) return cart;
        if(cart.containsKey(id)) cart.remove(id);
        return cart;
    }

    public int totalQuantity(HashMap<Integer, Cart> cart)
    {
        int totalQuantity = 0;
        for(Map.Entry<Integer, Cart> item : cart.entrySet()) {
            totalQuantity += item.getValue().getQuantity();
        }
        return totalQuantity;
    }

    public double totalPrice(HashMap<Integer, Cart> cart)
    {
        double totalPrice = 0;
        for(Map.Entry<Integer, Cart> item : cart.entrySet()) {
            totalPrice += item.getValue().getTotalPrice();
        }
        return totalPrice;
    }
}
