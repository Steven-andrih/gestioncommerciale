<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../header.jsp" />

<div class="container mt-5">
    <h2>Articles de la commande #${commande.id}</h2>

    <form action="${pageContext.request.contextPath}/ArticleServlet" method="post" class="mb-4">
        <input type="hidden" name="idCommande" value="${commande.id}">
        <div class="row g-3 align-items-end">
            <div class="col-md-6">
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
            <div class="col-md-3">
                <button type="submit" class="btn btn-primary w-100">Ajouter Article</button>
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
            </tr>
        </thead>
        <tbody>
            <c:forEach var="a" items="${articles}">
                <tr>
                    <td>${a.id}</td>
                    <td>${a.produit.nomProduit}</td>
                    <td>${a.quantiteProduit}</td>
                    <td>${a.montantArticle}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <div class="d-flex justify-content-end mt-3">
        <form action="${pageContext.request.contextPath}/ArticleServlet" method="post">
            <input type="hidden" name="validerCommande" value="true">
            <input type="hidden" name="idCommande" value="${commande.id}">
            <button type="submit" class="btn btn-success">Valider la commande</button>
        </form>
    </div>

</div>

<jsp:include page="../footer.jsp" />