<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../header.jsp" />

<div class="container mt-5">

    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2>Gestion des Produits</h2>
        <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#produitModal">
            + Ajouter
        </button>
    </div>

    <div class="card shadow">
        <div class="card-body">
            <table class="table table-hover align-middle">
                <thead class="table-light">
                    <tr>
                        <th>ID</th>
                        <th>Nom</th>
                        <th>Catégorie</th>
                        <th>Quantité</th>
                        <th>Prix</th>
                        <th>Unité</th>
                        <th class="text-end">Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="p" items="${produits}">
                        <tr>
                            <td>${p.id}</td>
                            <td>${p.nomProduit}</td>
                            <td>${p.categorie.nomCategorie}</td>
                            <td>${p.quantite}</td>
                            <td>${p.prixUnite}</td>
                            <td>${p.unite}</td>
                            <td class="text-end">

                                <button class="btn btn-sm btn-warning"
                                    data-bs-toggle="modal"
                                    data-bs-target="#produitModal"
                                    onclick="
                                        document.getElementById('id').value='${p.id}';
                                        document.getElementById('nom').value='${p.nomProduit}';
                                        document.getElementById('categorie').value='${p.categorie.id}';
                                        document.getElementById('quantite').value='${p.quantite}';
                                        document.getElementById('prix').value='${p.prixUnite}';
                                        document.getElementById('unite').value='${p.unite}';
                                    ">
                                    Modifier
                                </button>

                                <a href="${pageContext.request.contextPath}/ProduitServlet?action=delete&id=${p.id}"
                                   class="btn btn-sm btn-danger">
                                    Supprimer
                                </a>

                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

</div>

<!-- MODAL BOOTSTRAP -->
<div class="modal fade" id="produitModal" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">

            <div class="modal-header">
                <h5 class="modal-title">Produit</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>

            <form action="${pageContext.request.contextPath}/ProduitServlet" method="post">
                <div class="modal-body">

                    <input type="hidden" id="id" name="id">

                    <div class="mb-3">
                        <label class="form-label">Nom</label>
                        <input type="text" id="nom" name="nomProduit" class="form-control" required>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Catégorie</label>
                        <select id="categorie" name="idCategorie" class="form-select" required>
                            <c:forEach var="c" items="${categories}">
                                <option value="${c.id}">${c.nomCategorie}</option>
                            </c:forEach>
                        </select>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Quantité</label>
                        <input value="0" type="number" id="quantite" name="quantite" class="form-control" readonly>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Prix</label>
                        <input type="number" step="0.01" id="prix" name="prixUnite" class="form-control" required>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Unité</label>
                        <select id="unite" name="unite" class="form-select">
                            <option value="KG">KG</option>
                            <option value="Unité">Unité</option>
                        </select>
                    </div>

                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                        Annuler
                    </button>
                    <button type="submit" class="btn btn-primary">
                        Enregistrer
                    </button>
                </div>
            </form>

        </div>
    </div>
</div>

<jsp:include page="../footer.jsp" />