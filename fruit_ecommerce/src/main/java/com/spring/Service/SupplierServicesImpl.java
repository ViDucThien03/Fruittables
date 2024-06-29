package com.spring.Service;

import com.spring.DAO.HomeDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SupplierServicesImpl implements SupplierServices{
    @Autowired
    private HomeDAO homeDAO;
    @Override
    public int countCertificates() {
        return homeDAO.countCertificates();
    }

    @Override
    public double quantityService() {
        return homeDAO.quantityService();
    }

    @Override
    public int satisfiedCustomers() {
        return homeDAO.satisfiedCustomers();
    }
}
