<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../header.jsp" />

<div class="container mt-5">

    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2>Gestion des Commandes</h2>
        <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#commandeModal" onclick="resetForm()">
            + Ajouter
        </button>
    </div>

    <div class="card shadow">
        <div class="card-body">
            <table class="table table-hover align-middle">
                <thead class="table-light">
                    <tr>
                        <th>ID</th>
                        <th>Commercial</th>
                        <th>Nom Client</th>
                        <th>Montant Total</th>
                        <th>État</th>
                        <th>Date</th>
                        <th class="text-end">Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="c" items="${commandes}">
                        <tr>
                            <td>${c.id}</td>
                            <td>${c.user.nom}</td>
                            <td>${c.nomClient}</td>
                            <td>${c.montantTotal}</td>
                            <td>${c.etat}</td>
                            <td>${c.dateHeure}</td>
                            <td class="text-end">
                                <button class="btn btn-sm btn-warning"
                                        data-bs-toggle="modal"
                                        data-bs-target="#commandeModal"
                                        onclick="
                                            document.getElementById('id').value='${c.id}';
                                            document.getElementById('nomClient').value='${c.nomClient}';
                                            document.getElementById('montantTotal').value='${c.montantTotal}';
                                            document.getElementById('etat').value='${c.etat}';
                                        ">
                                    Modifier
                                </button>

                                <a href="${pageContext.request.contextPath}/CommandeServlet?action=delete&id=${c.id}"
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
<div class="modal fade" id="commandeModal" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">

            <div class="modal-header">
                <h5 class="modal-title">Commande</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>

            <form action="${pageContext.request.contextPath}/CommandeServlet" method="post">
                <div class="modal-body">

                    <!-- Id pour modification -->
                    <input type="hidden" id="id" name="id">

                    <!-- Nom du client (optionnel) -->
                    <div class="mb-3">
                        <label class="form-label">Nom Client</label>
                        <input type="text" id="nomClient" name="nomClient" class="form-control" required>
                    </div>

                    <!-- Montant total -->
                    <div class="mb-3">
                        <label class="form-label">Montant Total</label>
						<input type="number" step="0.01" id="montantTotal" name="montantTotal" class="form-control" readonly value="0">
                    </div>

                    <!-- Etat de la commande -->
                    <div class="mb-3">
                        <label class="form-label">État</label>
                        <select id="etat" name="etat" class="form-select">
                            <option value="en_traitement">En traitement</option>
                            <option value="valide">Valide</option>
                        </select>
                    </div>

                    <div class="alert alert-info">
                        ⚠ La date sera automatiquement remplie.
                        La commande sera assignée au commercial connecté.
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

<script>
function resetForm(){
    document.getElementById("id").value = "";
    document.getElementById("nomClient").value = "";
    document.getElementById("montantTotal").value = "0"; // <-- ici
    document.getElementById("etat").value = "en_traitement";
}
</script>

<jsp:include page="../footer.jsp" />