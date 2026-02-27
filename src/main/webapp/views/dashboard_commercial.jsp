<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="header.jsp" />

<div class="container mt-4">

    <h2 class="mb-4 text-success">Dashboard COMMERCIAL</h2>

    <div class="row">

        <div class="col-md-3">
            <div class="list-group">
                <a href="../CommandeServlet" class="list-group-item list-group-item-action">
                    🧾 Mes Commandes
                </a>

            </div>
        </div>

        <div class="col-md-9">
            <div class="card shadow">
                <div class="card-body">
                    <h4>Bienvenue COMMERCIAL 💼</h4>
                    <p>
                        Vous pouvez gérer vos commandes et ajouter des articles.
                    </p>
                </div>
            </div>
        </div>

    </div>

</div>

<jsp:include page="footer.jsp" />