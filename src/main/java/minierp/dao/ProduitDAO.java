package minierp.dao;

import java.util.List;
import minierp.model.Produit;

public interface ProduitDAO {

    Produit save(Produit produit);

    Produit update(Produit produit);

    void delete(Long id);

    Produit findById(Long id);

    List<Produit> findAll();
}