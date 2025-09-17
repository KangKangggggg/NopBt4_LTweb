package vn.iotstar.services.impl;

import vn.iotstar.dao.IUserDAO;
import vn.iotstar.dao.impl.UserDAOImpl;
import vn.iotstar.models.User;
import vn.iotstar.services.IUserService;

public class UserServiceImpl implements IUserService {
    private IUserDAO userDAO = new UserDAOImpl();

    @Override
    public User getUserById(int id) {
        return userDAO.findById(id);
    }

    @Override
    public User getUserByUsername(String username) {
        return userDAO.findByUsername(username);
    }

    @Override
    public boolean updateUserProfile(User user) {
        return userDAO.updateProfile(user);
    }
}