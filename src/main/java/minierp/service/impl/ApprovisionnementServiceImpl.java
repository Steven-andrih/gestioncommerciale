package minierp.service.impl;

import java.time.LocalDateTime;
import java.util.List;

import minierp.dao.ApprovisionnementDAO;
import minierp.dao.ProduitDAO;
import minierp.dao.impl.ApprovisionnementDAOImpl;
import minierp.dao.impl.ProduitDAOImpl;
import minierp.model.Approvisionnement;
import minierp.model.Produit;
import minierp.service.ApprovisionnementService;

public class ApprovisionnementServiceImpl implements ApprovisionnementService {

    private ApprovisionnementDAO approvisionnementDAO = new ApprovisionnementDAOImpl();

    @Override
    public Approvisionnement save(Approvisionnement approvisionnement) {

    	ProduitDAO pDAO = new ProduitDAOImpl();
        Produit produit = approvisionnement.getProduit();
        
        produit.setQuantite(
            produit.getQuantite() + approvisionnement.getQuantiteAjoute()
        );
        
        System.out.println("Le stock du produit doit etre : "+ produit.getQuantite());
        pDAO.update(produit);

        return approvisionnementDAO.save(approvisionnement);
    }

    @Override
    public Approvisionnement update(Approvisionnement approvisionnement) {
        return approvisionnementDAO.update(approvisionnement);
    }

    @Override
    public void delete(Long id) {
        approvisionnementDAO.delete(id);
    }

    @Override
    public Approvisionnement findById(Long id) {
        return approvisionnementDAO.findById(id);
    }

    @Override
    public List<Approvisionnement> findAll() {
        return approvisionnementDAO.findAll();
    }

    @Override
    public List<Approvisionnement> findByProduitId(Long produitId) {
        return approvisionnementDAO.findByProduitId(produitId);
    }
}