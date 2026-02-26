package minierp.service.impl;

import minierp.dao.UserDAO;
import minierp.dao.impl.UserDAOImpl;
import minierp.model.User;
import minierp.service.UserService;

public class UserServiceImpl implements UserService {

    private UserDAO userDAO = new UserDAOImpl();

    @Override
    public User login(String email, String password) {
        return userDAO.findByEmailAndPassword(email, password);
    }
}