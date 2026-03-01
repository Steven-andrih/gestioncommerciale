package minierp.service.impl;

import java.util.List;

import minierp.dao.ProduitDAO;
import minierp.dao.impl.ProduitDAOImpl;
import minierp.model.Article;
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

    @Override
    public void subProductStock(Long id, double quantitePrise) {
        Produit p = produitDAO.findById(id);
        p.subStock(quantitePrise);
        produitDAO.update(p);
    }

    @Override
    public void normalizeProductStock(List<Article> articles) {
        if (articles.isEmpty() || articles == null) {
            throw new RuntimeException("Listes d'article vide !");
        }
        for (Article a : articles) {
            subProductStock(a.getProduit().getId(), a.getQuantiteProduit());
        }
    }

}