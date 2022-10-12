package com.codegym.searchcountry.controller;


import com.codegym.searchcountry.model.CountryDAO;
import com.codegym.searchcountry.model.ICountryDAO;
import com.codegym.searchcountry.model.IUserDAO;
import com.codegym.searchcountry.model.UserDAO;
import com.codegym.searchcountry.view.Country;
import com.codegym.searchcountry.view.User;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import javax.validation.ConstraintViolation;
import javax.validation.Validation;
import javax.validation.Validator;
import javax.validation.ValidatorFactory;
@WebServlet(name = "UserServlet", urlPatterns = {"/users"})
public class UserServlet extends HttpServlet {

    private IUserDAO iUserDAO;
    private ICountryDAO iCountryDAO;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }

        try {
            switch (action) {
                case "create":
                    showNewForm(request, response);
                    break;
                case "edit":
                    showEditForm(request, response);
                    break;
                default:
                    listUser(request, response);

            }
        } catch (IOException ex) {
            throw new ServletException(ex);
        }
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try{
            int id = Integer.parseInt(request.getParameter("id"));
            User user = iUserDAO.selectUser(id);
            RequestDispatcher requestDispatcher;
            if(user ==null){
                // User khong ton tai
                requestDispatcher = request.getRequestDispatcher("user/list.jsp");
                request.setAttribute("message", "User khong ton tai");
                List<User> list = iUserDAO.selectAllUsers();
                request.setAttribute("list", list);

            }else{
                requestDispatcher = request.getRequestDispatcher("user/edit.jsp");
                request.setAttribute("user", user);
            }

            requestDispatcher.forward(request, response);


        }catch (NumberFormatException ex){

        }


    }

    private void listUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("user/list.jsp");
        List<User> listUser = iUserDAO.selectAllUsers();

        request.setAttribute("list", listUser);
        requestDispatcher.forward(request, response);
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("user/create.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action  = request.getParameter("action");
        if(action==null){
            action="";
        }
        try{
            switch (action){
                case "create":
                    insertUser(request, response);
                    break;
            }
        }catch (SQLException ex){
            ex.printStackTrace();
        }


    }

    private void insertUser(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        List<String> errors = new ArrayList<>();
        String name = request.getParameter("name");
        String email = request.getParameter("email");

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("user/create.jsp");
        User user = new User();
        try{

            user.setEmail(email);
            user.setName(name);
            int idCountry = Integer.parseInt(request.getParameter("country"));
            // Kiểm tra idCountry có hợp lệ hay koong
            user.setIdCountry(idCountry);
            ValidatorFactory validatorFactory = Validation.buildDefaultValidatorFactory();
            Validator validator = validatorFactory.getValidator();
            Set<ConstraintViolation<User>> constraintViolations = validator.validate(user);

            if(!constraintViolations.isEmpty()){
                // Lỗi ràng buộc
                for(ConstraintViolation<User> constraintViolation : constraintViolations){
                    errors.add(constraintViolation.getMessage());
                }
                request.setAttribute("user", user);
                request.setAttribute("errors", errors);
//                errors.isEmpty()
            }else{
                // Không có lỗi
                // Kiểm tra email có tồn tại hay chưa
                if(iUserDAO.checkEmailExists(email)){
                    //Da ton tai email
                    request.setAttribute("user", user);
                    errors.add("Email đã tồn tại");
                }else{
                    iUserDAO.insertUser(user);
                    request.setAttribute("message", "Insert success!!.....");
                }

            }
            requestDispatcher.forward(request, response);
        }catch (NumberFormatException numberFormatException){
            //
            errors.add("Định dạng của country không hợp lệ");
            request.setAttribute("errors", errors);
            request.setAttribute("user", user);
            requestDispatcher.forward(request, response);
        }


    }

    @Override
    public void init() throws ServletException {
        iUserDAO = new UserDAO();
        iCountryDAO = new CountryDAO();

        List<Country> listCountry = iCountryDAO.selectAllCountry();

        if(this.getServletContext().getAttribute("listCountry")==null){
            this.getServletContext().setAttribute("listCountry", listCountry);
        }

    }
}