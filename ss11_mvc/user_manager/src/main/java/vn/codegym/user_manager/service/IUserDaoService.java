package vn.codegym.user_manager.service;

import vn.codegym.user_manager.model.User;
import vn.codegym.user_manager.respository.UserDaoRespository;

import java.sql.SQLException;
import java.util.List;

public interface IUserDaoService {
    public void insertUser(User user) throws SQLException;

    public User selectUser(int id);

    public List<User> selectAllUsers();

    public boolean deleteUser(int id) throws SQLException;

    public boolean updateUser(User user) throws SQLException;

    List<User> findByName(String name);

    List<User> sortList();

    List<User> selectAllUsers1() throws SQLException;

    void updateUser1(User user);
}
