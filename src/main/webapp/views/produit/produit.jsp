<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page session="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../header.jsp" />

<div class="container">
    <h1>Gestion des Produits</h1>

    <!-- ===== FORMULAIRE D'AJOUT ===== -->
    <c:if test="${param.id == null}">
        <h2>Ajouter un produit</h2>
        <form action="${pageContext.request.contextPath}/ProduitServlet" method="post">
            <label>Nom :</label>
            <input type="text" name="nomProduit" required />

            <label>Catégorie :</label>
            <select name="idCategorie" required>
                <c:forEach var="c" items="${categories}">
                    <option value="${c.id}">${c.nomCategorie}</option>
                </c:forEach>
            </select>

            <label>Quantité :</label>
            <input type="number" name="quantite" />

            <label>Prix :</label>
            <input type="number" step="0.01" name="prixUnite" required />

            <label>Unité :</label>
            <select name="unite">
                <option value="KG">KG</option>
                <option value="Unité">Unité</option>
            </select>

            <br><br>
            <button type="submit" class="btn btn-add">Enregistrer</button>
        </form>
    </c:if>

    <hr>

    <!-- ===== LISTE DES PRODUITS ===== -->
    <table>
        <thead>
            <tr>
                <th>ID</th><th>Nom</th><th>Catégorie</th>
                <th>Quantité</th><th>Prix</th><th>Unité</th><th>Actions</th>
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
                    <td>
                        <!-- Modifier -->
                        <a href="?id=${p.id}
                            &nomProduit=${p.nomProduit}
                            &idCategorie=${p.categorie.id}
                            &quantite=${p.quantite}
                            &prixUnite=${p.prixUnite}
                            &unite=${p.unite}">
                            <button type="button" class="btn btn-edit">Modifier</button>
                        </a>

                        <!-- Supprimer -->
                        <a href="ProduitServlet?action=delete&id=${p.id}">
                            <button type="button" class="btn btn-delete">Supprimer</button>
                        </a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <!-- ===== MODALE MODIFICATION ===== -->
    <c:if test="${param.id != null}">
        <style>
/* Fond semi-transparent */
.modal-background {
    position: fixed;
    top: 0; left: 0;
    width: 100%; height: 100%;
    background-color: rgba(0,0,0,0.4);
    z-index: 1000; /* au-dessus du reste */
}

/* Boîte modale */
.modal {
    position: fixed;
    top: 50%; left: 50%;
    transform: translate(-50%, -50%);
    background-color: #fff;
    border-radius: 8px;
    padding: 20px;
    z-index: 1001; /* au-dessus du fond */
    box-shadow: 0 5px 20px rgba(0,0,0,0.5);
    max-width: 400px;
    width: 90%;
}

/* Style général */
.modal h2 {
    margin-top: 0;
}

.modal label {
    display: block;
    margin-top: 10px;
}

.modal input, .modal select {
    width: 100%;
    padding: 5px;
    margin-top: 5px;
}

.modal button {
    margin-top: 15px;
    width: 100%;
    padding: 8px;
    background-color: #4CAF50;
    color: white;
    border: none;
    cursor: pointer;
}

.modal button:hover {
    background-color: #45a049;
}
</style>

        <div class="modal-background"></div>
        <div class="modal">
            <h2>Modifier le produit</h2>
            <form action="${pageContext.request.contextPath}/ProduitServlet" method="post">
                <input type="hidden" name="id" value="${param.id}" />

                <label>Nom :</label>
                <input type="text" name="nomProduit" value="${param.nomProduit}" required />

                <label>Catégorie :</label>
<select name="idCategorie" required>
    <c:forEach var="c" items="${categories}">
        <option value="${c.id}"
            <c:if test="${param.idCategorie == c.id.toString()}">selected</c:if>>
            ${c.nomCategorie}
        </option>
    </c:forEach>
</select>

                <label>Quantité :</label>
                <input type="number" name="quantite" value="${param.quantite}" />

                <label>Prix :</label>
                <input type="number" step="0.01" name="prixUnite" value="${param.prixUnite}" required />

                <label>Unité :</label>
                <select name="unite">
                    <option value="KG" <c:if test="${param.unite == 'KG'}">selected</c:if>>KG</option>
                    <option value="Unité" <c:if test="${param.unite == 'Unité'}">selected</c:if>>Unité</option>
                </select>

                <br><br>
                <button type="submit" class="btn btn-add">Enregistrer</button>
            </form>
        </div>
    </c:if>
</div>

<jsp:include page="../footer.jsp" />