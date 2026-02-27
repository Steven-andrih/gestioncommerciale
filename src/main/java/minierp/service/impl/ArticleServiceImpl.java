package minierp.service.impl;

import java.util.List;
import minierp.dao.ArticleDAO;
import minierp.dao.impl.ArticleDAOImpl;
import minierp.model.Article;
import minierp.service.ArticleService;

public class ArticleServiceImpl implements ArticleService {

    private ArticleDAO articleDAO = new ArticleDAOImpl();

    @Override
    public Article save(Article article) {
        return articleDAO.save(article);
    }

    @Override
    public Article update(Article article) {
        return articleDAO.update(article);
    }

    @Override
    public void delete(Long id) {
        articleDAO.delete(id);
    }

    @Override
    public Article findById(Long id) {
        return articleDAO.findById(id);
    }

    @Override
    public List<Article> findAll() {
        return articleDAO.findAll();
    }

    @Override
    public List<Article> findByCommande(Long idCommande) {
        return articleDAO.findByCommande(idCommande);
    }
}