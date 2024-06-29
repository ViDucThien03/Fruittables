package com.spring.service;

import com.spring.dao.SupplierDao;
import com.spring.model.Supplier;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SupplierServiceImpl implements SupplierService {

    @Autowired
    private SupplierDao supplierDao;

    @Override
    public List<Supplier> getSuppliers() {
        return supplierDao.getSuppliers();
    }

    @Override
    public Supplier getSupplierById(int id) {
        return supplierDao.getSupplierById(id);
    }

    @Override
    public void addSupplier(Supplier supplier) {
        supplierDao.addSupplier(supplier);
    }

    @Override
    public void updateSupplier(Supplier supplier) {
        supplierDao.updateSupplier(supplier);
    }

    @Override
    public void deleteSupplier(int id) {
        supplierDao.deleteSupplier(id);
    }

    @Override
    public int countSupplier() {
        return supplierDao.countSupplier();
    }

    @Override
    public List<Supplier> paginationSupplier(int index) {
        return supplierDao.paginationSupplier(index);
    }
}
