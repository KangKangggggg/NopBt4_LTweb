package vn.iotstar.services;

import vn.iotstar.models.User;

public interface IUserService {
    User getUserById(int id);
    User getUserByUsername(String username);
    boolean updateUserProfile(User user);
}