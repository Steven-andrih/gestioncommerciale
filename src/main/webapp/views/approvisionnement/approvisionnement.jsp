<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../header.jsp" />

<div class="container mt-5">

    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2>Gestion des Approvisionnements</h2>
        <button class="btn btn-primary"
                data-bs-toggle="modal"
                data-bs-target="#approModal"
                onclick="resetForm()">
            + Ajouter
        </button>
    </div>

    <div class="card shadow">
        <div class="card-body">
            <table class="table table-hover align-middle">
                <thead class="table-light">
                    <tr>
                        <th>ID</th>
                        <th>Produit</th>
                        <th>Quantité Ajoutée</th>
                        <th>Date</th>
                        <th class="text-end">Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="a" items="${approvisionnements}">
                        <tr>
                            <td>${a.id}</td>
                            <td>${a.produit.nomProduit}</td>
                            <td>${a.quantiteAjoute}</td>
                            <td>${a.dateHeure}</td>
                            <td class="text-end">

                                <button class="btn btn-sm btn-warning"
                                    data-bs-toggle="modal"
                                    data-bs-target="#approModal"
                                    onclick="
                                        document.getElementById('id').value='${a.id}';
                                        document.getElementById('produit').value='${a.produit.id}';
                                        document.getElementById('quantiteAjoute').value='${a.quantiteAjoute}';
                                    ">
                                    Modifier
                                </button>

                                <a href="${pageContext.request.contextPath}/ApprovisionnementServlet?action=delete&id=${a.id}"
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

<!-- MODAL -->
<div class="modal fade" id="approModal" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">

            <div class="modal-header">
                <h5 class="modal-title">Approvisionnement</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>

            <form action="${pageContext.request.contextPath}/ApprovisionnementServlet" method="post">
                <div class="modal-body">

                    <input type="hidden" id="id" name="id">

                    <div class="mb-3">
                        <label class="form-label">Produit</label>
                        <select id="produit" name="idProduit" class="form-select" required>
                            <c:forEach var="p" items="${produits}">
                                <option value="${p.id}">
                                    ${p.nomProduit}
                                </option>
                            </c:forEach>
                        </select>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Quantité à ajouter</label>
                        <input type="number"
                               step="0.01"
                               id="quantiteAjoute"
                               name="quantiteAjoute"
                               class="form-control"
                               required>
                    </div>

                    <div class="alert alert-info">
                        ⚠ La date est automatique.
                        Le stock sera mis à jour automatiquement.
                    </div>

                </div>

                <div class="modal-footer">
                    <button type="button"
                            class="btn btn-secondary"
                            data-bs-dismiss="modal">
                        Annuler
                    </button>
                    <button type="submit"
                            class="btn btn-primary">
                        Enregistrer
                    </button>
                </div>
            </form>

        </div>
    </div>
</div>

<script>
function resetForm(){
    document.getElementById("id").value = "";
    document.getElementById("quantiteAjoute").value = "";
}
</script>

<jsp:include page="../footer.jsp" />