<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Gestion des Catégories</title>
    <!-- Google Font pour un style moderne -->
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
    <style>
        /* Style global */
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f7f7f7;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 900px;
            margin: 40px auto;
            background-color: #fff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.1);
        }

        h1 {
            text-align: center;
            color: #5D4037; /* marron foncé */
            margin-bottom: 30px;
        }

        /* Table */
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        th, td {
            padding: 12px 15px;
            text-align: left;
        }

        th {
            background-color: #BCAAA4; /* marron clair */
            color: #fff;
            text-transform: uppercase;
            font-weight: 500;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: #E0F7FA; /* bleu clair sur hover */
        }

        /* Boutons */
        .btn {
            padding: 8px 16px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-weight: 500;
            transition: 0.3s;
        }

        .btn-add {
            background-color: #5D4037; /* marron foncé */
            color: #fff;
            margin-bottom: 20px;
        }

        .btn-add:hover {
            background-color: #4E342E;
        }

        .btn-edit {
            background-color: #81D4FA; /* bleu clair */
            color: #000;
        }

        .btn-edit:hover {
            background-color: #4FC3F7;
        }

        .btn-delete {
            background-color: #EF9A9A; /* rouge clair */
            color: #000;
        }

        .btn-delete:hover {
            background-color: #E57373;
        }

        /* Formulaire modal */
        .modal {
            display: none;
            position: fixed;
            z-index: 10;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0,0,0,0.5);
        }

        .modal-content {
            background-color: #fff;
            margin: 10% auto;
            padding: 20px;
            border-radius: 12px;
            width: 400px;
            box-shadow: 0 6px 20px rgba(0,0,0,0.2);
        }

        .modal-header h2 {
            margin: 0;
            color: #5D4037;
        }

        .modal-footer {
            text-align: right;
        }

        .modal-footer .btn {
            margin-left: 10px;
        }

        input[type="text"] {
            width: 100%;
            padding: 10px;
            margin: 12px 0;
            border-radius: 8px;
            border: 1px solid #ccc;
            font-size: 14px;
        }

    </style>
    <script>
        function openModal(mode, id, name) {
            const modal = document.getElementById("modalForm");
            modal.style.display = "block";
            document.getElementById("modalTitle").innerText = mode === 'add' ? "Ajouter une Catégorie" : "Modifier la Catégorie";
            document.getElementById("categorieName").value = name || "";
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
            <%-- Exemple statique, tu peux remplacer par une boucle JSTL pour les données réelles --%>
            <tr>
                <td>1</td>
                <td>Électronique</td>
                <td>
                    <button class="btn btn-edit" onclick="openModal('edit', 1, 'Électronique')">Modifier</button>
                    <button class="btn btn-delete">Supprimer</button>
                </td>
            </tr>
            <tr>
                <td>2</td>
                <td>Vêtements</td>
                <td>
                    <button class="btn btn-edit" onclick="openModal('edit', 2, 'Vêtements')">Modifier</button>
                    <button class="btn btn-delete">Supprimer</button>
                </td>
            </tr>
            <tr>
                <td>3</td>
                <td>Alimentation</td>
                <td>
                    <button class="btn btn-edit" onclick="openModal('edit', 3, 'Alimentation')">Modifier</button>
                    <button class="btn btn-delete">Supprimer</button>
                </td>
            </tr>
        </tbody>
    </table>
</div>

<!-- Modal pour Ajouter / Modifier -->
<div id="modalForm" class="modal">
    <div class="modal-content">
        <div class="modal-header">
            <h2 id="modalTitle">Ajouter une Catégorie</h2>
        </div>
        <form action="CategorieServlet" method="post">
            <input type="hidden" id="categorieId" name="id" />
            <label for="categorieName">Nom :</label>
            <input type="text" id="categorieName" name="name" placeholder="Nom de la catégorie" required />

            <div class="modal-footer">
                <button type="button" class="btn btn-delete" onclick="closeModal()">Annuler</button>
                <button type="submit" class="btn btn-add">Enregistrer</button>
            </div>
        </form>
    </div>
</div>

</body>
</html>