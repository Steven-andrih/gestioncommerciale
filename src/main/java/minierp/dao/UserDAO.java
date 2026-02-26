package minierp.dao;

import minierp.model.User;

public interface UserDAO {

    User findByEmailAndPassword(String email, String password);

}