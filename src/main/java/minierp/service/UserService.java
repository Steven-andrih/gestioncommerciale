package minierp.service;

import minierp.model.User;

public interface UserService {

    User login(String email, String password);

}