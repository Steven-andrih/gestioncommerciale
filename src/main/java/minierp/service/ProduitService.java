package minierp.service;

import java.util.List;

import minierp.model.Article;
import minierp.model.Produit;

public interface ProduitService {

    Produit save(Produit produit);

    Produit update(Produit produit);

    void delete(Long id);

    Produit findById(Long id);

    List<Produit> findAll();

    void subProductStock(Long id, double quantitePrise);

    void normalizeProductStock(List<Article> articles);
}