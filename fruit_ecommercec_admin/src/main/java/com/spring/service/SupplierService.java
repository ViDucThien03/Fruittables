package com.spring.service;

import com.spring.model.Supplier;

import java.util.List;

public interface SupplierService {
    List<Supplier> getSuppliers();
    Supplier getSupplierById(int id);
    void addSupplier(Supplier supplier);
    void updateSupplier(Supplier supplier);
    void deleteSupplier(int id);
    public int countSupplier();
    public List<Supplier>paginationSupplier(int index);
}
