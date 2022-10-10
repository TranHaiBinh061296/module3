package com.codegym.productmanagement.service;

import com.codegym.productmanagement.model.Product;

import java.util.List;

public interface IProductService {
    List<Product> findAll();

    Product findById(int id);

    List<Product> findByName(String name);

    void save(Product product);

    void update(int id, Product product);

    void remove(int id);
}