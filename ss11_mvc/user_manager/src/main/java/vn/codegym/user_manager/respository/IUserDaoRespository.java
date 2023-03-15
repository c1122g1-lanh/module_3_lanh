package vn.codegym.user_manager.respository;


import vn.codegym.user_manager.model.User;

import java.sql.SQLException;

import java.util.List;

public interface IUserDaoRespository {
    public void insertUser(User user) throws SQLException;

    public User selectUser(int id);

    public List<User> selectAllUsers();

    public boolean deleteUser(int id) throws SQLException;

    public boolean updateUser(User user) throws SQLException;

    List<User> findByName(String name);

    List<User> sortList();
}

