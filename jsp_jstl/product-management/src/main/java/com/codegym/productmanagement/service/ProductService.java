package com.codegym.productmanagement.service;

import com.codegym.productmanagement.model.Product;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductService implements IProductService{
    private static Map<Integer, Product> products;

    static {
        products = new HashMap<>();
        products.put(1, new Product(1, "Ghe sofa", 10000, 190,"Phong Khach","VN"));
        products.put(2, new Product(2, "Giuong go soi", 12000, 120,"Phong Ngu","Korea"));
        products.put(3, new Product(3,"Ke sach", 455000, 40,"Phong Sach","Japanese"));
        products.put(4, new Product(4, "Tu bep", 150000, 10,"Phong Bep","China"));
    }
    @Override
    public List<Product> findAll() {
        return new ArrayList<>(products.values());
    }

    @Override
    public Product findById(int id) {
        return products.get(id);
    }

    @Override
    public List<Product> findByName(String name) {
        List<Product> listProducts = new ArrayList<>(products.values());
        List<Product> listSearchName = new ArrayList<>();
        name = name.toLowerCase();
        for (Product product: listProducts) {
            if (product.getName().toLowerCase().contains(name)) {
                listSearchName.add(product);
            }
        }
        return listSearchName;
    }

    @Override
    public void save(Product product) {
        products.put(product.getId(), product);
    }

    @Override
    public void update(int id, Product product) {
        products.put(id, product);
    }

    @Override
    public void remove(int id) {
        products.remove(id);
    }
}
