package minierp.dao;

import java.util.List;
import minierp.model.Article;

public interface ArticleDAO {
    Article save(Article article);
    Article update(Article article);
    void delete(Long id);
    Article findById(Long id);
    List<Article> findAll();

    // <-- Ajouter cette méthode
    List<Article> findByCommande(Long idCommande);
}