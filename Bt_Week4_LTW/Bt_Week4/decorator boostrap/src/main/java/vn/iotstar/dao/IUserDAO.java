package vn.iotstar.dao;

import vn.iotstar.models.User;

public interface IUserDAO {
    User findById(int id);
    User findByUsername(String username);
    boolean updateProfile(User user);
}