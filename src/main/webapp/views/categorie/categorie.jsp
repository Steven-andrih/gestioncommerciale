<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<jsp:include page="../header.jsp" />

<div class="container mt-5">

    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2>Gestion des Catégories</h2>
        <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#categorieModal">
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
                        <th class="text-end">Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="c" items="${categories}">
                        <tr>
                            <td>${c.id}</td>
                            <td>${c.nomCategorie}</td>
                            <td class="text-end">
                                <button 
                                    class="btn btn-sm btn-warning"
                                    data-bs-toggle="modal"
                                    data-bs-target="#categorieModal"
                                    onclick="document.getElementById('id').value='${c.id}';
                                             document.getElementById('nom').value='${c.nomCategorie}'">
                                    Modifier
                                </button>

                                <a href="${pageContext.request.contextPath}/CategorieServlet?action=delete&id=${c.id}" 
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

<!-- Modal Bootstrap -->
<div class="modal fade" id="categorieModal" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">

            <div class="modal-header">
                <h5 class="modal-title">Catégorie</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>

            <form action="${pageContext.request.contextPath}/CategorieServlet" method="post">
                <div class="modal-body">

                    <input type="hidden" id="id" name="id">

                    <div class="mb-3">
                        <label class="form-label">Nom de la catégorie</label>
                        <input type="text" id="nom" name="nomCategorie" 
                               class="form-control" 
                               placeholder="Nom..." required>
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