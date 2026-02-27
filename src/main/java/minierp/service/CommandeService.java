package minierp.service;

import java.util.List;
import minierp.model.Commande;

public interface CommandeService {

    Commande save(Commande commande);

    Commande update(Commande commande);

    void delete(Long id);

    Commande findById(Long id);

    List<Commande> findAll();

    List<Commande> findByUserId(Long userId);
}