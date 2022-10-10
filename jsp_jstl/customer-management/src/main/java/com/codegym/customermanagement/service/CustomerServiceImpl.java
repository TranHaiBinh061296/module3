package com.codegym.customermanagement.service;

import com.codegym.customermanagement.model.Customer;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class CustomerServicelmpl implements CustomerService {

    private static Map<Integer, Customer> customers;

    static {
        customers = new HashMap<>();
        customers.put(1, new Customer(1, "Binh", "haibinh@gmail.com", "Quang Tri"));
        customers.put(2, new Customer(2, "Khanh Hoang", "khanh@gmail.com", "Quang Tri"));
        customers.put(3, new Customer(3, "Minh Hieu", "hieu@gmail.com", "Quang Tri"));
        customers.put(4, new Customer(4, "Dao Ba Loc", "loc@gmail.com", "Quang Tri"));
        customers.put(5, new Customer(5, "Quy", "quy@gmail.com", "Quang Tri"));
    }

    @Override
    public List<Customer> fillAll() {
        return new ArrayList<>(customers.values());
    }

    @Override
    public void save(Customer customer) {
        customers.put(customer.getId(), customer);
    }

    @Override
    public Customer findById(int id) {
        return customers.get(id);
    }

    @Override
    public void update(int id, Customer customer) {
        customers.put(id, customer);
    }

    @Override
    public void remove(int id) {
        customers.remove(id);
    }
}
