package minierp.service;

import java.util.List;
import minierp.model.Approvisionnement;

public interface ApprovisionnementService {

    Approvisionnement save(Approvisionnement approvisionnement);

    Approvisionnement update(Approvisionnement approvisionnement);

    void delete(Long id);

    Approvisionnement findById(Long id);

    List<Approvisionnement> findAll();

    List<Approvisionnement> findByProduitId(Long produitId);
}