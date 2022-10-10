package com.codegym.customermanagement.service;

import com.codegym.customermanagement.model.Customer;

import java.util.List;

public interface CustomerService {
    //Trả về danh sách tất cả khách hàng
    List<Customer> fillAll();
    //Lưu một khách hàng
    void save(Customer customer);
    // Tìm một khách hàng theo Id
    Customer findById(int id);
    //Cập nhật thông tin của một khách hàng
    void update(int id, Customer customer);
    //Xoá một khách hàng khỏi danh sách
    void remove(int id);

}
