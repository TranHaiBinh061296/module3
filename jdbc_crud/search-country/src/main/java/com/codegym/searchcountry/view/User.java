package com.codegym.searchcountry.view;



import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;

public class User {
    private int id;
    private String name;
    private String email;
    private int idCountry;

    public User(){

    }
    public User(int id, String name, String email, int idCountry) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.idCountry = idCountry;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @NotEmpty(message = "Name không được để trống")
    public String getName() {
        return name;
    }


    public void setName(String name) {
        this.name = name;
    }

    @Email(regexp = "^[A-Za-z0-9.]*[A-Za-z0-9]+@[A-Za-z0-9]+(\\\\.[A-Za-z0-9]+)$", message = "Email không hợp lệ")
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getIdCountry() {
        return idCountry;
    }

    public void setIdCountry(int idCountry) {
        this.idCountry = idCountry;
    }
}
