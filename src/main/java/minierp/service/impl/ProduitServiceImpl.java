package minierp.service.impl;

import java.util.List;

import minierp.dao.ProduitDAO;
import minierp.dao.impl.ProduitDAOImpl;
import minierp.model.Produit;
import minierp.service.ProduitService;

public class ProduitServiceImpl implements ProduitService {

    private ProduitDAO produitDAO = new ProduitDAOImpl();

    @Override
    public Produit save(Produit produit) {
        return produitDAO.save(produit);
    }

    @Override
    public Produit update(Produit produit) {
        return produitDAO.update(produit);
    }

    @Override
    public void delete(Long id) {
        produitDAO.delete(id);
    }

    @Override
    public Produit findById(Long id) {
        return produitDAO.findById(id);
    }

    @Override
    public List<Produit> findAll() {
        return produitDAO.findAll();
    }
}