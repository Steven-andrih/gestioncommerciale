<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page session="true" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="d" uri="http://java.sun.com/jsp/jstl/core" %>

<d:set var="pageTitle" value="Gestion des Catégories" />

<jsp:include page="../header.jsp" />
    <script>
        function openModal(mode, id, name) {
            const modal = document.getElementById("modalForm");
            modal.style.display = "block";
            document.getElementById("modalTitle").innerText = mode === 'add' ? "Ajouter une Catégorie" : "Modifier la Catégorie";
            document.getElementById("nomCategorie").value = name || "";
            document.getElementById("categorieId").value = id || "";
        }

        function closeModal() {
            document.getElementById("modalForm").style.display = "none";
        }

        window.onclick = function(event) {
            const modal = document.getElementById("modalForm");
            if(event.target === modal) {
                closeModal();
            }
        }
    </script>
</head>
<body>
<div class="container">
    <h1>Gestion des Catégories</h1>

    <button class="btn btn-add" onclick="openModal('add')">+ Ajouter une catégorie</button>

    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Nom de la catégorie</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
<c:forEach var="c" items="${categories}">
    <tr>
        <td>${c.id}</td>
        <td>${c.nomCategorie}</td>
        <td>
            <button class="btn btn-edit"
                onclick="openModal('edit', '${c.id}', '${c.nomCategorie}')">
                Modifier
            </button>

            <a href="${pageContext.request.contextPath}/CategorieServlet?action=delete&id=${c.id}">
                <button class="btn btn-delete">Supprimer</button>
            </a>
        </td>
    </tr>
</c:forEach>
</tbody>
    </table>
</div>

<!-- Modal pour Ajouter / Modifier -->
<div id="modalForm" class="modal">
    <div class="modal-content">
        <div class="modal-header">
            <h2 id="modalTitle">Ajouter une Catégorie</h2>
        </div>
        <form action="${pageContext.request.contextPath}/CategorieServlet" method="post">
            <input type="hidden" id="categorieId" name="id" />
            <label for="nomCategorie">Nom :</label>
            <input type="text" id="nomCategorie" name="nomCategorie" placeholder="Nom de la catégorie" required />

            <div class="modal-footer">
                <button type="button" class="btn btn-delete" onclick="closeModal()">Annuler</button>
                <button type="submit" class="btn btn-add">Enregistrer</button>
            </div>
        </form>
    </div>
</div>

<jsp:include page="../footer.jsp" />