<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title><c:out value="${pageTitle}" /></title>

    <!-- Bootstrap CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
          rel="stylesheet">
</head>

<body class="bg-light">

<!-- ================= TOP BAR USER ================= -->
<nav class="navbar navbar-dark bg-dark px-3">
    <div class="container-fluid">

        <!-- Nom App -->
        <span class="navbar-brand mb-0 h5 text-white">
            MINI ERP
        </span>

        <!-- Infos User -->
        <div class="text-white">
            <c:if test="${not empty sessionScope.userConnecte}">
                Connecté :
                <strong>${sessionScope.userConnecte.nom}</strong>
                |
                Rôle :
                <span class="badge bg-info">
                    ${sessionScope.userConnecte.role}
                </span>

                <a href="${pageContext.request.contextPath}/LogoutServlet"
                   class="btn btn-sm btn-danger ms-3">
                    Déconnexion
                </a>
            </c:if>
        </div>

    </div>
</nav>

<!-- ================= NAVIGATION RAPIDE ================= -->
<div class="bg-light border-bottom py-2">
    <div class="container d-flex justify-content-between">

        <div>
            <button class="btn btn-outline-secondary btn-sm"
                    onclick="history.back()">
                ← Précédent
            </button>

            <button class="btn btn-outline-secondary btn-sm"
                    onclick="history.forward()">
                Suivant →
            </button>
        </div>

    </div>
</div>

