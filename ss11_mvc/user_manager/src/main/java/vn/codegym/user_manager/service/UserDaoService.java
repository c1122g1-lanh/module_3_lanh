package vn.codegym.user_manager.service;

import vn.codegym.user_manager.model.User;
import vn.codegym.user_manager.respository.UserDaoRespository;

import java.sql.SQLException;
import java.util.List;

public class UserDaoService implements IUserDaoService {
    UserDaoRespository userDaoRespository = new UserDaoRespository();

    @Override
    public void insertUser(User user) throws SQLException {
        userDaoRespository.insertUser(user);
    }

    @Override
    public User selectUser(int id) {
        return userDaoRespository.selectUser(id);
    }

    @Override
    public List<User> selectAllUsers() {
        return userDaoRespository.selectAllUsers();
    }

    @Override
    public boolean deleteUser(int id) throws SQLException {
        return userDaoRespository.deleteUser(id);
    }

    @Override
    public boolean updateUser(User user) throws SQLException {
        return userDaoRespository.updateUser(user);
    }

    @Override
    public List<User> findByName(String name) {
        return userDaoRespository.findByName(name);
    }

    @Override
    public List<User> sortList() {
        return userDaoRespository.sortList();
    }

    @Override
    public List<User> selectAllUsers1() throws SQLException {
        return userDaoRespository.selectAllUsers1();
    }

    @Override
    public void updateUser1(User user) {
        userDaoRespository.updateUser1(user);
    }

}
