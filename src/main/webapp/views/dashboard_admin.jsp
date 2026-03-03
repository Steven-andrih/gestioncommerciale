<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="header.jsp" />

<div class="container mt-4">

    <h2 class="mb-4 text-primary">Dashboard ADMIN</h2>

    <div class="row">

        <div class="col-md-3">
            <div class="list-group">
                <a href="../CategorieServlet" class="list-group-item list-group-item-action">
                    📂 Gestion Catégories
                </a>
                <a href="../ProduitServlet" class="list-group-item list-group-item-action">
                    📦 Gestion Produits
                </a>
                <a href="../ApprovisionnementServlet" class="list-group-item list-group-item-action">
                    🚚 Approvisionnement
                </a>
                <a href="../CommandeServlet" class="list-group-item list-group-item-action">
                    🧾 Toutes les Commandes
                </a>

            </div>
        </div>

        <div class="col-md-9">
            <div class="card shadow">
                <div class="card-body">
                    <h4>Bienvenue ${sessionScope.userConnecte.nom} 👑</h4>
                    <p>
                        Vous avez accès à la gestion complète du système MiniERP.
                    </p>
                </div>
            </div>
        </div>

    </div>

</div>

<jsp:include page="footer.jsp" />