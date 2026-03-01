<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="isLocked" value="${commande.etat == 'valide' || commande.etat == 'annuler'}" />

<jsp:include page="../header.jsp" />

<div class="container mt-5">
    <h2>Articles de la commande N° : ${commande.id} / Status : ${commande.etat}</h2>

    <form action="${pageContext.request.contextPath}/ArticleServlet" method="post" class="mb-4">
        <input type="hidden" name="idCommande" value="${commande.id}">
        <div class="row g-3 align-items-end">
            <div class="col-md-5">
                <label class="form-label">Produit</label>
                <select name="idProduit" class="form-select" required>
                    <c:forEach var="p" items="${produits}">
                        <option value="${p.id}">${p.nomProduit} (${p.unite})</option>
                    </c:forEach>
                </select>
            </div>
            <div class="col-md-3">
                <label class="form-label">Quantité</label>
                <input type="number" step="0.01" name="quantite" class="form-control" required>
            </div>
            <div class="col-md-4">
                <button type="submit" class="btn btn-primary w-100" ${isLocked ? "disabled" : ""} >Ajouter Article</button>
            </div>
        </div>
    </form>

    <table class="table table-hover">
        <thead>
            <tr>
                <th>ID</th>
                <th>Produit</th>
                <th>Quantité</th>
                <th>Montant</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="a" items="${articles}">
                <tr>
                    <td>${a.id}</td>
                    <td>${a.produit.nomProduit}</td>
                    <td>${a.quantiteProduit}</td>
                    <td>${a.montantArticle} €</td>
                    <td>
                        <button class="btn btn-sm btn-warning" data-bs-toggle="modal" data-bs-target="#modalModifier${a.id}" ${isLocked ? "disabled" : ""}>
                            Modifier
                        </button>

                        <a 
                        href="${pageContext.request.contextPath}/ArticleServlet?action=delete&id=${a.id}&commande_id=${a.commande.id}" 
                        class="btn btn-sm btn-danger"
                        ${isLocked ? "disabled" : ""}>
                        Supprimer
                        </a>
                    </td>
                </tr>

                <div class="modal fade" id="modalModifier${a.id}" tabindex="-1" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <form action="${pageContext.request.contextPath}/ArticleServlet" method="post">
                                <div class="modal-header">
                                    <h5 class="modal-title">Modifier Quantité : ${a.produit.nomProduit}</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-content p-3">
                                    <input type="hidden" name="idArticle" value="${a.id}">
                                    <input type="hidden" name="idCommande" value="${a.commande.id}">
                                    <input type="hidden" name="modifier" value="true">
                                    <div class="mb-3">
                                        <label class="form-label">Nouvelle Quantité</label>
                                        <input type="number" name="nouvelleQuantite" value="${a.quantiteProduit}" class="form-control" required>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Annuler</button>
                                    <button type="submit" class="btn btn-primary">Enregistrer</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </tbody>
    </table>

    <div class="d-flex justify-content-end mt-3 gap-2">
        <form action="${pageContext.request.contextPath}/ArticleServlet" method="post">
            <input type="hidden" name="validerCommande" value="true">
            <input type="hidden" name="idCommande" value="${commande.id}">
            <button type="submit" class="btn btn-success" ${isLocked ? "disabled" : ""} >Valider la commande</button>
        </form>
        <form action="${pageContext.request.contextPath}/ArticleServlet" method="post">
            <input type="hidden" name="annulerCommande" value="true">
            <input type="hidden" name="idCommande" value="${commande.id}">
            <button type="submit" class="btn btn-dark" ${isLocked ? "disabled" : ""} >Annuler la commande</button>
        </form>

        <a href="#" class="btn btn-primary">Facturé</a>
    </div>
</div>

<jsp:include page="../footer.jsp" />