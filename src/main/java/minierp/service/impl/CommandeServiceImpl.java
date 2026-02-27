package minierp.service.impl;

import java.util.List;
import minierp.dao.CommandeDAO;
import minierp.dao.impl.CommandeDAOImpl;
import minierp.model.Commande;
import minierp.service.CommandeService;

public class CommandeServiceImpl implements CommandeService {

    private CommandeDAO commandeDAO = new CommandeDAOImpl();

    @Override
    public Commande save(Commande commande) {
        return commandeDAO.save(commande);
    }

    @Override
    public Commande update(Commande commande) {
        return commandeDAO.update(commande);
    }

    @Override
    public void delete(Long id) {
        commandeDAO.delete(id);
    }

    @Override
    public Commande findById(Long id) {
        return commandeDAO.findById(id);
    }

    @Override
    public List<Commande> findAll() {
        return commandeDAO.findAll();
    }

    @Override
    public List<Commande> findByUserId(Long userId) {
        return commandeDAO.findByUserId(userId);
    }
}